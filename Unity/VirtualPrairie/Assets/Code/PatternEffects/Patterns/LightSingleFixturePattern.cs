using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

public class LightSingleFixturePattern : PrairiePatternMonochromaticBase
{
	public bool UseSplitControls = false;

	[Range(0,450)]
	[HideIf("UseSplitControls")]
	public int FixtureId = 0;

	[ShowIf("UseSplitControls")]
	[Range(0,45)]
	public int FixtureIdTens = 0;

	[ShowIf("UseSplitControls")]
	[Range(0,9)]
	public int FixtureIdOnes = 0;

	[Range(0,1)]
	public float Brightness = 1f;

	public override void Run(float deltaTime, PrairieLayerGroup group, List<StemColorManager> points)
	{
		int fixtureId = UseSplitControls?(FixtureIdTens * 10 + FixtureIdOnes):FixtureId;
		foreach (var p in points)
		{
			if (!filterAllowPoint(p))
				continue;
			
			if (p.ParentFixture.FixtureId == fixtureId)
			{
				Color c = ColorForBrightness(Brightness,group);
				p.SetColor(ColorBlend.BlendColors(c,p.CurColor,BlendSettings.BlendMode));
			}
		}
	}
}
