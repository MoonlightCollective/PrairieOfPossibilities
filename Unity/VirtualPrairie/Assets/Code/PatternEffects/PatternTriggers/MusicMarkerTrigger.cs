using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

public class MusicMarkerTrigger : TriggerBase
{
	public string Marker;
	public bool PerfectMatch = true;

	FmodMusicPlayer _fmp;
	public void Awake()
	{
		_fmp = GameObject.FindObjectOfType<FmodMusicPlayer>();
		if (_fmp != null)
		{
			_fmp.OnMarkerEvent.AddListener(NotifyMarker);
		}
	}

	public void NotifyMarker(string eventMarker)
	{
		if (PerfectMatch)
		{
			if (eventMarker == Marker)
			{
				TriggerTargets.EmitTrigger(new PrairieTriggerParams(Marker,0,0));
			}
		}
		else if (eventMarker.Contains(Marker))
		{
			TriggerTargets.EmitTrigger(new PrairieTriggerParams(Marker,0,0));
		}
	}
}
