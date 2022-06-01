using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[SnapshotAll]
public class SimpleXZGradient : PrairiePatternMonochromaticBase
{
	[Range(0,1)]
	public float MinBrightness = 0f;
	[Range(0,1)]
	public float MaxBrightness = 1.0f;

	public bool XGradient = true;
	public bool YGradient = false;

	public float XScale = 1.0f;
	public float YScale = 1.0f;

	bool _haveBounds = false;
	float _maxDist = 100.0f;

	Vector2 _minCorner;
	Vector2 _maxCorner;
	float _fieldWidth;
	float _fieldHeight;
	public override void Run(float deltaTime, PrairieLayerGroup group, List<StemColorManager> points)
	{
		Vector2 myXZ = new Vector2(transform.position.x, transform.position.z);
		if (!_haveBounds)
		{
			_maxCorner = Vector2.negativeInfinity;
			_minCorner = Vector2.positiveInfinity;
			foreach (var p in points)
			{
				Vector2 xz = p.XZVect;
				_maxCorner.x = Mathf.Max(_maxCorner.x,xz.x);
				_maxCorner.y = Mathf.Max(_maxCorner.y,xz.y);
				_minCorner.x = Mathf.Min(_minCorner.x,xz.x);
				_minCorner.y = Mathf.Min(_minCorner.y,xz.y);
			}
			_fieldWidth = _maxCorner.x - _minCorner.x;
			_fieldHeight = _maxCorner.y - _minCorner.y;
			// _haveBounds = true;
		}

		foreach (var p in points)
		{
			if (!filterAllowPoint(p))
				continue;

			float xNorm = XScale * (p.XZVect.x - _minCorner.x) / _fieldWidth;
			float yNorm = YScale * (p.XZVect.y - _minCorner.y) / _fieldHeight;

			float div = 0;
			float val = 0;
			if (XGradient)
			{
				val += Mathf.Lerp(MinBrightness,MaxBrightness,Mathf.Clamp01(xNorm));
				div += 1f;
			}
			if (YGradient)
			{
				val += Mathf.Lerp(MinBrightness,MaxBrightness,Mathf.Clamp01(yNorm));
				div += 1;
			}
			
			Color blendColor = ColorForBrightness(val/div,group);
			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendSettings.BlendMode));
		}
	}
}
