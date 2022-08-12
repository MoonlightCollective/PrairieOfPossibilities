using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName="MultiFilter",menuName = "Prairie Filters/Multi-Filter")]
public class MultiFilter : PatternPointFilterBase
{
	public List<PatternPointFilterBase> Filters;
	public EFixtureFilterOpMode FilterOpMode;

	public override bool AllowPoint(StemColorManager point)
	{
		if (Filters.Count < 1)
			return true;

		switch (FilterOpMode)
		{
			case EFixtureFilterOpMode.All:
				return allowPointAll(point);
			case EFixtureFilterOpMode.Any:
				return allowPointAny(point);
		}

		return true;
	}

	protected bool allowPointAny(StemColorManager p)
	{
		foreach (var f in Filters)
		{
			// if any filter allows, we all allow.
			if (f.AllowPoint(p))
				return true;
		}
		
		// didn't find one that allowed it.
		return false;
	}

	protected bool allowPointAll(StemColorManager p)
	{
		foreach (var f in Filters)
		{
			if (!f.AllowPoint(p))
			{
				// if any filter fails, we all fail.
				return false;
			}
		}

		// no filters failed.
		return true;
	}


}
