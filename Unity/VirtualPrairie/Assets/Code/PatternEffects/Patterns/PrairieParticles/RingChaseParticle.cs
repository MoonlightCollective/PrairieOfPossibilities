using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RingChaseParticle : PrairieParticleBase
{
	public float DefaultSpeed = 40.0f;
	public float DefaultLength = 30.0f;
	public float DefaultStartDist = 0.0f;
	public float DefaultLifetime = 3.0f;
	public int DefaultId = 5;
	public AnimationCurve BrightnessRamp = new AnimationCurve(new Keyframe(0,1),new Keyframe(1,0));

	float _curDist;
	float _lifeTimer;
	float _len;
	float _lifeTime;
	float _speed;
	int _Id;

	public override void InitParticle(PrairieParticleSettings settings)
	{
		base.InitParticle(settings);
		_lifeTimer = 0f;
		_lifeTime = settings.GetFloatSetting("Lifetime",DefaultLifetime);
		_curDist = settings.GetFloatSetting("StartDist",DefaultStartDist);
		_speed = settings.GetFloatSetting("Speed",DefaultSpeed);
		_len = settings.GetFloatSetting("Length",DefaultLength);
		_Id = settings.GetIntSetting("Id",DefaultId);
		_isRunning = true;
	}

	public override void UpdateParticle(float deltaTime, PrairieLayerGroup group)
	{
		base.UpdateParticle(deltaTime, group);
		_lifeTimer += deltaTime;
		if (_lifeTimer >= _lifeTime)
			_isRunning = false;
		
		_curDist += _speed * deltaTime;
	}

	public override Color ColorForPoint(StemColorManager point)
	{
        // particle goes around the ring... travels at speed X
        // need to translate into angles... use angle to compute movement and brightness
        // arcTheta = (len/totalCircumferance) = len / (2 * pi * r);
        // speedTheta = (speed / r); // add this many radians each second

		if (point.RingId != _Id)
		{
			return new Color(0,0,0,0);
		}

        float arcTheta = _len / point.GlobalDistFromOrigin; // size of particle in radians
        float curTheta = (_curDist / point.GlobalDistFromOrigin) % (2 * Mathf.PI); // location of particle in radians going around circle
		float thetaFromC = curTheta - (point.GlobalTheta * Mathf.Deg2Rad);

		float b = 0;
		if (thetaFromC > 0 && thetaFromC < arcTheta)
		{
			float normDist = Mathf.Clamp01(thetaFromC / arcTheta);
			if (_speed < 0)
			{
				b = BrightnessRamp.Evaluate(1-normDist);
			}
			else
			{
				b = BrightnessRamp.Evaluate(normDist);
			}
		}

		return new Color(b,b,b,b);
	}
}