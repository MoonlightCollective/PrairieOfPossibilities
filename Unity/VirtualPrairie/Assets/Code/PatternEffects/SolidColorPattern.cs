using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering.Universal;


public class SolidColorPattern : PrairiePatternLayer
{
	[Header("Color")]
	public Color MyColor = new Color(1.0f,1.0f,1.0f,1.0f);

	public override void Run(float deltaTime,List<StemColorManager> Points)
	{
		Color blendColor = MyColor;
		blendColor.a = blendColor.a * LayerAlpha;
		foreach (var p in Points)
		{
			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendMode));
		}
	}
}