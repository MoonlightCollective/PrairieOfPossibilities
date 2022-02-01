using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Net;
using System.Net.Sockets;
using ArtNet.Sockets;
using ArtNet.Packets;
using System;


// PrairieDmxController is mostly a copy of the receiving parts of the DmxController from the Artnet.Unity package 
// downloaded from github. 
public class PrairieDmxController : MonoBehaviour
{
	// how many channels per point (per LED)
	public int ChannelsPerPoint = 3;

	// how many universes to allocate? We're allocating static buffers and copying into them
	// so that we can avoid lots of memory allocation at runtime - but also in case data comes 
	// in while we are using the previous frame. Make sure there's enough for the universes you're
	// going to transmit. Currently assumes a single IP target for all universes. Future effort will
	// create an IP->Universes mapping, so you can the same universe ID associated with different
	// target IP addresses.
	public int UniverseCount = 10;

	bool _initialized = false;
	private ArtNetSocket _artNet;

	// A mapping from Universe to all the Points in that universe.
	// Points themselves are mapped in a dictionary that maps Point Index -> DmxColorPoint.  
	// Using dictionaries, because we may not have contguous ranges of devices in a universe, or contiguous universes
	// themselves. Might speed things up if we used lists or arrays instead and just skipped unused elements.
	Dictionary<int,Dictionary<int,DmxColorPoint>> _universeDeviceMap = new Dictionary<int, Dictionary<int, DmxColorPoint>>();

	// A mapping of universe to byte array containing the most recently received ArtNet data for that universe.
	// ArtNet sends a whole universe worth of data in a single packet.
	List<byte[]> _universeDataMap = new List<byte[]>();


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

			_universeDeviceMap.Clear();
			buildUniverseMap();
		}
	}

	// doInit() - ArtNet setup.
	private bool doInit()
	{
		_artNet = new ArtNetSocket();
		_artNet.Open(ipFromHostname("localhost"), null);
		_artNet.NewPacket += handleNewPacket;

		// Set up ArtNet and register our event handler.
		_universeDataMap.Clear();
		for (int i = 0; i < UniverseCount; i++)
		{
			// create an array for each universe that will hold the data 
			// we get from packets.
			_universeDataMap.Add(new byte[512]);
		}
		return true;
	}

	// handleNewPacket() - called when ArtNet receives new data. Not sure if this
	// is threaded, but definitely doesn't happen in sync with Update loop.
	private void handleNewPacket(object sender, NewPacketEventArgs<ArtNetPacket> e)
	{
		var sourceEndpoint = e.Source;
		
		// make sure it's an ArtNet packet.
		if (e.Packet.OpCode == ArtNet.Enums.ArtNetOpCodes.Dmx)
		{
			var packet = e.Packet as ArtNetDmxPacket;
			var data = packet.DmxData;
			
			var universe = packet.Universe;
			// Debug.Log($"Received Packet from {sourceEndpoint.Address.ToString()}: u: {universe}");
			if (!_universeDeviceMap.ContainsKey(universe))
			{
				Debug.LogWarning($"Ignoring dmx data for universe {universe} - don't have any points in our layout for that universe");
			}

			// Copy the data over to our universeDataMap. Copy so that new data can come in 
			// asynchronously into the packet data buffers.
			data.CopyTo(_universeDataMap[universe],0);
		}
	}

	
	// Update() - go through all our universes and send the latest data to each 
	//				of the points that need to get updated.
	public void Update()
	{
		// let's send all our data long to each of our fixtures
		for (int u = 0; u < UniverseCount; u++)
		{
			// make sure we have devices in this universe.
			if (_universeDeviceMap.ContainsKey(u))
			{
				// go through dmx data, 3 points at a time, and set the apprpriate data in the device map
				for (int c = 0; c < (_universeDataMap[u].Length - ChannelsPerPoint); c += ChannelsPerPoint)
				{
					// figure out which point this channel data will fill in
					int pointDex = c/ChannelsPerPoint;
					
					// grab a reference to the one Point worth of channel data (without copying it) and send it 
					// along to the point device so it can change its color accordingly.
					ArraySegment<byte> dataSeg = new ArraySegment<byte>( _universeDataMap[u], c, ChannelsPerPoint);

					if (_universeDeviceMap[u].ContainsKey(pointDex))
					{
						_universeDeviceMap[u][pointDex].SetFromDmx(dataSeg);
					}
				}
			}
		}
	}

	// buildUniverseMap() - find all the devices and set up a mapping from universe,pointID -> device that can respond and change color
	//
	private void buildUniverseMap()
	{
		// THIS IS SLOW. Only perform this at startup, or if the layout has changed.
		DmxColorPoint[] colorPoints = GameObject.FindObjectsOfType<DmxColorPoint>();
		foreach (var colorPoint in colorPoints)
		{
			int u = colorPoint.Universe;
			if (!_universeDeviceMap.ContainsKey(u))
			{
				// first time we encounter this universe
				_universeDeviceMap[u] = new Dictionary<int, DmxColorPoint>();
			}

			_universeDeviceMap[u][colorPoint.GlobalPointIndex] = colorPoint;
		}
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
