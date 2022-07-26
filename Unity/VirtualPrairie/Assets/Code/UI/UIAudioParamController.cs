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

	[Header("References")]

	private bool _isPlaying = false;
	private Image _playPauseImage;
	private PrairieMusicManager _musicManager;
	private FmodMusicPlayer _musicPlayer;
	public void Awake()
	{
		_playPauseImage = PlayPauseButton.GetComponent<Image>();
		_musicManager = PrairieGlobals.Instance.MusicManager;
		_musicPlayer = PrairieGlobals.Instance.MusicPlayer;
	}

	public void Start()
	{
		initOptionsList();
		AudioSelectDropdown.onValueChanged.AddListener(trackDropdownValueChange);
		PlayPauseButton.onClick.AddListener(playPauseToggle);
		_isPlaying = _musicPlayer.IsPlaying();
		updatePlayButtonImage();
	}

	void OnEnable()
	{
		_musicPlayer = PrairieGlobals.Instance.MusicPlayer;
		if (_musicPlayer)
		{
			_isPlaying = _musicPlayer.IsPlaying();
			Debug.Log("music is playing:" + _isPlaying);
			updatePlayButtonImage();
			updateSongSelection();
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
		foreach (var ev in _musicManager.Playlist.MusicEvents)
		{		
			string evPath = PrairieMusicManager.PathFromEventRef(ev);
			string evName = evPath.Substring(evPath.LastIndexOf("/"));
			// ev.Path.Substring(ev.Path.LastIndexOf("/"));
			Debug.Log($"Event {evName}");
			options.Add(evName);
		}
		AudioSelectDropdown.AddOptions(options);
	}

	public void trackDropdownValueChange(int val)
	{
		_musicManager.QueueSongAsNext(val);

		if (_isPlaying)
		{
			_musicManager.StopPlayback();
			_musicManager.StartPlayback();
			updateSongSelection();
		}
		else
		{
			_musicManager.StopPlayback();
			updateSongSelection(val);
		}

	}

	public void playPauseToggle()
	{
		_isPlaying = !_isPlaying;
		if (_isPlaying)
			_musicManager.StartPlayback();
		else
			_musicManager.PausePlayback();
		
		updatePlayButtonImage();
		updateSongSelection();
	}

	public void updateSongSelection()
	{
		AudioSelectDropdown.SetValueWithoutNotify(_musicManager.CurSongDex);
	}

	public void updateSongSelection(int explicitVal)
	{
		AudioSelectDropdown.SetValueWithoutNotify(explicitVal);
	}

	public void OnSongNext()
	{
		Debug.Log(("UIapc: NextSong"));
		_musicManager.StopPlayback();

		if (_isPlaying)
		{
			_musicManager.QueueSongAsNext(_musicManager.CurSongDex + 1);
			_musicManager.StartPlayback();
			updateSongSelection();
		}
		else
		{
			_musicManager.QueueSongAsNext(_musicManager.NextSongDex + 1);
			updateSongSelection(_musicManager.NextSongDex);
		}
	}

	public void OnSongPrev()
	{
		Debug.Log(("UIapc: PrevSong"));
		_musicManager.StopPlayback();


		if (_isPlaying)
		{
			_musicManager.QueueSongAsNext(_musicManager.CurSongDex - 1);
			_musicManager.StartPlayback();
			updateSongSelection();
		}
		else
		{
			_musicManager.QueueSongAsNext(_musicManager.NextSongDex - 1);
			updateSongSelection(_musicManager.NextSongDex);
		}
	}
}
