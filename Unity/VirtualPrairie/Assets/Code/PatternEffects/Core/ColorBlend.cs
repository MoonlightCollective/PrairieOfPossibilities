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
		AlphaOverwrite,
	}

	public static Color BlendColors(Color srcColor, Color destColor, EBlendMode blendMode)
	{
		switch (blendMode)
		{
			case EBlendMode.Overwrite:
			default:
				return srcColor;
			case EBlendMode.AlphaBlend:
				return new Color(Mathf.Clamp01((srcColor.r * srcColor.a) + (destColor.r * (1-srcColor.a))),
								Mathf.Clamp01((srcColor.g * srcColor.a) + (destColor.g * (1-srcColor.a))),
								Mathf.Clamp01((srcColor.b * srcColor.a) + (destColor.b * (1-srcColor.a))),
								Mathf.Clamp01(srcColor.a + destColor.a));
				// return ((srcColor * srcColor.a) + (destColor * (1f-srcColor.a)));
			case EBlendMode.Add:
				return (srcColor * srcColor.a) + destColor;
			case EBlendMode.AddClamped:
			{
				var c = (srcColor * srcColor.a) + destColor;
				return new Color(Mathf.Clamp01(c.r),
									Mathf.Clamp01(c.g),
									Mathf.Clamp01(c.b),
									Mathf.Clamp01(c.a));
			}
			case EBlendMode.Subtract:
				return new Color(Mathf.Clamp01(destColor.r - srcColor.r),
									Mathf.Clamp01(destColor.g - srcColor.b),
									Mathf.Clamp01(destColor.b - srcColor.b),
									Mathf.Clamp01(destColor.a -  srcColor.a));
			case EBlendMode.Multiply:
				return srcColor * destColor;
			case EBlendMode.AlphaOverwrite:
				return new Color(destColor.r,destColor.g,destColor.b,srcColor.a);
		}
	}
}
