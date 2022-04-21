using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WiredFixtureBase : MonoBehaviour
{
	protected WiredPath _parentPath = null;
	public WiredPath ParentPath => _parentPath;
	public bool IsWired => _parentPath != null;

	protected int _pathIndex = -1; 
	public int PathIndex => _pathIndex;

	public void WireToPath(WiredPath path, int index = -1)
	{
		_pathIndex = index;
		_parentPath = path;
	}

	public void RemoveFromPath()
	{
		_pathIndex = -1;
		_parentPath = null;
		SetWireVisState(WiredPath.EPathVisState.Hidden);
	}

	public virtual Vector3 GetPosition()
	{
		return transform.position;
	}

	public virtual void SetWireVisState(WiredPath.EPathVisState vis)
	{
		// nothing in base class
	}
}
