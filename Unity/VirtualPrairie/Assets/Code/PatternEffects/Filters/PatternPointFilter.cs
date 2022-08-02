using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

public abstract class PatternPointFilterBase : ScriptableObject
{
	public abstract bool AllowPoint(StemColorManager point);
}

public enum EStemTags
{
	Inner,
	Outer
}

[CreateAssetMenu(fileName="PointFilter", menuName = "Prairie Filters/Point Filter")]
public class PatternPointFilter : PatternPointFilterBase
{
	public enum EPatternPointFilterType
	{
		All,
		PointTag,
		None,
	}

	public EPatternPointFilterType FilterType = EPatternPointFilterType.All;

	[EnableIf("FilterType", EPatternPointFilterType.PointTag)]
	public EStemTags PointTag = EStemTags.Inner;

	public override bool AllowPoint(StemColorManager point)
	{
		switch (FilterType)
		{
			case EPatternPointFilterType.All:
			default:
				return true;
			case EPatternPointFilterType.None:
				return false;
			case EPatternPointFilterType.PointTag:
				return point.HasTag(PointTag.ToString());
		}
	}
}
