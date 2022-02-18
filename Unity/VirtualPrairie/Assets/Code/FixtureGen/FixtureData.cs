using System.Collections;
using System.Collections.Generic;

class FixtureData
{
	public string label;
	public string comment;
	public List<FixtureItemData> children;
	public List<FixtureOutputItemData> outputs;
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
