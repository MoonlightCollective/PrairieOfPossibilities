using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ColorBlend 
{
	public enum EBlendMode
	{
		Overwrite,
		AlphaBlend,
		Add,
		AddClamped,
		Subtract,
		Multiply,
	}

	public static Color BlendColors(Color srcColor, Color destColor, EBlendMode blendMode)
	{
		switch (blendMode)
		{
			case EBlendMode.Overwrite:
			default:
				return srcColor;
			case EBlendMode.AlphaBlend:
				return ((srcColor * srcColor.a) + (destColor * destColor.a * (1f-srcColor.a)));
			case EBlendMode.Add:
				return srcColor + destColor;
			case EBlendMode.AddClamped:
				return new Color(Mathf.Clamp01(srcColor.r + destColor.r),
									Mathf.Clamp01(srcColor.g + destColor.b),
									Mathf.Clamp01(srcColor.b + destColor.b),
									Mathf.Clamp01(srcColor.a + destColor.a));
			case EBlendMode.Subtract:
				return new Color(Mathf.Clamp01(destColor.r - srcColor.r),
									Mathf.Clamp01(destColor.g - srcColor.b),
									Mathf.Clamp01(destColor.b - srcColor.b),
									Mathf.Clamp01(destColor.a -  srcColor.a));
			case EBlendMode.Multiply:
				return srcColor * destColor;
		}
	}
}
