using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

public enum EBlendAlphaMode
{
	AlphaFromBrightness,
	AlphaOne,
	AlphaFixed,
}
public abstract class PrairiePatternMonochromaticBase : PrairiePatternLayer
{
	[Space]
	[Expandable]
	[Foldout("Colorize")]
	public ColorizeBrightnessValue ColorizeSettings;

	[Foldout("Colorize")]
	[Snapshot] public EBlendAlphaMode AlphaMode = EBlendAlphaMode.AlphaFromBrightness;
	
	[Snapshot]
	[ShowIf("AlphaMode",EBlendAlphaMode.AlphaFixed)]
	[Foldout("Colorize")]
	[Range(0,1)]
	public float FixedAlpha = 1.0f;

	protected Color ColorForBrightness(float b, PrairieLayerGroup group)
	{
		if (ColorizeSettings != null)
		{
			Color outColor;
			outColor = ColorizeSettings.ColorForBrightness(b,group);
			outColor.a = alphaFromMode(b) * BlendSettings.LayerAlpha * group.GroupAlpha;
			return outColor;
		}
		else
		{
			return new Color(b,b,b,alphaFromMode(b) * BlendSettings.LayerAlpha * group.GroupAlpha);
		}
	}
	
	protected float alphaFromMode(float brightness)
	{
		switch (AlphaMode)
		{
			case EBlendAlphaMode.AlphaFromBrightness:
				return brightness;
			case EBlendAlphaMode.AlphaFixed:
				return FixedAlpha;
			case EBlendAlphaMode.AlphaOne:
			default:
				return 1.0f;
		}
	}
}
