using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class PrairieTag
{
	public string Name;
	public bool RuntimeOnly = false;
	public PrairieTag()
	{
		Name = "DefaultTag";
		RuntimeOnly = false;
	}
	public PrairieTag(string newTagName)
	{
		Name = newTagName;
		RuntimeOnly = false;
	}
	public PrairieTag(string newTagName, bool runtimeOnly)
	{
		Name = newTagName;
		RuntimeOnly = runtimeOnly;
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

		// gather all the tags from the fixtures imported
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

		applyFilterTagsToStems();
	}


	void applyFilterTagsToStems()
	{
		// first look for all filters the patterns we might possible want to use.
		var allLayers = GameObject.FindObjectsOfType<PrairiePatternLayer>(true);
		HashSet<PatternPointFilterBase> foundPatternFilters = new HashSet<PatternPointFilterBase>();
		foreach (PrairiePatternLayer layer in allLayers)
		{
			if (layer.PointFilter != null)
			{
				foundPatternFilters.Add(layer.PointFilter);
			}
		}

		// now go through all the filters and find filters that require
		// "fuzzy" (aka substring) matching patterns.

		List<string> fuzzyStrings = new List<string>();
		foreach (var filter in foundPatternFilters)
		{
			// only matters for tag filters, which have strings
			if (filter is PatternFixtureTagFilter)	
			{
				PatternFixtureTagFilter pftf = ((PatternFixtureTagFilter)filter);
				if (!pftf.PerfectMatch)
				{
					foreach (string fuzzyTag in pftf.RequiredTags)
					{
						if (!fuzzyStrings.Contains(fuzzyTag))
							fuzzyStrings.Add(fuzzyTag);
					}
				}
			}
		}

		// Now we have a list of tags that we want to do fuzzy matching on.
		// If that fuzzy pattern actually matches, let's just add an explicit tag 
		// that contains the fuzzy tag pattern on the light itself.
		// These only get applied at the stem level
		foreach (var p in PrairieUtil.Points)
		{
			foreach (var fuzzyTag in fuzzyStrings)
			{
				p.AddTag(fuzzyTag);
			}
		}
	}
}
