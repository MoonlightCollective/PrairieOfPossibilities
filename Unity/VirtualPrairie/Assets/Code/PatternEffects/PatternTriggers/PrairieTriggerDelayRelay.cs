using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class PrairieTriggerDelayRelay : TriggerListener
{
	public TriggerEmitter TriggerTargets;

	public bool InjectName = true;
	public float DelayTime = 1.0f;
	bool _triggered = false;
	float _delayTimer = -1f;
	PrairieTriggerParams _cachedParams;
	
	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		Debug.Log("DELAY TRIGGER");
		_triggered = true;
		_delayTimer = DelayTime;
		_cachedParams = tParams;
	}

	public void Update()
	{
		if (!_triggered)
			return;

		_delayTimer -= Time.deltaTime;
		if (_delayTimer <=0 )
		{
			PrairieTriggerParams p = _cachedParams;
		 	if (InjectName)
				p = new PrairieTriggerParams(gameObject.name,_cachedParams.Param1,_cachedParams.Param2);
			
			TriggerTargets.EmitTrigger(p);
			_triggered = false;
		}
	}
}
