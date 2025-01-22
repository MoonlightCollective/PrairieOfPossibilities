using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Net;
using System.Net.Sockets;
using ArtNet.Sockets;
using ArtNet.Packets;
using System;
// Points themselves are mapped in a dictionary that maps channelStart -> DmxColorPoint
// Using dictionaries, because we may not have contguous ranges of devices in a universe, or contiguous universes
// themselves. Might speed things up if we used lists or arrays instead and just skipped unused elements.
using UniverseMap = System.Collections.Generic.Dictionary<int,System.Collections.Generic.Dictionary<int,DmxColorPoint>>;
using System.Reflection;
//using UnityEditor.Sprites;


// PrairieDmxController is mostly a copy of the receiving parts of the DmxController from the Artnet.Unity package 
// downloaded from github. 
public class PrairieDmxController : MonoBehaviour
{
	// for listen mode to work, set this to the IP address for the device listening (e.g., headset)
	const string localhost = "192.168.1.48";

	// how many channels per point (per LED)
	public static int ChannelsPerPoint = 3;	
	public static int PointsPerFixture = 7;
	public static int ChannelsPerFixture = PointsPerFixture * ChannelsPerPoint; // 21
	public static int ChannelsPerUniverse = 512;
	public static int MaxFixturesPerUniverse = 24;
	public static int MaxChannelsPerUniverse = 504;		// 24 * ChannelsPerFixture = 504 total channels.
	public static int MaxChannelStartPerUniverse = 484; // 504 total channels.  which means fixture#24 has a start of 484 (484,w/ 21 channels is 484-504)
	public static float PowerPerChannel = 0.7f; // watts used per color channel
	public static int PowerPerGenerator = 2000; // max watts each generator can put out (used to cap brightness)

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

	// Mapping to generators
	List<int> _generatorList = new List<int>();

	// A mapping of universe to byte array containing the most recently received ArtNet data for that universe.
	// ArtNet sends a whole universe worth of data in a single packet.
	Dictionary<string,List<byte[]>> _dataMap = new Dictionary<string,List<byte[]>>();
	Dictionary<string, bool> _activeList = new Dictionary<string, bool>();

