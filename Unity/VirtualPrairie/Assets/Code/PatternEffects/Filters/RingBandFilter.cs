using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName="RingBandFilter",menuName = "Prairie Filters/Ring Band Filter")]
public class RingBandFilter : PatternPointFilterBase
{
	
	public string Name = "Band";
	public float MinRadiusM = 0;
	public float MaxRadiusM = 10;
	bool Invert = false;
	public override bool AllowPoint(StemColorManager point)
	{
		if (Invert)
			return !(point.GlobalDistFromOrigin >= MinRadiusM && point.GlobalDistFromOrigin <= MaxRadiusM);
		else
			return (point.GlobalDistFromOrigin >= MinRadiusM && point.GlobalDistFromOrigin <= MaxRadiusM);
	}
}
