using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PrairieUtil
{
	public static float InchesToMeters(float inches)
	{
		return inches * .0254f;
	}

	public static float FeetToMeters(float feet)
	{
		return .3048f * feet;
	}
}
