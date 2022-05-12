using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;


public class RingFromCenterPattern : PrairiePatternMonochromaticBase
{
	[Expandable]
	public RingSettings Settings;

	[Foldout("Indexed Params")] 
	[Range(0,1)]
	public float PatternAlpha = 0f;

	[Foldout("Indexed Params")]
	[Range(0,1)]
	public float NormalizedT = 0f;
	
	[Foldout("Indexed Params")]
	[Range(0,5)]
	public float FalloffMod = 0f;
	

	public override void Run(float deltaTime, PrairieLayerGroup group, List<StemColorManager> points)
	{
		if (Settings == null)
			return;

		float ringDistFromOrigin = Settings.RingMovement.Evaluate(NormalizedT);

		if (PatternAlpha <= 0)
			return;
			
		
		bool useGlobalOrigin = Settings.Origin == EOriginLoc.Center;
		Vector2 myXZ = Vector2.zero;
		if (!useGlobalOrigin)
			myXZ = new Vector2(transform.position.x,transform.position.z);
		
		foreach (var p in points)
		{
			if (!filterAllowPoint(p))
				continue;

			float absDistFromR;
			if (useGlobalOrigin)
			{
				absDistFromR = Mathf.Abs(p.GlobalDistFromOrigin - ringDistFromOrigin);
			}
			else 
			{
				// assume EOriginLoc.ThisObject
				absDistFromR = Mathf.Abs(Vector2.Distance(p.XZVect,myXZ) - ringDistFromOrigin);
			}
			
			float normalizedFalloffDist =  Mathf.Clamp01(absDistFromR/(Settings.FalloffRange + FalloffMod));
			float bFromFalloff = Settings.FalloffCurve.Evaluate(normalizedFalloffDist);

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
				FalloffMod = Mathf.Max(0,newVal);
				break;
		}
	}
}
