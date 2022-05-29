using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using Nothke.Utils;
using UnityEngine;

public class RingParticle : PrairieParticleBase
{
	//===============
	// Exposed params
	//===============
	[Header("ParticleDefaults")]
	public FloatRange DefaultParticleTime = new FloatRange(1f,1.5f);
	public FloatRange DefaultRingSize = new FloatRange(5,20);
	public FloatRange DefaultPositionTheta = new FloatRange(0,1);
	public FloatRange DefaultPositionRadius = new FloatRange(0,100);

	public float DefaultFalloff = 10f;

	[CurveRange(0,0,1,1,EColor.Yellow)] 
	public AnimationCurve FalloffCurve = AnimationCurve.Linear(0,1.0f,1,0.0f);


	//===============
	// Internals
	//===============
	float _lifetime;
	float _ringSize;
	float _falloff;
	Vector2 _center = Vector2.zero;

	float _curR = 0f;
	float _particleAlpha = 1.0f;

	public override void InitParticle(PrairieParticleSettings settings)
	{
		base.InitParticle(settings);

		/// allow our particle system to overrride any of our settings.
		DefaultParticleTime = settings.GetFloatRangeSetting("ParticleTime",DefaultParticleTime);
		DefaultRingSize = settings.GetFloatRangeSetting("RingSize",DefaultRingSize);
		DefaultPositionTheta = settings.GetFloatRangeSetting("PositionTheta",DefaultPositionTheta);
		DefaultPositionRadius = settings.GetFloatRangeSetting("PositionRadius",DefaultPositionRadius);
		DefaultFalloff = settings.GetFloatSetting("Falloff",DefaultFalloff);
	}

	public override void ResetParticle()
	{
		// make sure to call base class! Resets time.
		base.ResetParticle();

		// trigger a new particle.
		_lifetime = DefaultParticleTime.RandomVal;
		_ringSize = DefaultRingSize.RandomVal;
		_falloff = DefaultFalloff;
		_center = PrairieUtil.PolarToCartesianNorm(DefaultPositionRadius.RandomVal,DefaultPositionTheta.RandomVal);
		_curR = 0f;
	}

	public override bool IsRunning => _isRunning;

	public override void UpdateParticle(float deltaTime, PrairieLayerGroup group)
	{
		base.UpdateParticle(deltaTime,group);

		float a = Mathf.Clamp01(_particleT/_lifetime);
		_curR = a * _ringSize;
		if (a >= 1)
		{
			_isRunning = false;
			_particleAlpha = 0f;
		}
		else
		{
			_particleAlpha = UseAlphaCurve?AlphaCurve.Evaluate(a):1.0f;
		}
	}

	public override Color ColorForPoint(StemColorManager point)
	{
		float distFromC = Mathf.Abs(Vector2.Distance(point.XZVect,_center));
		float distFromR = Mathf.Abs(distFromC - _curR);
		float normalizedFalloffDist = Mathf.Clamp01(distFromR/_falloff);
		float b = _particleAlpha * Mathf.Clamp01(FalloffCurve.Evaluate(normalizedFalloffDist));
		return new Color(b,b,b,b);
	}

}
