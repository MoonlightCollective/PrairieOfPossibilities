using System.Collections;
using System.Collections.Generic;

class FixtureData
{
	public string label;
	public string comment;
	public List<FixtureItemData> children;
	public List<FixtureOutputItemData> outputs;
	public List<WirePathData> wirePaths;
	public List<PortalItemData> portals;
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
}

class WirePathData
{
	public string pathId;
	public string artnetHost;
	public int universe;
	public int channelStart;
	public List<WirePathItemData> items;
}

class PortalItemData
{
	public float x;
	public float z;
}