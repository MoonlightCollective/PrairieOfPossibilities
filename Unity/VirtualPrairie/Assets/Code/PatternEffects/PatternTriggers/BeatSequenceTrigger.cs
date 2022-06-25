using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class BeatSequenceEntry
{
	public TriggerEmitter Emitter;
	public PrairieTriggerParams Params;
}

public class BeatSequenceTrigger : TriggerListener
{
	public EEnableBehavior TriggerBehavior = EEnableBehavior.Toggle;
	public bool IsActive;
	public bool Loop = false;
	public int SequenceIndex = 0;
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
