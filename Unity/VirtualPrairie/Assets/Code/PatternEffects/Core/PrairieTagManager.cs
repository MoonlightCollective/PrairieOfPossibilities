using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class PrairieTag
{
	public string Name;
	public PrairieTag()
	{
		Name = "DefaultTag";
	}
	public PrairieTag(string newTagName)
	{
		Name = newTagName;
	}
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

	public List<string> DefaultTags = new List<string>();
	public List<PrairieTag> Tags = new List<PrairieTag>();

	public void Awake()
	{
		addDefaultTags();
		s_instance = this;
	}

	public void AddTag(string newTag)
	{
		if (!TagExists(newTag))	
		{
			Tags.Add(new PrairieTag{Name = newTag});
		}
		Tags.Sort((a,b)=>a.Name.CompareTo(b.Name));
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

	public void addDefaultTags()
	{
		foreach (var defaultTag in DefaultTags)
		{
			AddTag(defaultTag);
		}
	}

	public void NotifyNewLayout()
	{
		Tags.Clear();
		addDefaultTags();

		Transform layoutRoot = PrairieUtil.GetLayoutRoot().transform;
		HashSet<string> newTags = new HashSet<string>();
		foreach (Transform child in layoutRoot)
		{
			PlantColorManager pcm = child.GetComponent<PlantColorManager>();
			if (pcm != null)
			{
				foreach (var t in pcm.FixtureTags)
				{
					newTags.Add(t.Name);
				}
			}
		}

		foreach (var newTag in newTags)
		{
			AddTag(newTag);
		}

		UITagPanel.Instance.NotifyTagListChanged();
	}
}
