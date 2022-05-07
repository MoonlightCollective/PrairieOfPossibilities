using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;


public class PrairieGateRelay : GateListener
{
	public GateEmitter GateTargets;

	public bool InjectName = true;

	public override void NotifyTriggeredOff(PrairieTriggerParams tParams)
	{
		PrairieTriggerParams p = tParams;
		if (InjectName)
			p = new PrairieTriggerParams(gameObject.name,tParams.Param1,tParams.Param2);
		
		PrairieUtil.EventDebug($"{gameObject.name} - Relay Emit OFF {p.Name},{p.Param1},{p.Param2}");
		GateTargets.EmitOffEvent(p);
	}

	public override void NotifyTriggeredOn(PrairieTriggerParams tParams)
	{
		PrairieTriggerParams p = tParams;
		if (InjectName)
			p = new PrairieTriggerParams(gameObject.name,tParams.Param1,tParams.Param2);
		
		PrairieUtil.EventDebug($"{gameObject.name} - Relay Emit ON {p.Name},{p.Param1},{p.Param2}");
		GateTargets.EmitOnEvent(p);
	}
}
