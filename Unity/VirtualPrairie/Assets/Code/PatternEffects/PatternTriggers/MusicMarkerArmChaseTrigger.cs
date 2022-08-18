using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

public class MusicMarkerArmChaseTrigger : MonoBehaviour
{
	public List<ArmChaseTriggerMusicMarkerEntry> MarkerEntries;
	public bool NeedsRebuild = false;
	Dictionary<string,ArmChaseTriggerEntry> _triggerDict = new Dictionary<string, ArmChaseTriggerEntry>();
	FmodMusicPlayer _fmp;

	public void Awake()
	{
		_fmp = GameObject.FindObjectOfType<FmodMusicPlayer>();
		if (_fmp != null)
		{
			_fmp.OnMarkerEvent.AddListener(NotifyMarker);
		}

		rebuildDictionary();
	}

	void rebuildDictionary()
	{
		_triggerDict.Clear();
		foreach (var e in MarkerEntries)
		{
			_triggerDict[e.MusicMarker] = e;
		}
		NeedsRebuild = false;
	}


	public void Update()
	{
		if (NeedsRebuild)
			rebuildDictionary();
	}

	public void NotifyMarker(string eventMarker)
	{
		Debug.Log("MARKER:" + eventMarker);
		if (_triggerDict.ContainsKey(eventMarker))
		{
			_triggerDict[eventMarker].EmitTrigger();
		}
	}

}
