using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[SnapshotAll]
public class SimpleRadialGradient : PrairiePatternMonochromaticBase
{
	[Header("Gradient Settings")]
	public EOriginLoc Origin;

	[Range(0,1)]
	public float MinBrightness = 0f;
	[Range(0,1)]
	public float MaxBrightness = 1.0f;

	bool _haveBounds = false;
	float _maxDist = 100.0f;

	public override void Run(float deltaTime, PrairieLayerGroup group, List<StemColorManager> points)
	{
		_maxDist = 0f;
		Vector2 myXZ = new Vector2(transform.position.x, transform.position.z);
		if (!_haveBounds)
		{
			foreach (var p in points)
			{
				float dist = 0;
				if (Origin == EOriginLoc.Center)
					dist = p.GlobalDistFromOrigin;
				else if (Origin == EOriginLoc.ThisObject)
					dist = Vector2.Distance(p.XZVect,myXZ);

				if (dist > _maxDist)
					_maxDist = dist;
			}
		}

		foreach (var p in points)
		{
			float absDistFromCenter = 0;
			if (Origin == EOriginLoc.Center)
				absDistFromCenter = Mathf.Abs(p.GlobalDistFromOrigin);
			else
				absDistFromCenter = Vector2.Distance(p.XZVect,myXZ);

			float val = Mathf.Lerp(MinBrightness,MaxBrightness,Mathf.Clamp01(absDistFromCenter/_maxDist));
			Color blendColor = ColorForBrightness(val,group);
			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendSettings.BlendMode));
		}
	}
}
