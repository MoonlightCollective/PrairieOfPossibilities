using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlantSpinPattern : PrairiePatternMonochromaticBase
{
	[Header("PlantSpin Settings")]
	[Snapshot] public float Speed = 1.0f;

	[Range(0,1)]
	[Snapshot] public float Falloff = 0.5f;
	
	[Range(0,1)]
	[Snapshot] public float MinBright = 0f;

	[Range(0,1)]
	[Snapshot] public float MaxBright = 1f;

	[Snapshot] public bool UseRandomOffset = true;

	float _curAngle = 0f;

	public override void Run(float deltaTime, PrairieLayerGroup group, List<StemColorManager> points)
	{
		_curAngle += Time.deltaTime * TimeSettings.TimeMult * Speed;
		_curAngle = _curAngle % 1;

		float offsetAngle = _curAngle;
		foreach (var p in points)
		{
			if (!filterAllowPoint(p))
				continue;

			if (UseRandomOffset)
				offsetAngle = (_curAngle + p.ParentFixture.FixtureRandomOffset)%1.0f;

			float dist = PrairieUtil.wrapdistf(p.LocalThetaNorm,offsetAngle,1.0f);

			// brightness is 0-1
			float b = Mathf.Lerp(MaxBright,MinBright,(dist*2.0f*(1-Falloff)));

			// convert to brightness based on our colorize settings (see base class)
			Color blendColor = ColorForBrightness(b,group);

			// Set color on the point
			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendSettings.BlendMode));
		}
	}
}
