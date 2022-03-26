using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class UIAudioParamController : MonoBehaviour
{
	[Header("Transport and Selection")]
	public TMP_Dropdown AudioSelectDropdown;
	public Button PlayPauseButton;
	public Sprite PlaySprite;
	public Sprite PauseSprite;
	public bool AutoPlay = false;

	[Header("References")]
	public FmodMusicPlayer MusicPlayer;
	public PrairieMusicManager MusicManager;

	private bool _isPlaying = false;
	private Image _playPauseImage;

	public void Start()
	{
		_playPauseImage = PlayPauseButton.GetComponent<Image>();

		initOptionsList();
		AudioSelectDropdown.onValueChanged.AddListener(trackDropdownValueChange);
		PlayPauseButton.onClick.AddListener(playPauseToggle);

		if (AutoPlay)
		{
			MusicManager.QueueSongAsNext(0);
			MusicManager.StartPlayback();
			playPauseToggle();
			updatePlayButtonImage();
			updateSongSelection();
		}
		else
		{
			_isPlaying = false;
			updatePlayButtonImage();
		}
	}

	void updatePlayButtonImage()
	{
		_playPauseImage.sprite = _isPlaying?PauseSprite:PlaySprite;
	}

	void initOptionsList()
	{
		AudioSelectDropdown.ClearOptions();
		List<string> options = new List<string>();
		foreach (var ev in MusicManager.MusicEvents)
		{
			string evName = ev.Path.Substring(ev.Path.LastIndexOf("/"));
			Debug.Log($"Event {evName}");
			options.Add(evName);
		}
		AudioSelectDropdown.AddOptions(options);
	}

	public void trackDropdownValueChange(int val)
	{
		MusicManager.QueueSongAsNext(val);

		if (_isPlaying)
		{
			MusicManager.StopPlayback();
			MusicManager.StartPlayback();
			updateSongSelection();
		}
		else
		{
			MusicManager.StopPlayback();
			updateSongSelection(val);
		}

	}

	public void playPauseToggle()
	{
		_isPlaying = !_isPlaying;
		if (_isPlaying)
			MusicManager.StartPlayback();
		else
			MusicManager.PausePlayback();
		
		updatePlayButtonImage();
		updateSongSelection();
	}

	public void updateSongSelection()
	{
		AudioSelectDropdown.SetValueWithoutNotify(MusicManager.CurSongDex);
	}

	public void updateSongSelection(int explicitVal)
	{
		AudioSelectDropdown.SetValueWithoutNotify(explicitVal);
	}

	public void HandleSkip()
	{
		MusicManager.SkipToNextSong();
		updateSongSelection();
	}
}
