using System.Collections;
using System.Collections.Generic;
using FMOD.Studio;
using FMODUnity;
using UnityEngine;

public class FmodEmitterTrigger : TriggerListener
{
	public EventReference FmodEvent;
	EventInstance _inst;

	public void Start()
	{
		_inst = FMODUnity.RuntimeManager.CreateInstance(FmodEvent);
	}

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		Debug.Log("Attempt to play event");
		if (_inst.isValid())
		{
			Debug.Log("Instance valid");
			_inst.start();
		}
	}
}
