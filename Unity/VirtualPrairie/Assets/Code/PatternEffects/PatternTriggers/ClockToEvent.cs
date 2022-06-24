using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class ClockToEvent : ClockToTriggerBase
{
	public UnityEvent<int> OutEvent;

	protected override void triggerEvent(string evName, int evParam)
	{
		if (gameObject.activeInHierarchy)
			OutEvent?.Invoke(evParam);
	}
}
