using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;
using UnityEngine.Rendering.Universal;


public class LighthousePattern : PrairiePatternMonochromaticBase
{
	[Header("Lighthouse Settings")]
	[Snapshot] public PrairieUtil.AxisEnum Axis;

	[Snapshot] public EOriginLoc Origin;

	[Header("Indexed params")]
	[Range(0,1)]
	[Snapshot] public float Speed;

	[Range(0,1)]
	[Snapshot] public float Width;

	[Range(0,1)]
	[Snapshot] public float NormAngleOffset;

	protected float angle = 0; // normalized - from zero to one, for a full rotation.

	public override void Run(float deltaTime,PrairieLayerGroup group, List<StemColorManager> points)
	{
		float falloff = 1f/ Width;
		float speed = Speed;

		// Angle is normalized between zero and one. Floating point modulus wraps around at 1.
		angle = (angle + speed * deltaTime)%1.0f;
		float offsetAngle = (angle + NormAngleOffset)%1;

		// pAngle is also normalized between zero and one, calculated based on axis.
		float pAngle = 0;
		float dist = 0;
		
		bool useCenter = Origin == EOriginLoc.Center;
		
		if (BlendSettings.LayerAlpha <= 0f)
			return; // save the work if we're invisible.
		
		foreach (var p in points)
		{
			if (!filterAllowPoint(p))
				continue;

			switch (Axis) 
			{
				case PrairieUtil.AxisEnum.Y:
					pAngle = useCenter?p.GlobalAzimuthNormalized:p.AzimuthRelativeTo(transform.position,true);
		 			break;
				case PrairieUtil.AxisEnum.Z:
					pAngle = useCenter?p.GlobalThetaNormalized:p.ThetaRelativeTo(transform.position,true);
		  		break;
			}
		
			// normalized distance in angle.
			dist = PrairieUtil.wrapdistf(pAngle,offsetAngle,1.0f);

			// brightness is 0-1
			float b = (Mathf.Max(0, (1 - falloff*dist)));

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
				Width = newVal;
				break;
			case 2:
				NormAngleOffset = Mathf.Clamp(newVal,-1,1);
				break;
		}
	}
}