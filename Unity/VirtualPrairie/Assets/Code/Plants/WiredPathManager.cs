using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WiredPathManager : MonoBehaviour
{
	static private WiredPathManager s_instance;
	static public WiredPathManager Instance => s_instance;

	public List<WiredPath> Paths = new List<WiredPath>();
	public GameObject WiredPathFab;

	public static WiredPath NewPathInstance()
	{
		GameObject go = GameObject.Instantiate(Instance.WiredPathFab);
		return go.GetComponent<WiredPath>();
	}

	public string NextPathName()
	{
		return $"Path{Paths.Count.ToString()}";
	}

	void Awake()
	{
		s_instance = this;
	}

	public void DeletePath(WiredPath path)
	{
		if (Paths.Contains(path))
		{
		
			path.ClearPath();
			Paths.Remove(path);
		}
	}

	public void ClearAllPaths()
	{
		HideAllPaths();
		foreach (var p in Paths)
		{
			p.ClearPath();
		}
		Paths.Clear();
	}

	public void NotifyNewLayout()
	{
		if (PlantSelectionManager.Instance.IsWiring())
		{
			PlantSelectionManager.Instance.NotifyRereshWiring();
		}
	}

	public void ShowAllPaths()
	{
		foreach (var path in Paths)
		{
			path.SetVisibility(WiredPath.EPathVisState.Visible);
		}
	}
	public void HideAllPaths()
	{
		foreach (var path in Paths)
		{
			path.SetVisibility(WiredPath.EPathVisState.Hidden);
		}
	}

	public bool PathExists(WiredPath p)
	{
		return Paths.Contains(p);
	}

	public void AddPath(WiredPath p)
	{
		if (Paths.Contains(p))
			return;

		Paths.Add(p);
	}


}
