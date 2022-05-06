using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;
using UnityEngine.Rendering.Universal;


public class LighthousePattern : PrairiePatternMonochromaticBase
{
	[Space]
	[Expandable]
	public LighthouseSettings PatternSettings;

	protected float angle = 0; // normalized - from zero to one, for a full rotation.

	public override void Run(float deltaTime,PrairieLayerGroup group, List<StemColorManager> Points)
	{
		float falloff = 1f/ PatternSettings.Width;
		float speed = PatternSettings.Speed;

		// Angle is normalized between zero and one. Floating point modulus wraps around at 1.
		angle = (angle + speed * deltaTime)%1.0f;
		
		// pAngle is also normalized between zero and one, calculated based on axis.
		float pAngle = 0;
		float dist = 0;
		
		foreach (var p in Points)
		{
			switch (PatternSettings.Axis) 
			{
				case PrairieUtil.AxisEnum.Y:
					pAngle = p.azimuth / (2f * Mathf.PI); // note - azimuth is in radians 0->2*Pi
		 			break;
				case PrairieUtil.AxisEnum.Z:
		  			pAngle = p.theta / (2f * Mathf.PI);
		  		break;
			}
		
			// normalized distance in angle.
			dist = PrairieUtil.wrapdistf(pAngle,angle,1.0f);

			// brightness is 0-1
			float b = (Mathf.Max(0, (1 - falloff*dist)));

			// convert to brightness based on our colorize settings (see base class)
			Color blendColor = ColorForBrightness(b,group);

			// Set color on the point
			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendSettings.BlendMode));
		}
	}
}