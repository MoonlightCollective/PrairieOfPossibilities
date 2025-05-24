using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WiredPathManager : MonoBehaviour
{
	static private WiredPathManager s_instance;
	static public WiredPathManager Instance
	{
		get 
		{
			if (s_instance == null)
			{
				s_instance = GameObject.FindObjectOfType<WiredPathManager>();
			}
			return s_instance;
		}
	}

	public List<WiredPath> Paths = new List<WiredPath>();
	public GameObject WiredPathFab;
	GameObject _rootObj;
	int nextIP = 220;
	int nextUniverse = 1;
	int nextPath = 0;


	public static WiredPath NewPathInstance()
	{
		GameObject go = GameObject.Instantiate(Instance.WiredPathFab);
		WiredPath newPath = go.GetComponent<WiredPath>();
		newPath.PathId = Instance.nextPath.ToString();
		Instance.nextPath += 1;
		
		newPath.ArtnetHost = "192.168.0." + Instance.nextIP.ToString();
		newPath.Universe = Instance.nextUniverse;
		if (Instance.nextUniverse >= 4)
		{
			Instance.nextUniverse = 1;
			Instance.nextIP += 1;
		}
		else
		{
			Instance.nextUniverse += 1;
		}
		return newPath;
	}

	void Awake()
	{
		s_instance = this;
		_rootObj = new GameObject("WiredPathRoot");
		_rootObj.transform.position = Vector3.zero;
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
		Debug.Log("Clear All Paths");
		HideAllPaths();
		foreach (var p in Paths)
		{
			p.ClearPath();
		}
		Paths.Clear();
		foreach (Transform child in _rootObj.transform)
		{
			// safe because it's deferred a frame.
			GameObject.Destroy(child.gameObject);
		}
		_rootObj.transform.DetachChildren();
		nextIP = 220;
		nextUniverse = 1;
		nextPath = 0;
	}

	public void NotifyNewLayout()
	{
		Debug.Log("New Layout Detected");
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
			if (path != null)
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
		p.transform.SetParent(_rootObj.transform,false);
	}


}
