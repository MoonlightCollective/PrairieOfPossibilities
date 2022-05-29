using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using Nothke.Utils;
using UnityEngine;

public abstract class PrairieParticleBase : MonoBehaviour
{
	protected PrairieParticlePool _parentPool;
	public PrairieParticlePool ParentPool => _parentPool;

	public bool UseAlphaCurve;

	[ShowIf("UseAlphaCurve")]
	[CurveRange(0,0,1,1)]
	public AnimationCurve AlphaCurve = new AnimationCurve(new Keyframe(0,0),new Keyframe(0.1f,1), new Keyframe(0.9f,1), new Keyframe(1,0));

	protected float _particleT = -1f;
	protected bool _isRunning = false;

	public virtual void Initialize(PrairieParticlePool parentPool)
	{
		_parentPool = parentPool;
	}

	public virtual bool IsRunning => _isRunning;
	
	public virtual void InitParticle(PrairieParticleSettings settings)
	{
		UseAlphaCurve = (settings.GetIntSetting("UseAlphaCurve",UseAlphaCurve?1:0) == 1);
	}

	public virtual void ResetParticle()
	{
		_particleT = 0f;
		_isRunning = true;
	}

	public virtual void UpdateParticle(float deltaTime, PrairieLayerGroup group)
	{
		_particleT += deltaTime;
	}

	public abstract Color ColorForPoint(StemColorManager point);
}
