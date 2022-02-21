using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Net;
using System.Net.Sockets;
using ArtNet.Sockets;
using ArtNet.Packets;
using System;
// Points themselves are mapped in a dictionary that maps Point Index -> DmxColorPoint
// Using dictionaries, because we may not have contguous ranges of devices in a universe, or contiguous universes
// themselves. Might speed things up if we used lists or arrays instead and just skipped unused elements.
using UniverseMap = System.Collections.Generic.Dictionary<int,System.Collections.Generic.Dictionary<int,DmxColorPoint>>;


// PrairieDmxController is mostly a copy of the receiving parts of the DmxController from the Artnet.Unity package 
// downloaded from github. 
public class PrairieDmxController : MonoBehaviour
{
	const string localhost = "localhost";

	// how many channels per point (per LED)
	public int ChannelsPerPoint = 3;

	// We support 2 main modes for DMX
	// 	Listen: in this mode the prairie acts as a dmx controller, and listens for dmx events.
	//			another tool is driving the experience (like lx studio) and the prarie will show it
	//  Send:	in this mode the prairie will send dmx events out to the controllers.   the simulation
	//			will drive the experience and instead play to the dmx light controllers.  no lx studio required.
	//  Off:	no dmx listen or send.  a quiet prairie.
	public enum DmxSendListenMode {
		Listen,
		Send,
		Off
	}

	public DmxSendListenMode DmxMode  = DmxSendListenMode.Off;

	bool _initialized = false;
	private ArtNetSocket _artNet;

	// A mapping from controllers to universes
	Dictionary<string,UniverseMap> _controllerMap  = new Dictionary<string,UniverseMap>();

	// A mapping of universe to byte array containing the most recently received ArtNet data for that universe.
	// ArtNet sends a whole universe worth of data in a single packet.
	// Note, we only keep this for the localhost controller, used during DmxSendListenMode.Listen
	Dictionary<string,List<byte[]>> _dataMap = new Dictionary<string,List<byte[]>>();

	// startup tasks at runtime. If we want to change layout at runtime, will need to re-jigger this.
	public void Start()
	{
		if (!_initialized)
		{
			_initialized = doInit();
			if (!_initialized)
			{
				Debug.LogError("Failed to init PrairieDmxController!");
				return;
			}

			buildUniverseMap();
		}
	}

	public void SetDmxColor(Color color, string host, int universe, int pointIndex)
	{
		// are we in send mode?
		if (this.DmxMode == DmxSendListenMode.Send)
		{
			// set the local color data
			int channelIndex = pointIndex * ChannelsPerPoint;
			_dataMap[host][universe][channelIndex]   = (byte)(color.r*255f);
			_dataMap[host][universe][channelIndex+1] = (byte)(color.g*255f);
			_dataMap[host][universe][channelIndex+2] = (byte)(color.b*255f);
		}
	}

	// doInit() - ArtNet setup.
	private bool doInit()
	{
		// Set up ArtNet
		if (_artNet != null )
		{
			_artNet.Dispose();
			_artNet = null;
		}
		_artNet = new ArtNetSocket();

		// are we listening?
		if (DmxMode == DmxSendListenMode.Listen)
		{
			// bind and start listening
			// note:  only do the open when we are listening, as it appears to bind  to an adapter and
			// send mode can start to fail on machines with multiple adapters
			_artNet.Open(ipFromHostname(localhost), null);
 			//  register our event handler.
			_artNet.NewPacket += handleNewListenPacket;
		}

		return true;
	}

