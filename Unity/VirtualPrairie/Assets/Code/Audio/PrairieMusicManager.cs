using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using FMODUnity;
using FMOD.Studio;

public enum EMusicPlaybackStyle
{
	Linear,
	Random,
}

public class PrairieMusicManager : MonoBehaviour
{
	public List<EventReference> MusicEvents;
	public EMusicPlaybackStyle PlaybackStyle;
	public PrairieMusicPlayer MusicPlayer;
	
	public System.EventHandler<int> OnSongStart;

	public bool InfiniteRepeat = true;

	protected List<int> _playbackQueue = new List<int>();

	protected int _curDex = -1;
	public int CurSongDex => _curDex;
	public int NextSongDex => _playbackQueue[0];
	public void Awake()
	{
		resetQueue();
	}

	void resetQueue()
	{
		Debug.Log("MM: Reset Queue");
		_playbackQueue = new List<int>();
		for (int i = 0; i < MusicEvents.Count; i++)
		{
			_playbackQueue.Add(i);
		}

		switch (PlaybackStyle)
		{
			case EMusicPlaybackStyle.Linear:
				break;
			case EMusicPlaybackStyle.Random:
				shuffleQueue();
				break;
		}
	}

	void shuffleQueue()
	{
		var rnd = new System.Random();
		_playbackQueue.OrderBy(x=>rnd.Next());
	}

	public void Start()
	{
		// playNextSong();
	}

	public void QueueSongAsNext(int songDex)
	{
		if (songDex < 0)
			songDex = MusicEvents.Count()-1;
		if (songDex >= MusicEvents.Count())
			songDex = 0;

		_playbackQueue.Insert(0,songDex);
		Debug.Log($"MM: queued song dex {songDex} ({this.NextSongDex})");
	}

	public String CurSongPath()
	{
		if (_curDex < 0)
			return "";
		else
			return MusicEvents[_curDex].Path;
	}
	

	public void StopPlayback()
	{
		MusicPlayer.StopMusic();
	}

	public void StartPlayback()
	{
		if (MusicPlayer.ReadyForPlayback())
			MusicPlayer.ResumeMusic();
		else		
			playNextSong();
	}

	public void PausePlayback()
	{
		MusicPlayer.PauseMusic();
	}

	public void SkipToNextSong()
	{
		MusicPlayer.StopMusic();
		playNextSong();
	}

	public void SkipToPrevSong()
	{
		_curDex--;
		if (_curDex < 0)
			_curDex = _curDex = Mathf.Clamp(MusicEvents.Count()-1,0,MusicEvents.Count()-1);
		MusicPlayer.StopMusic();
		MusicPlayer.PlayMusic(MusicEvents[_curDex]);
	}

	void playNextSong()
	{
		if (_playbackQueue.Count() < 1)
			resetQueue();

		int dex = Mathf.Clamp(_playbackQueue[0],0,MusicEvents.Count()-1);
		_playbackQueue.RemoveAt(0);
		MusicPlayer.PlayMusic(MusicEvents[dex]);
		_curDex = dex;
	}
}
