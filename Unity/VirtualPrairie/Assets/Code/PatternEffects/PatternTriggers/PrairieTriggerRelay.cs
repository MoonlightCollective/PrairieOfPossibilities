using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class PrairieTriggerRelay : TriggerListener
{
	public TriggerEmitter TriggerTargets;

	public bool InjectName = true;

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		PrairieTriggerParams p = tParams;
		if (InjectName)
			p = new PrairieTriggerParams(gameObject.name,tParams.Param1,tParams.Param2);
		
		TriggerTargets.EmitTrigger(p);
	}
}
