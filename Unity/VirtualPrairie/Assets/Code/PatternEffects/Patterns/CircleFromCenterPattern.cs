using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;


public class CircleFromCenterPattern : PrairiePatternMonochromaticBase
{
	[Header("Circle Settings")]
	[Snapshot] public EOriginLoc Origin;
	[Snapshot] public float FalloffRange;

	[CurveRange(0,0,1,300,EColor.Green)]
	public AnimationCurve CircleMovement = AnimationCurve.Linear(0,0,1,300);

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

		float distFromOrigin = CircleMovement.Evaluate(NormalizedT);

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

			if (p.GlobalDistFromOrigin <= distFromOrigin)
			{
				Color blendColor = ColorForBrightness(1, group);
				blendColor.a = blendColor.a * PatternAlpha;
				p.SetColor(ColorBlend.BlendColors(blendColor, p.CurColor, BlendSettings.BlendMode));
			}
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
				NormalizedT = Mathf.Clamp01(newVal);
				break;
			case 2:
				FalloffMod = Mathf.Max(0,newVal);
				break;
		}
	}
}
