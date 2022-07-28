using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public enum ESquenceTriggerBehavior
{
	OneShot,
	LoopToggle,
}

public class TimedSequenceTrigger : TriggerListener
{
	public ESquenceTriggerBehavior TriggerBehavior = ESquenceTriggerBehavior.OneShot;

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		throw new System.NotImplementedException();
	}
}
