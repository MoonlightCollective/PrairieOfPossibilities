using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MusicMarkerGate : GateBase
{
	public string OnMarker;
	public string OffMarker;
	public bool PerfectMatch = true;
	public bool SendOffWithMusicStop = true;
	// TODO - add an ALL OFF capability for when a new song is selected.

	FmodMusicPlayer _fmp;
	public override void Awake()
	{
		base.Awake();
		_fmp = GameObject.FindObjectOfType<FmodMusicPlayer>();
		if (_fmp != null)
		{
			_fmp.OnMarkerEvent.AddListener(NotifyMarker);
		}
	}

	public void NotifyMusicStopped(string eventStr)
	{
		if (SendOffWithMusicStop)
		{
			GateTargets.EmitOffEvent(new PrairieTriggerParams(OffMarker,0,0));
		}
	}

	public void NotifyMusicStarted(string eventStr)
	{

	}

	public void NotifyMarker(string eventMarker)
	{
		if (PerfectMatch)
		{
			if (eventMarker == OnMarker)
			{
				GateTargets.EmitOnEvent(new PrairieTriggerParams(OnMarker,0,0));
			}
			else if (eventMarker == OffMarker)
			{
				GateTargets.EmitOffEvent(new PrairieTriggerParams(OffMarker,0,0));
			}
		}
		else
		{
			if (eventMarker.Contains(OnMarker))
			{
				GateTargets.EmitOnEvent(new PrairieTriggerParams(OnMarker,0,0));
			}
			else if (eventMarker.Contains(OffMarker))
			{
				GateTargets.EmitOffEvent(new PrairieTriggerParams(OffMarker,0,0));
			}
		}

	}

}
