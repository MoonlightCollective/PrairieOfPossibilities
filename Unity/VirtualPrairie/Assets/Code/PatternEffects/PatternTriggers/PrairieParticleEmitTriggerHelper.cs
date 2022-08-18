using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PrairieParticleEmitTriggerHelper : TriggerListener
{
	ParticlePattern _partPattern;
	
	void Awake()
	{
		_partPattern = GetComponent<ParticlePattern>();
	}

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		_partPattern?.EmitParticle();
	}

}
