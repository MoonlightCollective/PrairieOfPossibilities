using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;
using UnityEngine.Rendering.Universal;


public class SolidColorPattern : PrairiePatternLayer
{
	public SmartColorSlot SolidColor;

	public override void Run(float deltaTime,PrairieLayerScene scene, List<StemColorManager> Points)
	{
		Color blendColor = SolidColor.Color(scene);
		blendColor.a = blendColor.a * BlendSettings.LayerAlpha * scene.SceneSettings.SceneAlpha;

		foreach (var p in Points)
		{
			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendSettings.BlendMode));
		}
	}
}