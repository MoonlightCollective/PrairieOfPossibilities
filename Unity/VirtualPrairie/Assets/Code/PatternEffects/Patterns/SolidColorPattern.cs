using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;
using UnityEngine.Rendering.Universal;


public class SolidColorPattern : PrairiePatternLayer
{
	[Snapshot] public SmartColorSlot SolidColor;

	public override void Run(float deltaTime,PrairieLayerGroup group, List<StemColorManager> points)
	{
		if (BlendSettings.LayerAlpha <= 0)
			return;

		Color blendColor = SolidColor.Color(group);
		blendColor.a = blendColor.a * BlendSettings.LayerAlpha * group.GroupAlpha;

		if (blendColor.a <= 0) // optimization - nothing to do at alpha zero
			return;

		foreach (var p in points)
		{
			if (!filterAllowPoint(p))
				continue;
			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendSettings.BlendMode));
		}
	}
}