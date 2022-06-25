using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

public class FixedRingPattern : PrairiePatternMonochromaticBase
{

	[Header("Ring Settings")]
	[Snapshot] public EOriginLoc Origin;
	[Snapshot] public float FalloffRange;

	[CurveRange(0,0,1,1,EColor.Yellow)] 
	public AnimationCurve FalloffCurve = AnimationCurve.Linear(0,1.0f,1,0.0f);


	[Foldout("Indexed Params")]
	[Range(0,1)]
	[Snapshot] public float PatternAlpha = 1f;
	
	[Foldout("Indexed Params")]
	[Range(0,100)]
	[Snapshot] public float Radius = 50f;

	public override void Run(float deltaTime, PrairieLayerGroup group, List<StemColorManager> points)
	{
		if (PatternAlpha <= 0)
			return;

		bool useGlobalOrigin = Origin == EOriginLoc.Center;
		Vector2 myXZ = Vector2.zero;
		if (!useGlobalOrigin)
			myXZ = new Vector2(transform.position.x,transform.position.z);
		
		foreach (var p in points)
		{
			if (!filterAllowPoint(p))
				continue;
			
			float absDistFromR;
			if (useGlobalOrigin)
				absDistFromR = Mathf.Abs(p.GlobalDistFromOrigin-Radius);
			else
				absDistFromR = Mathf.Abs(Vector2.Distance(p.XZVect,myXZ) - Radius);

			if (absDistFromR > FalloffRange)
				continue;

			float normalizedFalloffDist =  Mathf.Clamp01(absDistFromR/(FalloffRange));
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
		// Debug.Log($"SetIndexedFloat{paramDex},{newVal}");
		switch (paramDex)
		{
			case 0:
				PatternAlpha = Mathf.Clamp01(newVal);
				break;
			case 1:
				Radius = Mathf.Clamp01(newVal);
				break;
		}
	}

}
