using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

public class PerlinNoisePattern : PrairiePatternLayer
{
	[Space]
	[Expandable]
	public PerlinNoiseSettings NoiseSettings;
	
	[Space]
	[Expandable]
	public ColorizeBrightToGradient ColorizeSettings;

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

	public override void Run(float deltaTime, PrairieLayerScene scene, List<StemColorManager> points)
	{
		float alpha = BlendSettings.LayerAlpha * scene.SceneSettings.SceneAlpha;
		Color blendColor;
		updateVects();
		updateMotion(deltaTime);

		foreach (var p in points)
		{
			Vector3 pos = p.transform.position + _offsetVect;
			// float noiseVal = Mathf.Clamp01((float)NoiseS3D.NoiseCombinedOctaves(pos.x * _noiseScale.x, pos.y * _noiseScale.y, pos.z * _noiseScale.z));
			float noiseVal = Mathf.Clamp01((float)NoiseS3D.Noise(pos.x * _noiseScale.x, pos.y * _noiseScale.y, pos.z * _noiseScale.z));
			float brightness = NoiseSettings.BrightnessCurve.Evaluate(noiseVal);
			
			if (ColorizeSettings == null)
			{
				blendColor = new Color(brightness,brightness,brightness,alpha);
			}
			else
			{
				blendColor = ColorizeSettings.ColorForBrightness(brightness,scene);
				blendColor.a = alpha;
			}

			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendSettings.BlendMode));
		}
	}

}
