using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;
using UnityEngine.Rendering.Universal;

public class WindmillArmPatternMono : PrairiePatternMonochromaticBase
{
	[Header("Windmill Settings")]
	[Snapshot] public EArmTagType ArmType;
	[Snapshot] public int WindmillArms = 1;
	[Snapshot] public AnimationCurve FalloffCurve;
	
	[Header("Indexed Params")]
	[Range(-1,1)]
	[Snapshot] public float Speed = 0.5f;
	[Snapshot] public float FalloffMult = 1.0f;

	float _curAngleNorm = 0f;

	public override void Run(float deltaTime,PrairieLayerGroup group, List<StemColorManager> points)
	{
		// what is the spacing between arms?
		int numArms = PrairieGlobals.Instance.NumArms;
		float armModVal = PrairieGlobals.Instance.NumArms/WindmillArms;

		float sp = Speed;
		if (ArmType == EArmTagType.ArmCW)
			sp = -sp;

		// Angle is normalized between zero and one. Floating point modulus wraps around at 1.
		_curAngleNorm = _curAngleNorm + sp * deltaTime;
		// handle negative speed wrap-around
		if (_curAngleNorm < 0)
			_curAngleNorm += 1;

		// wrap at 1.0f (normalized 360 degrees)
		_curAngleNorm = _curAngleNorm%1.0f;

		// how many arms make up a single windmill arm?
		float ArmsPerWindmill = (numArms / WindmillArms);

		foreach (var p in points)
		{
			if (!filterAllowPoint(p))
			{
				continue;
			}

			// What arm is this point on?
			float pointArm = (float) p.PrimaryArmTagId(ArmType);
			if (pointArm < 0)
				continue;
			
			// What's my delta from a windmill spine?
			float pointArmMod = (float)pointArm % armModVal;

			// assume my spine is at the current rotation angle
			// how far from that should this arm be (wrapping).
			float dist = PrairieUtil.wrapdistf(_curAngleNorm,pointArmMod/ArmsPerWindmill,1.0f);

			// Evaluate brighness from the falloff curve, 
			// including a multiplier, so we can animate falloff with envelopes.
			float b = FalloffCurve.Evaluate(Mathf.Clamp01(dist * FalloffMult));

			// convert to brightness based on our colorize settings (see base class)
			Color blendColor = ColorForBrightness(b,group);

			// Set color on the point
			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendSettings.BlendMode));
		}
	}

	public override void SetIndexedFloat(int paramDex, float newVal)
	{
		base.SetIndexedFloat(paramDex, newVal);
		switch (paramDex)
		{
			case 0:
				Speed = newVal;
				break;
			case 1:
				FalloffMult = newVal;
				break;
		}
	}
}