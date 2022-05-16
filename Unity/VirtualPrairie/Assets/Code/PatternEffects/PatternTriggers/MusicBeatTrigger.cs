using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

public class MusicBeatTrigger : TriggerBase
{
	public bool FilterBeats;
	[EnableIf("FilterBeats")]
	[ValidateInput("validateBeatStr")]
	public string FilterString;

	int _triggerCount = 0;
	const int kDefaultModVal = 4;

	FmodMusicPlayer _fmp;
	public void Awake()
	{
		_fmp = GameObject.FindObjectOfType<FmodMusicPlayer>();
		if (_fmp != null)
		{
			_fmp.OnBeatEvent.AddListener(NotifyBeat);
		}
	}

	public void NotifyBeat(int barCount,int beatCount)
	{
		Debug.Log($"Notify Beat:{barCount}:{beatCount})");
		if (!gameObject.activeInHierarchy)
			return;

		if (FilterBeats && !string.IsNullOrEmpty(FilterString))
		{
			_triggerCount = (barCount * _fmp.BeatsPerBar + beatCount)%FilterString.Length;
			if (FilterString[_triggerCount] == '1')
			{
				TriggerTargets.EmitTrigger(new PrairieTriggerParams("Beat",(float)_triggerCount,0));
			}
		}
		else
		{
			_triggerCount = beatCount;
			TriggerTargets.EmitTrigger(new PrairieTriggerParams("Beat",(float)_triggerCount,0));
		}
	}

	private bool validateBeatStr()
	{
		if (string.IsNullOrEmpty(FilterString))
			return true;

		foreach (var c in FilterString.ToCharArray())
		{
			if (c != '0' && c != '1')
			{
				return false;
			}
		}
		return true;
	}
}
