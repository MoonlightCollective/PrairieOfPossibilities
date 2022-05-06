using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;
using UnityEngine.Rendering.Universal;


public class SolidColorPattern : PrairiePatternLayer
{
	public SmartColorSlot SolidColor;

	public override void Run(float deltaTime,PrairieLayerGroup group, List<StemColorManager> Points)
	{
		Color blendColor = SolidColor.Color(group);
		blendColor.a = blendColor.a * BlendSettings.LayerAlpha * group.GroupAlpha;

		foreach (var p in Points)
		{
			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendSettings.BlendMode));
		}
	}
}