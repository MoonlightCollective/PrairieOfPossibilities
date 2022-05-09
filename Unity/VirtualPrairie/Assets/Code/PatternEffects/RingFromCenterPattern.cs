using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;


public class RingFromCenterPattern : PrairiePatternMonochromaticBase
{
	[CurveRange(0,0,1,300,EColor.Green)]
	public AnimationCurve RingMovement = AnimationCurve.Linear(0,0,1,300);

	[Foldout("Indexed Params")] 
	[Range(0,1)]
	public float PatternAlpha = 0f;

	[Foldout("Indexed Params")]
	[Range(0,1)]
	public float NormalizedT = 0f;
	
	[Foldout("Indexed Params")]
	[Range(0,50)]
	public float FalloffDist = 5f; // in meters
	
	public AnimationCurve FalloffCurve = AnimationCurve.Linear(0,1.0f,1,0.0f);

	public override void Run(float deltaTime, PrairieLayerGroup group, List<StemColorManager> points)
	{
		float ringDistFromOrigin = RingMovement.Evaluate(NormalizedT);

		if (PatternAlpha <= 0)
			return;
			
		foreach (var p in points)
		{
			if (!filterAllowPoint(p))
				continue;

			float absDistFromR = Mathf.Abs(p.GlobalDistFromOrigin - ringDistFromOrigin);
			float normalizedFalloffDist = Mathf.Clamp01(absDistFromR/FalloffDist);
			float bFromFalloff = FalloffCurve.Evaluate(normalizedFalloffDist);

			if (bFromFalloff <= 0)
				continue;
			
			Color blendColor = ColorForBrightness(bFromFalloff,group);
			blendColor.a = blendColor.a * PatternAlpha;
			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendSettings.BlendMode));
		}
	}

	public override void SetIndexedFloat(int paramDex, float newVal)
	{
		switch (paramDex)
		{
			case 0:
				PatternAlpha = Mathf.Clamp01(newVal);
				break;
			case 1:
				NormalizedT = Mathf.Clamp01(newVal);
				break;
			case 2:
				FalloffDist = Mathf.Max(0,newVal);
				break;
		}
	}
}
