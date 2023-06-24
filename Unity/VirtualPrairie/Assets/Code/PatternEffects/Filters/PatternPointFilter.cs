using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

public abstract class PatternPointFilterBase : ScriptableObject
{
	public abstract bool AllowPoint(StemColorManager point);
}

[CreateAssetMenu(fileName="PointFilter", menuName = "Prairie Filters/Point Filter")]
public class PatternPointFilter : PatternPointFilterBase
{
	public bool Inner1 = true;
    public bool Inner2 = true;
    public bool Outer1 = true;
    public bool Outer2 = true;
    public bool Outer3 = true;
    public bool Outer4 = true;
    public bool Outer5 = true;

	public override bool AllowPoint(StemColorManager point)
	{
		switch (point.StemIndex)
		{
			case 0:
				return Inner1;
			case 1:
				return Inner2;
			case 2:
				return Outer1;
			case 3:
				return Outer2;
			case 4:
				return Outer3;
			case 5:
				return Outer4;
			case 6:
				return Outer5;
		}
		return false;
	}
}
