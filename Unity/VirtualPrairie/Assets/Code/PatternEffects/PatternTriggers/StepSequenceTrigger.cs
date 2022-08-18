using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

[System.Serializable]
[SnapshotAll]
public class StepSequenceEntry
{
	public TriggerEmitter Emitter;
	public PrairieTriggerParams Params;
}

public class StepSequenceTrigger : TriggerListener
{
	[Tooltip("This is the last index fired - so start with -1 to have the first trigger fire on first beat")]
	[Foldout("State")]
	public int SequenceIndex = -1;
	[Snapshot] public bool Loop = true;
	
	[Snapshot]
	public List<BeatSequenceEntry> SequenceTriggers = new List<BeatSequenceEntry>();

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		if (!gameObject.activeInHierarchy)
			return;

		SequenceIndex++;
		if (SequenceIndex >= SequenceTriggers.Count)
		{
			if (!Loop)
			{
				return;
			}
			else
			{
				SequenceIndex = 0;
			}
		}

		var entry = SequenceTriggers[SequenceIndex];
		entry.Emitter.EmitTrigger(entry.Params);
	}
}
