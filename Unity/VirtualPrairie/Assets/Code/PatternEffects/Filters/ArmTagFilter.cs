using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName="ArmTagFilter",menuName = "Prairie Filters/Arm Tag Filter")]
public class ArmTagFilter : PatternPointFilterBase
{
	public EArmTagType ArmType = EArmTagType.ArmCW;
	public List<int> Ids = new List<int>();

	public EFixtureFilterOpMode FilterOpMode;

	public override bool AllowPoint(StemColorManager point)
	{
		switch (FilterOpMode)
		{
			case EFixtureFilterOpMode.All:
				return allowPointAll(point);
			case EFixtureFilterOpMode.Any:
			default:
				return allowPointAny(point);
		}
	}

	public bool allowPointAll(StemColorManager p)
	{
		foreach (int id in Ids)
		{
			if (!p.HasArmTagID(ArmType,id))
				return false;
		}
		return true;
	}

	public bool allowPointAny(StemColorManager p)
	{
		foreach (int id in Ids)
		{
			if (p.HasArmTagID(ArmType,id))
				return true;
		}

		return false;
	}
}
