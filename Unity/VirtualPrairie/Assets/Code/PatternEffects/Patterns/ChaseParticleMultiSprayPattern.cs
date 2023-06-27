using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using NaughtyAttributes;

public class ChaseParticleMultiSprayPattern : ParticlePattern
{
	[Header("Spray")]
	[Range(0,35)]
	public int StartArm = 0;
	[Range(0,35)]
	public int EndArm = 35;
	
	[Range(-35,35)]
	public int Skip = 1;
	int _curDex = 0;

	protected override void Start()
	{
		base.Start();
		_curDex = StartArm;
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

		_curDex += Skip;
		if (_curDex >= EndArm)
        {
			int wrapDist = _curDex - EndArm;
			_curDex = StartArm + wrapDist;
        }
		else if (_curDex < StartArm)
        {
			int wrapDist = StartArm - _curDex;
			_curDex = EndArm - wrapDist;
        }
	}
}
