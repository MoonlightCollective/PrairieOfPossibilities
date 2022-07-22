using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using System.Text.RegularExpressions;

public class UIDisplayBeatFlashButton : MonoBehaviour
{
	public TextMeshProUGUI SongNameText;
	public string NoSongText = "Scanning...";
	UIFlashingButton _button;
	FmodMusicPlayer _fmp;
	
	void Awake()
	{
		_button = GetComponent<UIFlashingButton>();
		SongNameText.text = NoSongText;
	}

	void Start()
	{
		_fmp = GameObject.FindObjectOfType<FmodMusicPlayer>();
		if (_fmp != null)
		{
			_fmp.OnBeatEvent.AddListener(NotifyBeat);
			_fmp.OnStartMusicEvent.AddListener(NotifySongStart);
		}
	}

	void NotifySongStart(string songName)
	{
		if (SongNameText ==  null)
			return;
		
		string newText = songName;
		if (songName.Contains("/"))
		{
			newText = songName.Substring(songName.LastIndexOf("/")+1);
			newText = Regex.Replace(newText, "[^a-zA-Z0-9]", "");
		}
		SongNameText.text = newText;
	}

	void NotifyBeat(int barCount, int beatCount)
	{
		_button.NotifyTriggered(new PrairieTriggerParams("beat",barCount,beatCount));
	}
}
