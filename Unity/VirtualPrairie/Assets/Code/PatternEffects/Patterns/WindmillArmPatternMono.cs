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
	
	[Header("Indexed Params")]
	[Range(-1,1)]
	[Snapshot] public float Speed = 0.5f;
	[Range(0,34)]
	[Snapshot] public float Falloff = 2.0f;

	const int kNumArms = 34;

	float _curAngleNorm = 0f;

	public override void Run(float deltaTime,PrairieLayerGroup group, List<StemColorManager> points)
	{
		// what is the spacing between arms?
		int armModVal = kNumArms/WindmillArms;
 		Debug.Log($"MODVAL:{armModVal}");

		// Angle is normalized between zero and one. Floating point modulus wraps around at 1.
		_curAngleNorm = _curAngleNorm + Speed * deltaTime;
		if (_curAngleNorm < 0)
			_curAngleNorm += 1;
		_curAngleNorm = _curAngleNorm%1.0f;

		int offset = (int)(_curAngleNorm * kNumArms);

		foreach (var p in points)
		{
			if (!filterAllowPoint(p))
			{
				continue;
			}

			// what arm am I (include offset, for spinning)
			int pointArm = p.PrimaryArmTagId(ArmType);
			if (pointArm < 0)
				continue;
			
			pointArm += offset;

			// What's my delta from a "lead" arm?
			int pointArmMod = pointArm % armModVal;
			float fPointArm = (float)pointArmMod;
			float b = 0;
			if (fPointArm < Falloff)
			{
				b = 1.0f - (fPointArm/Falloff);
			}

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
				Falloff = newVal;
				break;
		}
	}
}