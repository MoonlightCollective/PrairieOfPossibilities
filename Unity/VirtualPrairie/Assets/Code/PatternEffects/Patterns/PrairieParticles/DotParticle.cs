using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

public class DotParticle : PrairieParticleBase
{
	[Header("ParticleDefaults")]
	public FloatRange DefaultParticleTime = new FloatRange(1f,1.5f);
	public FloatRange DefaultPositionTheta = new FloatRange(0,1);
	public FloatRange DefaultPositionRadius = new FloatRange(0,100);
	public FloatRange DefaultStartSize = new FloatRange(5,10);

	[CurveRange(0,0,1,1,EColor.Yellow)] 
	public AnimationCurve SizeMultAnim = AnimationCurve.Linear(0,1.0f,1,1.0f);

	[CurveRange(0,0,1,1,EColor.Yellow)] 
	public AnimationCurve FalloffCurve = AnimationCurve.Linear(0,1.0f,1,0.0f);

	Vector2 posXZ = Vector2.zero;

	//===============
	// Internals
	//===============
	float _lifetime;
	float _size;

	float _curSize = 0f;
	float _particleAlpha = 1.0f;

	public override void InitParticle(PrairieParticleSettings settings)
	{
		base.InitParticle(settings);

		/// allow our particle system to overrride any of our settings.
		DefaultParticleTime = settings.GetFloatRangeSetting("ParticleTime",DefaultParticleTime);
		DefaultPositionTheta = settings.GetFloatRangeSetting("PositionTheta",DefaultPositionTheta);
		DefaultPositionRadius = settings.GetFloatRangeSetting("PositionRadius",DefaultPositionRadius);
		DefaultStartSize = settings.GetFloatRangeSetting("StartSize",DefaultStartSize);
	}

	public override void ResetParticle()
	{
		// make sure to call base class! Resets time.
		base.ResetParticle();

		// trigger a new particle.
		_lifetime = DefaultParticleTime.RandomVal;
		_size = DefaultStartSize.RandomVal;
		transform.localPosition = PrairieUtil.XZVector3(PrairieUtil.PolarToCartesianNorm(DefaultPositionRadius.RandomVal,DefaultPositionTheta.RandomVal));
		_curSize = _size * SizeMultAnim.Evaluate(0f);

		resetParticleMods();
	}

	public override void UpdateParticle(float deltaTime, PrairieLayerGroup group)
	{
		base.UpdateParticle(deltaTime,group);

		float a = Mathf.Clamp01(_particleT/_lifetime);
		_curSize = _size + SizeMultAnim.Evaluate(a);
		if (a >= 1)
		{
			_isRunning = false;
			_particleAlpha = 0f;
		}
		else
		{
			_particleAlpha = UseAlphaCurve?AlphaCurve.Evaluate(a):1.0f;
		}
		_curSize = _size * SizeMultAnim.Evaluate(a);
		posXZ = PrairieUtil.XZVector2(transform.position);
	}


	public override Color ColorForPoint(StemColorManager point)
	{
		float distFromC = Mathf.Abs(Vector2.Distance(point.XZVect,posXZ));
		float normalizedFalloffDist = Mathf.Clamp01(distFromC/_curSize);
		float b = _particleAlpha * Mathf.Clamp01(FalloffCurve.Evaluate(normalizedFalloffDist));
		return new Color(b,b,b,b);
	}
}
