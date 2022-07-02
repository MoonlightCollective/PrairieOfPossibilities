using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

public class MusicBeatTrigger : TriggerBase
{
	public bool FilterBeats;
	[EnableIf("FilterBeats")]
	[ValidateInput("validateBeatStr")]
	[Tooltip("A string of 1's and 0's (no spaces) that tell me which beats to fire events on and which to skip")]
	public string FilterString;

	int _triggerCount = 0;
	const int kDefaultModVal = 4;

	protected float _lastBeatTime = -1f;
	protected float _clockMultTimer = 0f;
	protected float _timePerClockTick = 0f;
	protected int _lastBeatCount = -1;
	protected int _lastBarCount = 0;
	public enum EBeatDividerType
	{
		None,
		Mult,
		Divide
	}

	[Foldout("Clock Divider/Mult")]
	public EBeatDividerType BeatDividerType = EBeatDividerType.None;
	
	[Foldout("Clock Divider/Mult")]
	[Range(1,4)]
	public int DivMultFactor;

	FmodMusicPlayer _fmp;

	//
	// Awake - initalize. Get Music Player object and attach our callback handler
	//
	public void Awake()
	{
		_fmp = GameObject.FindObjectOfType<FmodMusicPlayer>();
		if (_fmp != null)
		{
			_fmp.OnBeatEvent.AddListener(NotifyBeat);
		}
	}

	//===============
	// NotifyBeat - Called by music player on each beat event from FMod.
	//				Pass this through to appropriate handler depending on clock 
	//				mode (division, multilipcation, or just straight)
	//===============
	public void NotifyBeat(int barCount,int beatCount)
	{
		// Debug.Log($"Notify Beat:{barCount}:{beatCount})");
		if (!gameObject.activeInHierarchy)
			return;
		
		switch (BeatDividerType)
		{
			case EBeatDividerType.None:
				notifyBeatInternal(barCount,beatCount);
				break;
			case EBeatDividerType.Divide:
				notifyBeatInternalDivider(barCount,beatCount);
				break;
			case EBeatDividerType.Mult:
				notifyBeatInternalMultiplier(barCount,beatCount);
				break;
		}

	}

	//===============
	// notifyBeatInternal - handle a beat, filtering it through our filter string
	// 						if we have one and then fire triggers.
	//===============
	void notifyBeatInternal(int barCount, int beatCount)
	{
		_lastBarCount = barCount;
		_lastBeatCount = beatCount;
		if (FilterBeats && !string.IsNullOrEmpty(FilterString))
		{
			if (BeatDividerType == EBeatDividerType.None)
				_triggerCount = (barCount * _fmp.BeatsPerBar + beatCount)%FilterString.Length;
			else
				_triggerCount = beatCount%FilterString.Length;
			
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

	//===============
	// validateBeatStr - detect invalid beat strings. Beat stirngs shold contain 1's and 0's for each beat - 1 means trigger, 0 means no trigger.
	//===============
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

	//===============
	// notifyBeatInternalDivider - a clock divider only fires every X number of beats (slowing time.)
	//===============
	int _divBar = 0;
	void notifyBeatInternalDivider(int barCount, int beatCount)
	{
		// clock division - only count every x beats.
		int trigCount = barCount * _fmp.BeatsPerBar + beatCount;
		int beatsPerReset = _fmp.BeatsPerBar * DivMultFactor; // reset at a multiple of number of bar count.
		int divBars = barCount/beatsPerReset;

		int divBeat = trigCount % beatsPerReset;

		if (trigCount % DivMultFactor == 0)
		{
			notifyBeatInternal(divBars,divBeat);
		}

		_lastBarCount = divBars;
		_lastBeatCount = divBeat;
	}

	//===============
	// notifyBeatInternalMultiplier - a clock multiplier subdivides time further, adding internal beats between beats.
	//===============
	float _delta;
	void notifyBeatInternalMultiplier(int barCount, int beatCount)
	{
		if (_lastBeatTime <= 0)
		{
			_lastBeatTime = Time.time;
			notifyBeatInternal(barCount,beatCount * (int)DivMultFactor);
			return;
		}

		_delta = Time.time - _lastBeatTime;
		_lastBeatTime = Time.time;

		_timePerClockTick = _delta / DivMultFactor;
		notifyBeatInternal(barCount,beatCount * (int)DivMultFactor);
		_lastBarCount = barCount;
		_lastBeatCount = beatCount * DivMultFactor;
		_clockMultTimer = 0f;
	}

	public void Update()
	{
		switch (BeatDividerType)
		{
			case EBeatDividerType.None:
			case EBeatDividerType.Divide:
				return;
		}

		// multiplier!
		_clockMultTimer += Time.deltaTime;
		if (_clockMultTimer >= _timePerClockTick)
		{
			_lastBeatCount++;
			_clockMultTimer -= _timePerClockTick;
			if (_lastBeatCount < DivMultFactor * 4)
				notifyBeatInternal(_lastBarCount,_lastBeatCount);
		}
		
		return;
	}
}
