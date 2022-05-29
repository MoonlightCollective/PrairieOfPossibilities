using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class TriggerToEvent : TriggerListener
{
	public UnityEvent TriggerEvent;

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		TriggerEvent?.Invoke();
	}
}
