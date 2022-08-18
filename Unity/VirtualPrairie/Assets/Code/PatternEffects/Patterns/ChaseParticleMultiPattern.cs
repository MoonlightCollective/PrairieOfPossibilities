using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using NaughtyAttributes;

public class ChaseParticleMultiPattern : ParticlePattern
{
	[Header("Multi Settings")]
	public List<int> ArmIds = new List<int>();

	public override void EmitParticle()
	{
		if (!gameObject.activeInHierarchy)
			return;

		foreach (var id in ArmIds)
		{
			emitParticleForArm(id);
		}
	}

	public void EmitParticleList(List<int> armIds)
	{
		if (!gameObject.activeInHierarchy)
			return;

		foreach(int id in armIds)
		{
			emitParticleForArm(id);
		}
	}

	void emitParticleForArm(int id)
	{
		var p = _particlePool.NewInstance(true);
		if (p == null)
		{
			Debug.LogWarning($"{gameObject.name} - particle pool too small {this.PoolSize} - couldn't emit particle");
			return;
		}

		// always do slow init, because we are override a setting
		ParticleSettings.SetIntSetting("ArmId",id);
		p.InitParticle(ParticleSettings);
		p.ResetParticle();
	}
}
