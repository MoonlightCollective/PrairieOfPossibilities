using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MusicBeatTrigger : TriggerBase
{
	int _triggerCount = 0;
	public void NotifyBeat()
	{
		_triggerCount = (_triggerCount + 1) % 4;
		TriggerTargets.EmitTrigger(new PrairieTriggerParams("Beat",(float)_triggerCount,0));
	}
}
