using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class PrairieTag
{
	public string Name;
}

public class PrairieTagManager : MonoBehaviour
{
	static private PrairieTagManager s_instance;
	static public PrairieTagManager Instance 
	{
		get
		{
			if (s_instance == null)
				s_instance = GameObject.FindObjectOfType<PrairieTagManager>();
			return s_instance;
		}
	}

	public List<PrairieTag> Tags = new List<PrairieTag>();
	public GameObject TagRowUIFab;

	public List<string> DefaultTags = new List<string>();

	public void Awake()
	{
		foreach (var defaultTag in DefaultTags)
		{
			AddTag(defaultTag);
		}
		s_instance = this;
	}

	public void AddTag(string newTag)
	{
		if (!TagExists(newTag))	
		{
			Tags.Add(new PrairieTag{Name = newTag});
		}
	}

	public bool TagExists(string tagName)
	{
		foreach (var t in Tags)
		{
			if (t.Name == tagName)
			{
				return true;
			}
		}
		return false;
	}
}
