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

	public virtual void Awake()
	{
		_fixtureRandomOffset = Random.Range(0f,1f);
	}
	public virtual void WireToPath(WiredPath path, int index = -1)
	{
		_pathIndex = index;
		_parentPath = path;
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
