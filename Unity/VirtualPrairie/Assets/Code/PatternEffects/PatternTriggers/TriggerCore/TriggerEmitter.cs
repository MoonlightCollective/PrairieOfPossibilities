using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class TriggerListener : MonoBehaviour
{
	public abstract void NotifyTriggered(PrairieTriggerParams tParams);
}

[System.Serializable]
public class TriggerEmitter
{
	public bool IncludeChildren = true;
	public List<GameObject> Targets = new List<GameObject>();
	protected List<TriggerListener> _triggerListeners = new List<TriggerListener>();
	protected bool _initialized = false;

	public void Init()
	{
		_triggerListeners.Clear();

		foreach (var t in Targets)
		{
			TriggerListener[] listeners;
			if (IncludeChildren)
			{
				listeners = t.GetComponentsInChildren<TriggerListener>();
			}
			else
			{
				listeners = t.GetComponents<TriggerListener>();
			}

			if (listeners.Length > 0)
				_triggerListeners.AddRange(listeners);
			else
				Debug.LogWarning($"${t.gameObject.name} used as a trigger target, but doesn't have any listeners!");
		}

		_initialized = true;
	}

	public void EmitTrigger(PrairieTriggerParams ptp)
	{
		if (!_initialized)
			Init();
		
		foreach (var l in _triggerListeners)
		{
			l.NotifyTriggered(ptp);
		}
	}
}