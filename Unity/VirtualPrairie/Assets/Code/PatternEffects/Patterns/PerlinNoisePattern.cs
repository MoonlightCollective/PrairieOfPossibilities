using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

public class PerlinNoisePattern : PrairiePatternMonochromaticBase
{
	[SnapshotAll]	
	public PerlinNoiseSettings NoiseSettings;

	protected Vector3 _offsetVect = Vector3.zero;
	protected Vector3 _moveSpeedVect = Vector3.zero;
	protected Vector3 _noiseScale = Vector3.one;

	public void Start()
	{
		_offsetVect = NoiseSettings.InitialOffsets;
	}

	void updateVects()
	{
		_moveSpeedVect = new Vector3(NoiseSettings.MotionSpeedX,NoiseSettings.MotionSpeedY,NoiseSettings.MotionSpeedZ);
		_noiseScale = NoiseSettings.NoiseScale * 0.001f; // this makes it a better range for the noise generator compared to our field size.
	}
	
	void updateMotion(float deltaTime)
	{
		if (_moveSpeedVect.magnitude > 0)
		{
			_offsetVect = _offsetVect + (_moveSpeedVect * deltaTime);
		}
	}

	public override void Run(float deltaTime, PrairieLayerGroup group, List<StemColorManager> points)
	{
		updateVects();
		updateMotion(deltaTime);

		foreach (var p in points)
		{
			if (!filterAllowPoint(p))
				continue;

			Vector3 pos = p.transform.position + _offsetVect;

			float noiseVal = Mathf.Clamp01((float)NoiseS3D.Noise(pos.x * _noiseScale.x, pos.y * _noiseScale.y, pos.z * _noiseScale.z));
			float brightness = NoiseSettings.BrightnessCurve.Evaluate(noiseVal);
			
			Color blendColor = ColorForBrightness(brightness,group);

			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendSettings.BlendMode));
		}
	}

}
