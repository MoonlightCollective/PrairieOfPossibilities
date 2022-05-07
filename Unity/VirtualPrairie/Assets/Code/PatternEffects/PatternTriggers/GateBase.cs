using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Scripting;

public abstract class GateListener : MonoBehaviour
{
	public abstract void NotifyTriggeredOn(PrairieTriggerParams tParams);
	public abstract void NotifyTriggeredOff(PrairieTriggerParams tParams);
}

[System.Serializable]
public class GateEmitter
{
	public List<GateListener> GateListeners = new List<GateListener>();
	public List<TriggerListener> GateOnTriggerListeners = new List<TriggerListener>();
	public void EmitOnEvent(PrairieTriggerParams ptp)
	{
		PrairieUtil.EventDebug($"Do emit {ptp.Name}");
		foreach (var l in GateListeners)
		{
			PrairieUtil.EventDebug($" emit gate {ptp.Name} to {l.gameObject.name}");
			l.NotifyTriggeredOn(ptp);
		}
		foreach (var l in GateOnTriggerListeners)
		{
			PrairieUtil.EventDebug($" emit gate Trigger {ptp.Name} to {l.gameObject.name}");
			l.NotifyTriggered(ptp);
		}
	}

	public void EmitOffEvent(PrairieTriggerParams ptp)
	{
		foreach (var l in GateListeners)
		{
			l.NotifyTriggeredOff(ptp);
		}
	}

}

public abstract class GateBase : MonoBehaviour
{
	public GateEmitter GateTargets;

}

