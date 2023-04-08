using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using NaughtyAttributes;

public class ChaseParticleMultiPattern : ParticlePattern
{
	[Header("Multi Settings")]
	public List<int> Ids = new List<int>();

	public override void EmitParticle()
	{
		if (!gameObject.activeInHierarchy)
			return;

		foreach (var id in Ids)
		{
			emitParticleForId(id);
		}
	}

	public void EmitParticleList(List<int> Ids)
	{
		if (!gameObject.activeInHierarchy)
			return;

		foreach(int id in Ids)
		{
			emitParticleForId(id);
		}
	}

	void emitParticleForId(int id)
	{
		var p = _particlePool.NewInstance(true);
		if (p == null)
		{
			Debug.LogWarning($"{gameObject.name} - particle pool too small {this.PoolSize} - couldn't emit particle");
			return;
		}

		// always do slow init, because we are override a setting
		ParticleSettings.SetIntSetting("Id",id);
		p.InitParticle(ParticleSettings);
		p.ResetParticle();
	}
}
