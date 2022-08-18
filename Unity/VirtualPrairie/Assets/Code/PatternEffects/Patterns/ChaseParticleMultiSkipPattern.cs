using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using NaughtyAttributes;

public class ChaseParticleMultiSkipPattern : ParticlePattern
{
	[Header("Skip")]
	public int Skip = 5;
	public int Offset = 0;

	public override void EmitParticle()
	{
		if (!gameObject.activeInHierarchy)
			return;

		int numArms = PrairieGlobals.Instance.NumArms;
		for (int i = Offset; i < numArms; i += Skip)
		{
			var p = _particlePool.NewInstance(true);
			if (p == null)
			{
				Debug.LogWarning($"{gameObject.name} - particle pool too small {this.PoolSize} - couldn't emit particle");
				return;
			}

			// always do slow init, because we are override a setting
			ParticleSettings.SetIntSetting("ArmId",i);
			p.InitParticle(ParticleSettings);
			p.ResetParticle();
		}
	}
}
