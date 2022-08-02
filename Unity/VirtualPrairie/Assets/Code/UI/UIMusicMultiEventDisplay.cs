using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class UIMusicMultiEventDisplay : MonoBehaviour
{
	List<UIMusicEventSingleSlot> _eventSlots;
	FmodMusicPlayer _fmp;
	public TextMeshProUGUI SongPositionText;
	
	void Awake()
	{
		_eventSlots = new List<UIMusicEventSingleSlot>(GetComponentsInChildren<UIMusicEventSingleSlot>());
		_fmp = PrairieGlobals.Instance.MusicPlayer;
		_fmp.OnMarkerEvent.AddListener((e)=>NotifyMarker(e));
		SongPositionText.text = "-";
	}

	void NotifyMarker(string markerName)
	{
		if (_eventSlots.Count < 1)
			return;
		
		for (int i = _eventSlots.Count-1; i >= 0; i--)
		{
			if (!_eventSlots[i].IsActive)
			{
				_eventSlots[i].Flash(markerName);
				return;
			}
		}
		// if we get here, we have no slot.  Just use our first one.
		_eventSlots[_eventSlots.Count-1].Flash(markerName);
	}

	void Update()
	{
		int mSec = _fmp.LastTimelinePos;
		float secs = (float)mSec/1000f;
		var timespan = TimeSpan.FromSeconds(secs);            
		string posStr = timespan.ToString(@"mm\:ss");
		SongPositionText.text = posStr;
	}
}
