using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

public abstract class PrairiePatternMonochromaticBase : PrairiePatternLayer
{
	[Space]
	[Expandable]
	public ColorizeBrightnessValue ColorizeSettings;

	protected Color ColorForBrightness(float b, PrairieLayerGroup group)
	{
		if (ColorizeSettings != null)
		{
			Color outColor;
			outColor = ColorizeSettings.ColorForBrightness(b,group);
			outColor.a = b * BlendSettings.LayerAlpha * group.GroupAlpha;
			return outColor;
		}
		else
		{
			return new Color(b,b,b,b * BlendSettings.LayerAlpha * group.GroupAlpha);
		}

	}
}
