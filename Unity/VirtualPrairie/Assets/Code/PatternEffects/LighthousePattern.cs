using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;
using UnityEngine.Rendering.Universal;


public class LighthousePattern : PrairiePatternLayer
{
	[Space]
	
	[Expandable]
	public LighthouseSettings PatternSettings;

	protected float angle = 0; // normalized - from zero to one, for a full rotation.

	public override void Run(float deltaTime,float parentAlpha, List<StemColorManager> Points)
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

			// color expects 0-1
			Color blendColor = new Color(b,b,b,b * BlendSettings.LayerAlpha * parentAlpha);

			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendSettings.BlendMode));
		}
	}
}