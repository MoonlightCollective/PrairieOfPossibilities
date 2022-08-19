using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using NaughtyAttributes;

public class ChaseParticleMultiSprayPattern : ParticlePattern
{
	[Header("Spray")]
	[Range(1,33)]
	public int StartArm = 1;
	[Range(1,33)]
	public int EndArm = 10;
	
	[Range(-33,33)]
	public int Skip = 1;
	int _curDex = 0;

	protected override void Start()
	{
		base.Start();
		_curDex = StartArm % PrairieGlobals.Instance.NumArms;
	}

	public void ResetArm()
	{
		_curDex = StartArm;
	}

	public override void EmitParticle()
	{
		if (!gameObject.activeInHierarchy)
			return;
			
		var p = _particlePool.NewInstance(true);
		if (p == null)
		{
			Debug.LogWarning($"{gameObject.name} - particle pool too small {this.PoolSize} - couldn't emit particle");
			return;
		}

		// always do slow init, because we are override a setting
		ParticleSettings.SetIntSetting("ArmId",_curDex);
		p.InitParticle(ParticleSettings);
		p.ResetParticle();

		if (Skip < 0)
		{
			bool couldWrap = (_curDex >= EndArm);
			_curDex += Skip;
			if (_curDex < 0)
			{
				// fell off the left edge. Wrap around 
				_curDex+=PrairieGlobals.Instance.NumArms-1;
				couldWrap = true;
			}

			if (couldWrap)
			{
				if (_curDex < EndArm)
				{
					// we went to the left of the end arm
					_curDex = StartArm;
				}
			}
		}
		else if (Skip > 0)
		{
			bool couldWrap = (_curDex <= EndArm);
			_curDex += Skip;
			if (_curDex >= PrairieGlobals.Instance.NumArms)
			{
				couldWrap = true;
				_curDex -= PrairieGlobals.Instance.NumArms;
			}

			if (couldWrap)
			{
				if (_curDex > EndArm)
				{
					_curDex = StartArm;
				}
			}
		}
	}
}
