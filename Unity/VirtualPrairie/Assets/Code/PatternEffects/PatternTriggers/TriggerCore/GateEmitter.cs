using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class GateListener : MonoBehaviour
{
	public abstract void NotifyTriggeredOn(PrairieTriggerParams tParams);
	public abstract void NotifyTriggeredOff(PrairieTriggerParams tParams);
}

[System.Serializable]
public class GateEmitter
{
	protected List<GateListener> _gateListeners = new List<GateListener>();
	protected List<TriggerListener> _triggerListeners = new List<TriggerListener>();
	public List<GameObject> Targets = new List<GameObject>();
	public bool IncludeChildren = false;
	
	bool _initialized = false;
	
	public void Init()
	{
		_triggerListeners.Clear();
		_gateListeners.Clear();

		foreach (var t in Targets)
		{
			var listeners = t.GetComponentsInChildren<GateListener>();
			int count = 0;
			if (listeners.Length > 0)
			{
				if (IncludeChildren)
				{
					// add them all
					count += listeners.Length;
					_gateListeners.AddRange(listeners);
				}
				else
				{
					foreach (var l in listeners)
					{
						if (l.gameObject == t)
						{
							count++;
							_gateListeners.Add(l);
						}
					}
				}
			}
			
			var trigListeners = t.GetComponentsInChildren<TriggerListener>();
			if (trigListeners.Length > 0)
			{
				if (IncludeChildren)
				{
					count += trigListeners.Length;
					_triggerListeners.AddRange(trigListeners);
				}
				else
				{
					foreach (var l in trigListeners)
					{
						if (l.gameObject == t)
						{
							count++;
							_triggerListeners.Add(l);
						}
					}
				}

			}

			if (count < 1)
			{
				Debug.LogWarning($"{t.gameObject.name} used as a gate emitter target, but doesn't have any listeners");
			}
		}

		_initialized = true;
	}

	public void EmitOnEvent(PrairieTriggerParams ptp)
	{
		if (!_initialized)
			Init();

		PrairieUtil.EventDebug($"Do emit {ptp.Name}");
		foreach (var l in _gateListeners)
		{
			PrairieUtil.EventDebug($" emit gate ON {ptp.Name} to {l.gameObject.name}");
			l.NotifyTriggeredOn(ptp);
		}
		foreach (var l in _triggerListeners)
		{
			PrairieUtil.EventDebug($" emit gate ON Trigger {ptp.Name} to {l.gameObject.name}");
			l.NotifyTriggered(ptp);
		}
	}

	public void EmitOffEvent(PrairieTriggerParams ptp)
	{
		if (!_initialized)
			Init();

		foreach (var l in _gateListeners)
		{
			PrairieUtil.EventDebug($" emit gate OFF Trigger {ptp.Name} to {l.gameObject.name}");
			l.NotifyTriggeredOff(ptp);
		}
	}
}