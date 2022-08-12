using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

[System.Serializable]
public class BeatSequenceEntry
{
	public TriggerEmitter Emitter;
	public PrairieTriggerParams Params;
}

public class BeatSequenceTrigger : TriggerListener
{
	[Foldout("Sequencer Activation")]
	public EEnableBehavior TriggerBehavior = EEnableBehavior.Toggle;
	[Foldout("Sequencer Activation")]
	public bool IsActive;
	[Foldout("Sequencer Activation")]
	public bool Loop = false;

	[Tooltip("This is the last index fired - so start with -1 to have the first trigger fire on first beat")]
	[Foldout("State")]
	public int SequenceIndex = -1;

	public List<BeatSequenceEntry> SequenceTriggers = new List<BeatSequenceEntry>();

	FmodMusicPlayer _fmp;

	public void Awake()
	{
		_fmp = GameObject.FindObjectOfType<FmodMusicPlayer>();
		if (_fmp != null)
		{
			_fmp.OnBeatEvent.AddListener(NotifyBeat);
		}
	}

	public void NotifyBeat(int barCount, int beatCount)
	{
		if (!gameObject.activeInHierarchy || !IsActive)
		{
			return;
		}

		if (!_fmp)
			return;

		SequenceIndex++;
		if (SequenceIndex >= SequenceTriggers.Count)
		{
			if (!Loop)
			{
				IsActive = false;
				SequenceIndex = -1;
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

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		switch (TriggerBehavior)
		{
			case EEnableBehavior.On:
				if (!IsActive)
				{
					SequenceIndex = -1;
					IsActive = true;
				}
				break;
			case EEnableBehavior.Off:
				if (IsActive)
				{
					IsActive = false;
				}
				break;
			case EEnableBehavior.Toggle:
				IsActive = !IsActive;
				SequenceIndex = -1;
				break;
		}
	}
}
