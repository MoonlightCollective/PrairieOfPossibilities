using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ArmChaseParticle : PrairieParticleBase
{
	public float DefaultSpeed = 40.0f;
	public float DefaultLength = 30f;
	public float DefaultStartDist = 3.0f;
	public float DefaultLifetime = 3.0f;
	public EArmTagType ArmType = EArmTagType.ArmCW;
	public int DefaultArmId = 5;
	public AnimationCurve BrightnessRamp = new AnimationCurve(new Keyframe(0,1),new Keyframe(1,0));

	float _curDist;
	float _lifeTimer;
	float _len;
	float _lifeTime;
	float _speed;
	int _armId;

	public override void InitParticle(PrairieParticleSettings settings)
	{
		base.InitParticle(settings);
		_lifeTimer = 0f;
		_lifeTime = settings.GetFloatSetting("Lifetime",DefaultLifetime);
		_curDist = settings.GetFloatSetting("StartDist",DefaultStartDist);
		_speed = settings.GetFloatSetting("Speed",DefaultSpeed);
		_len = settings.GetFloatSetting("Length",DefaultLength);
		_armId = settings.GetIntSetting("ArmId",DefaultArmId);
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
		if (point.PrimaryArmTagId(ArmType) != _armId)
		{
			return new Color(0,0,0,0);
		}

		float distFromC;
		if (_speed < 0)
			distFromC = _curDist - point.GlobalDistFromOrigin;
		else
 			distFromC = _curDist - point.GlobalDistFromOrigin;

		float b = 0;
		if (distFromC > 0 && distFromC < _len)
		{
			float normDist = Mathf.Clamp01(distFromC / _len);
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
