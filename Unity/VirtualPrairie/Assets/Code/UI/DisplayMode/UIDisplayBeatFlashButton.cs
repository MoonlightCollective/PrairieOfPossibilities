using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIDisplayBeatFlashButton : MonoBehaviour
{
	UIFlashingButton _button;
	FmodMusicPlayer _fmp;
	
	void Awake()
	{
		_button = GetComponent<UIFlashingButton>();
	}

	void Start()
	{
		_fmp = GameObject.FindObjectOfType<FmodMusicPlayer>();
		if (_fmp != null)
		{
			_fmp.OnBeatEvent.AddListener(NotifyBeat);
		}
	}

	void NotifyBeat(int barCount, int beatCount)
	{
		Debug.Log("X");
		_button.NotifyTriggered(new PrairieTriggerParams("beat",barCount,beatCount));
	}
}
