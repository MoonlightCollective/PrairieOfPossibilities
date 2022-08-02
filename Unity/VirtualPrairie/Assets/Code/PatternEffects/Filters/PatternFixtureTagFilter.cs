using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[System.Serializable]
public enum EFixtureFilterOpMode
{
	Any,
	All,
}

[CreateAssetMenu(fileName="FixtureTagFilter", menuName = "Prairie Filters/Fixture Tag Filter")]
public class PatternFixtureTagFilter : PatternPointFilterBase
{
	public bool PerfectMatch = true;
	public EFixtureFilterOpMode OperationMode;
	public List<string> RequiredTags;

	public override bool AllowPoint(StemColorManager point)
	{
		if (RequiredTags.Count < 1)
			return true;

		switch(OperationMode)
		{
			case EFixtureFilterOpMode.Any:
				return doAnyCheck(point);
			case EFixtureFilterOpMode.All:
				return doAllCheck(point);
		}
		
		return true;
	}

	bool doAllCheck(StemColorManager point)
	{
		foreach (var tag in RequiredTags)
		{
			// -eja fuzzy matching now handled by new fixture import processing
			// if (!point.HasTag(tag,!PerfectMatch))
			if (!point.HasTag(tag))
			{
				return false;
			}
		}

		return true;
	}

	bool doAnyCheck(StemColorManager point)
	{
		foreach (var tag in RequiredTags)
		{
			// -eja fuzzy matching now handled by new fixture import processing
			// if (point.HasTag(tag,!PerfectMatch))
			if (point.HasTag(tag))
			{
				return true;
			}
		}

		return false;
	}
}