	// keep track of which host is on which generator
	Dictionary<string, int> _genMap = new Dictionary<string, int>();

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
			// this is called from import now
			//buildUniverseMap();
		}
	}

	// universe and channelStart start with 1
	public void SetDmxColor(Color color, string host, int universe, int channelStart)
	{
		if (universe < 1 || channelStart < 1 || channelStart > 512)
        {
			Debug.LogError($"DmxPoint out of bounds: host {host} universe {universe} channelStart {channelStart}");
        }
		// are we in send mode?
		if (this.DmxMode == DmxSendListenMode.Send)
		{
			// set the local color data
			_dataMap[host][universe-1][channelStart-1]   = (byte)(color.r*255f);
			_dataMap[host][universe-1][channelStart] = (byte)(color.g*255f);
			_dataMap[host][universe-1][channelStart+1] = (byte)(color.b*255f);
		}
	}

	public void ReInit()
	{
		doInit();
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
			Debug.Log($"Listening on {localhost}");

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
							// grab a reference to the one Point worth of channel data (without copying it) and send it 
							// along to the point device so it can change its color accordingly.
							ArraySegment<byte> dataSeg = new ArraySegment<byte>(_dataMap[localhost][u], c, ChannelsPerPoint);

							// look it up in the map based on channelStart
							if (universeMap[u].ContainsKey(c))
							{
								universeMap[u][c].SetFromDmxColor(dataSeg);
							}
						}
					}
				}
			}
		}
		else if (this.DmxMode == DmxSendListenMode.Send)
		{
			// need to calculate total power consumption
			// if the power is too high, dim it
			// how many generators do we have?
//			int numGenerators = _generatorList.Count;
			float dimFactor = 1.0f;

//			List<float> genPower = new List<float>();
//			for (int i = 0; i < numGenerators; i++)
//			{
//				genPower.Add(0);
//			}

//			// go through every point, add up power used per generator
//			foreach (var host in _dataMap)
//			{
//				int gen = _genMap[host.Key] - 1;
//				float power = 0;

//				for (int u = 0; u < host.Value.Count; ++u)
//				{
//					byte[] dmxData = host.Value[u];
//					for (int i = 0; i < dmxData.Length; i++)
//					{
//						power += (byte)(dmxData[i]) * PowerPerChannel / 255.0f;
//					}
//				}
//                genPower[gen] += power;
////                Debug.Log($"adding power {power} from host ({host})");
//            }

//            // now see if we're using too much power, and if so, set calibration factor
//            for (int i = 0; i < numGenerators; i++)
//            {
//                if (genPower[i] > PowerPerGenerator)
//				{
//					float factor = PowerPerGenerator / genPower[i];
//					dimFactor = Math.Min(factor, dimFactor);
//                    Debug.Log($"Applying dimming factor: {dimFactor} total power: {genPower[i]}");
//                }
//            }

            foreach (var host in _dataMap)
			{
				for (int u = 0; u < host.Value.Count; ++u)
				{
					ArtNetDmxPacket packet = new ArtNetDmxPacket();
                    packet.Universe = (short)u;
					packet.DmxData = host.Value[u];

					// apply dim factor before sending
					//if (dimFactor < 1.0f)
					//{
     //                   for (int i = 0; i < packet.DmxData.Length; i++)
     //                   {
					//		packet.DmxData[i] = (byte)(packet.DmxData[i] * dimFactor);
     //                   }
     //               }

                    if (_activeList[host.Key])
					{
                        try
                        {
                            IPAddress address = ipFromHostname(host.Key);
                            // Debug.Log($"Sending artnet/dmx.  host:{host.Key} u:{packet.Universe} rgb:{packet.DmxData[0]},{packet.DmxData[1]},{packet.DmxData[2]}");
                            _artNet.Send(packet, new IPEndPoint(address, ArtNetSocket.Port));
                        }
                        catch (System.Exception e)
                        {
                            Debug.LogErrorFormat(
                                "Error sending to host name {0}\n exception={1}",
                                host.Key, e);
							_activeList[host.Key] = false;
                        }
                    }
                }
			}
		}
	}

	// buildUniverseMap() - find all the devices and set up a mapping from universe,pointID -> device that can respond and change color
	//
	public void BuildUniverseMap()
	{
		Debug.Log($"buildUniverseMap() starting");

		// clear the maps
		_controllerMap.Clear();
		_dataMap.Clear();
		_generatorList.Clear();

		// THIS IS SLOW. Only perform this at startup, or if the layout has changed.
		DmxColorPoint[] colorPoints = PrairieUtil.GetLayoutRoot().GetComponentsInChildren<DmxColorPoint>();

		// FindObjectsOfType<DmxColorPoint>();
        Debug.Log($"found {colorPoints.Length} color points");
        foreach (var colorPoint in colorPoints)
		{
			string host = colorPoint.Host;
            int generator = colorPoint.Generator;
			if (generator == -1)
			{
				Debug.LogError($"Invalid generator number for host: {host} and Universe: {colorPoint.Universe}");
			}
			else if (!_generatorList.Contains(generator))
			{
				Debug.Log($"adding Generator:{generator}");
				_generatorList.Add(generator);
			}

			// find the universe map for this controller
 			if (!_controllerMap.ContainsKey(host))
			{
				Debug.Log($"buildUniverseMap() adding host:{host}");
				// first time, add it to the controller map
				_controllerMap[host] = new UniverseMap();
				// and the data map
				_dataMap[host] = new List<byte[]>();
				// and the active list -- assume all hostnames are valid to start
				_activeList[host] = true;
				Debug.Log($"Adding gen {generator} to host {host}");
				_genMap[host] = generator;
			}
			UniverseMap universeMap = _controllerMap[host];

			int u = colorPoint.Universe - 1;		// dmx controller starts at 0, but the points start at 1
			if (!universeMap.ContainsKey(u))
			{
				Debug.Log($"buildUniverseMap() adding host:{host},universe:{u+1}");
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
			universeMap[u][colorPoint.ChannelStart-1] = colorPoint;			// first channel in the UI is 1... but array wants 0
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
