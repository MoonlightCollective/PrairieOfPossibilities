using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using NaughtyAttributes;

public class ChaseParticleMultiSprayPattern : ParticlePattern
{
	[Header("Spray")]
	[Range(1,10)]
	public int StartId = 1;
	[Range(1,10)]
	public int EndId = 10;
	
	[Range(-10,10)]
	public int Skip = 1;
	int _curDex = 0;

	protected override void Start()
	{
		base.Start();
		_curDex = StartId % PrairieGlobals.Instance.NumRings;
	}

	public void ResetArm()
	{
		_curDex = StartId;
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
		ParticleSettings.SetIntSetting("Id",_curDex);
		p.InitParticle(ParticleSettings);
		p.ResetParticle();

		if (Skip < 0)
		{
			bool couldWrap = (_curDex >= EndId);
			_curDex += Skip;
			if (_curDex < 0)
			{
				// fell off the left edge. Wrap around 
				_curDex+=PrairieGlobals.Instance.NumRings-1;
				couldWrap = true;
			}

			if (couldWrap)
			{
				if (_curDex < EndId)
				{
					// we went to the left of the end arm
					_curDex = StartId;
				}
			}
		}
		else if (Skip > 0)
		{
			bool couldWrap = (_curDex <= EndId);
			_curDex += Skip;
			if (_curDex >= PrairieGlobals.Instance.NumRings)
			{
				couldWrap = true;
				_curDex -= PrairieGlobals.Instance.NumRings;
			}

			if (couldWrap)
			{
				if (_curDex > EndId)
				{
					_curDex = StartId;
				}
			}
		}
	}
}
