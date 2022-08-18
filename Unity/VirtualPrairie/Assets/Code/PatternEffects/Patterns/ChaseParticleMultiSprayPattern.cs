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
	
	[Range(1,34)]
	public int Skip = 1;
	int _curDex = 0;

	protected override void Start()
	{
		base.Start();
		_curDex = StartArm % PrairieGlobals.Instance.NumArms;
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

		if (EndArm > StartArm)
		{
			_curDex += Skip;
			if (_curDex > EndArm)
				_curDex = StartArm;
		}
		else
		{
			_curDex -= Skip;
			if (_curDex < EndArm)
				_curDex = StartArm;
		}

	}
}
