using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName="ArmTagModFilter",menuName = "Prairie Filters/Arm Tag Mod Filter")]
public class ArmTagModFilter : PatternPointFilterBase
{
	public EArmTagType ArmType = EArmTagType.ArmCW;
	public int ModVal;
	public bool Invert = false;

	public override bool AllowPoint(StemColorManager point)
	{
		if (Invert)
			return ((point.PrimaryArmTagId(ArmType)%ModVal) != 0);
		else
			return ((point.PrimaryArmTagId(ArmType)%ModVal) == 0);
	}
}
