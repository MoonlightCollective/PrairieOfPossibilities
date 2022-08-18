using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

public class SolidBrightnessPattern : PrairiePatternMonochromaticBase
{
	[SnapshotAll]
	[Range(0, 1)]
	public float brightness = 1.0f;
	
	public override void Run(float deltaTime, PrairieLayerGroup group, List<StemColorManager> points)
	{
		foreach (var p in points)
		{
			if (!filterAllowPoint(p))
				continue;
			
			Color blendColor = ColorForBrightness(brightness,group);
			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendSettings.BlendMode));
		}
	}
}
