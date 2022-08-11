using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WiredFixtureBase : MonoBehaviour
{
	protected WiredPath _parentPath = null;
	public WiredPath ParentPath => _parentPath;
	public bool IsWired => _parentPath != null;

	// zero based index relative to this path
	protected int _pathIndex = -1; 
	public int PathIndex => _pathIndex;

	public virtual string FixtureType => "GenericFixture";
	public virtual int FixtureId => -1;

	protected float _fixtureRandomOffset = 0f;
	public float FixtureRandomOffset => _fixtureRandomOffset;

	// normally the fixture will just take its channel start from the run of the wirepath.
	// this allows us to "sub in" a new fixture base if we have to, and get into trouble
	// with bad equipment.  normally do not use this and let the wirepath run logic handle it
	protected int _channelStartOverride = -1;
	public int ChannelStartOverride => _channelStartOverride;

	public virtual void Awake()
	{
		_fixtureRandomOffset = Random.Range(0f,1f);
	}
	public virtual void WireToPath(WiredPath path, int index, int ChannelStartOverride = -1)
	{
		_pathIndex = index;
		_parentPath = path;
		_channelStartOverride = ChannelStartOverride;
	}

	public virtual void RemoveFromPath()
	{
		_pathIndex = -1;
		_parentPath = null;
		SetWireVisState(WiredPath.EPathVisState.Hidden);
	}

	public virtual Vector3 GetPosition()
	{
		return transform.position;
	}

	public virtual void NotifyEnterWiringMode()
	{
		
	}

	public virtual void NotifyExitWiringMode()
	{
		
	}

	public virtual void SetWireVisState(WiredPath.EPathVisState vis)
	{
		// nothing in base class
	}

	public virtual List<StemColorManager> FixtureStems()
	{
		return new List<StemColorManager>();
	}
}