	// handleNewListenPacket() - called when ArtNet receives new data. Not sure if this
	// is threaded, but definitely doesn't happen in sync with Update loop.
	private void handleNewListenPacket(object sender, NewPacketEventArgs<ArtNetPacket> e)
	{
		var sourceEndpoint = e.Source;
		
		// make sure it's an ArtNet packet.
		if (e.Packet.OpCode == ArtNet.Enums.ArtNetOpCodes.Dmx)
		{
			var packet = e.Packet as ArtNetDmxPacket;
			var data = packet.DmxData;
			
			var universe = packet.Universe;
			// Debug.Log($"Received Packet from {sourceEndpoint.Address.ToString()}: u: {universe}");
						
			if (!_controllerMap.ContainsKey(localhost) || !_controllerMap[localhost].ContainsKey(universe))
			{
				Debug.LogWarning($"Ignoring dmx data for universe {universe} - don't have any points in our layout for that universe");
			}
			// Copy the data over to our universeDataMap. Copy so that new data can come in 
			// asynchronously into the packet data buffers.
			data.CopyTo(_dataMap[localhost][universe],0);
		}
	}

	
	// Update() - go through all our universes and send the latest data to each 
	//				of the points that need to get updated.
	public void Update()
	{
		// are we listening?
		if (this.DmxMode == DmxSendListenMode.Listen)
		{
			// let's send all our received dmx data to each of our fixtures
			for (int u = 0; u < _dataMap[localhost].Count; u++)
			{
				if (_controllerMap.ContainsKey(localhost))
				{
					UniverseMap universeMap = _controllerMap[localhost];
					// make sure we have devices in this universe.			
					if (universeMap.ContainsKey(u))
					{
						// go through dmx data, 3 points at a time, and set the apprpriate data in the device map
						for (int c = 0; c < (_dataMap[localhost][u].Length - ChannelsPerPoint); c += ChannelsPerPoint)
						{
							// figure out which point this channel data will fill in
							int pointDex = c/ChannelsPerPoint;
							
							// grab a reference to the one Point worth of channel data (without copying it) and send it 
							// along to the point device so it can change its color accordingly.
							ArraySegment<byte> dataSeg = new ArraySegment<byte>( _dataMap[localhost][u], c, ChannelsPerPoint);

							if (universeMap[u].ContainsKey(pointDex))
							{
								universeMap[u][pointDex].SetFromDmxColor(dataSeg);
							}
						}
					}
				} 
			}
		}
		else if (this.DmxMode == DmxSendListenMode.Send)
		{
			foreach (var host in _dataMap)
			{
				for (int u = 0; u < host.Value.Count; ++u)
				{
					ArtNetDmxPacket packet = new ArtNetDmxPacket();
					packet.Universe = (short)u;
					packet.DmxData = host.Value[u];

					IPAddress address = ipFromHostname(host.Key);
					//Debug.Log($"Sending artnet/dmx.  host:{host.Key} u:{packet.Universe}");
					_artNet.Send(packet, new IPEndPoint(address, ArtNetSocket.Port));
				}
			}
		}
	}

	// buildUniverseMap() - find all the devices and set up a mapping from universe,pointID -> device that can respond and change color
	//
	private void buildUniverseMap()
	{
		Debug.Log($"buildUniverseMap() starting");

		// clear the maps
		_controllerMap.Clear();
		_dataMap.Clear();

		// THIS IS SLOW. Only perform this at startup, or if the layout has changed.
		DmxColorPoint[] colorPoints = GameObject.FindObjectsOfType<DmxColorPoint>();
		foreach (var colorPoint in colorPoints)
		{
			string host = colorPoint.Host;
			// find the universe map for this controller
 			if (!_controllerMap.ContainsKey(host))
			{
				Debug.Log($"buildUniverseMap() adding host:{host}");
				// first time, add it to the controller map
				_controllerMap[host] = new UniverseMap();
				// and the data map
				_dataMap[host] = new List<byte[]>();
			}
			UniverseMap universeMap = _controllerMap[host];

			int u = colorPoint.Universe;
			if (!universeMap.ContainsKey(u))
			{
				Debug.Log($"buildUniverseMap() adding host:{host},universe:{u}");
				// first time we encounter this universe
				universeMap[u] = new Dictionary<int, DmxColorPoint>();
				// make sure we have space for the universe data all the way up to this universe #
				while (_dataMap[host].Count < u+1)
				{
					// dmx512 is 512 bytes
					_dataMap[host].Add(new byte[512]);
				}
			}

			// setup a link to the color point
			universeMap[u][colorPoint.GlobalPointIndex] = colorPoint;
			// make sure the color point knows how to use this controller
			colorPoint.Controller = this;
		}
		Debug.Log($"buildUniverseMap() finished");
	}

	// 
	// helper functions.
	//
	static IPAddress ipFromHostname(string hostname)
	{
		var address = IPAddress.None;
		try
		{
			if (IPAddress.TryParse(hostname, out address))
				return address;

			var addresses = Dns.GetHostAddresses(hostname);
			for (var i = 0; i < addresses.Length; i++)
			{
				if (addresses[i].AddressFamily == AddressFamily.InterNetwork)
				{
					address = addresses[i];
					break;
				}
			}
		}
		catch (System.Exception e)
		{
			Debug.LogErrorFormat(
				"Failed to find IP for :\n host name = {0}\n exception={1}",
				hostname, e);
		}
		return address;
	}
}
