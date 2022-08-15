using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class ArmRangeEntry
{
	[Range(1,40)]
	public int MinId;
	[Range(1,40)]
	public int MaxId;
}

[CreateAssetMenu(fileName="ArmTagRangeFilter",menuName = "Prairie Filters/Arm Tag Range Filter")]
public class ArmTagRangeFilter : PatternPointFilterBase
{
	public EArmTagType ArmType = EArmTagType.ArmCW;
	public List<ArmRangeEntry> Ranges = new List<ArmRangeEntry>();
	
	public override bool AllowPoint(StemColorManager point)
	{
		foreach (var range in Ranges)
		{
			int start = range.MinId;
			int end = range.MaxId;

			if (range.MinId > range.MaxId)
			{
				start = range.MaxId;
				end = range.MinId;
			}

			for (int i = start; i <= end; i++)
			{
				if (point.HasArmTagID(ArmType,i))
					return true;
			}
		}

		return false;
	}
}
