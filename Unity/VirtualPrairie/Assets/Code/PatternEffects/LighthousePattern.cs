using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering.Universal;


public class LighthousePattern : PrairiePatternLayer
{
	protected float angle = 0; // normalized - from zero to one, for a full rotation.

	[Header("LighthouseSettings")]
	public LighthouseSettings Settings;

	public enum AxisEnum 
	{ 
		Y, 
		Z
	};

	public override void Run(float deltaTime,List<StemColorManager> Points)
	{
		float falloff = 1f/ Settings.Width;
		float speed = Settings.Speed;

		// Angle is normalized between zero and one. Floating point modulus wraps around at 1.
		angle = (angle + speed * deltaTime)%1.0f;
		
		// pAngle is also normalized between zero and one, calculated based on axis.
		float pAngle = 0;
		float dist = 0;
		
		foreach (var p in Points)
		{
			switch (Settings.Axis) 
			{
				case AxisEnum.Y:
					pAngle = p.azimuth / (2f * Mathf.PI); // note - azimuth is in radians 0->2*Pi
		 			break;
				case AxisEnum.Z:
		  			pAngle = p.theta / (2f * Mathf.PI);
		  		break;
			}
		
			// normalized distance in angle.
			dist = PrairieUtil.wrapdistf(pAngle,angle,1.0f);

			// brightness is 0-1
			float b = (Mathf.Max(0, (1 - falloff*dist)));

			// color expects 0-1
			Color blendColor = new Color(b,b,b,b * LayerAlpha);

			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendMode));
		}
	}
}