using System.Collections;
using System.Collections.Generic;
using UnityEngine;

class FixtureData
{
	public string label;
	public string comment;
	public List<FixtureItemData> children;
	public List<FixtureOutputItemData> outputs;
	public List<WirePathData> wirePaths;
	public List<PortalItemData> portals;
	public List<BoothItemData> booths;
}

class FixtureItemData
{
	public float x;
	public float z;
	public List<string> tags;
}

class FixtureOutputsData
{
	public List<FixtureOutputItemData> items;
}

class FixtureOutputItemData
{
	public string host;
	public int start;
	public int universe;
	public int num;
	public List<FixtureOputputSegmentData> segments;
}

class FixtureOputputSegmentData
{
	public int start;
	public int num;
}

class WirePathItemData
{
	public string FixtureType;
	public int FixtureId;
	public int PathId;
	// normally the fixture will just take its channel start from the run of the wirepath.
	// this allows us to "sub in" a new fixture base if we have to, and get into trouble
	// with bad equipment.  normally do not use this and let the wirepath run logic handle it
	public int ChannelStartOverride;
}

class WirePathData
{
	public string pathId;
	public string artnetHost;
	public int universe;
	public int channelStart;
	public List<WirePathItemData> items;
}

class RotData
{
	public float rotX;
	public float rotY;
	public float rotZ;

	public RotData()
	{
		rotX = 0;
		rotY = 0;
		rotZ = 0;
	}

	public RotData(Transform sourceRot)
	{
		Vector3 eulers = sourceRot.eulerAngles;
		rotX = eulers.x;
		rotY = eulers.y;
		rotZ = eulers.z;
	}

	public RotData(float x,float y, float z)
	{
		rotX = x;
		rotY = y;
		rotZ = z;
	}
	public Quaternion QuaternionFromRot()
	{
		return Quaternion.Euler(rotX,rotY,rotZ);
	}
}

class PortalItemData
{
	public string portalId;
	public float x;
	public float z;
	public RotData rotation;
}

class BoothItemData
{
	public string boothId;
	public float x;
	public float z;
	public RotData rotation;
}