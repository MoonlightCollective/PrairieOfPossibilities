using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using FMODUnity;
using FMOD.Studio;
using UnityEngine.Events;

public enum EMusicPlaybackStyle
{
	Linear,
	Random,
}

public class PrairieMusicManager : MonoBehaviour
{
	public EMusicPlaybackStyle PlaybackStyle;
	public PrairieMusicPlayer MusicPlayer;
	
	public System.EventHandler<int> OnSongStart;
	public UnityEvent OnPlaylistCompleted;
	
	public bool InfiniteRepeat = true;

	protected List<int> _playbackQueue = new List<int>();
	protected FmodPlaylist _playlist;
	public FmodPlaylist Playlist => _playlist;

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
		_playlist = GameObject.FindObjectOfType<FmodPlaylist>();
		
		_playbackQueue = new List<int>();

		if (_playlist == null)
		{
			Debug.LogError("No playlist object found - music manager queue empty");
			return;
		}
		
		for (int i = 0; i < _playlist.MusicEvents.Count; i++)
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
			songDex = _playlist.MusicEvents.Count()-1;
		if (songDex >= _playlist.MusicEvents.Count())
			songDex = 0;

		_playbackQueue.Insert(0,songDex);
		Debug.Log($"MM: queued song dex {songDex} ({this.NextSongDex})");
	}

	public String CurSongPath()
	{
		if (_curDex < 0)
			return "";
		else
			return PathFromEventRef(_playlist.MusicEvents[_curDex]);
	}

	public String CurSongName()
	{
		string evPath = CurSongPath();
		if (evPath.Contains("/"))
		{
			string evName = evPath.Substring(evPath.LastIndexOf("/"));
			return evName;
		}
		return "-";
	}

	public static string PathFromEventRef(EventReference ev)
	{
		string pathStr = "";
		try 
		{
			var ed = RuntimeManager.GetEventDescription(ev);
			ed.getPath(out pathStr);
		}
		catch
		{
			pathStr = "BAD EVENT";
		}

		return pathStr;
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
			_curDex = _curDex = Mathf.Clamp(_playlist.MusicEvents.Count()-1,0,_playlist.MusicEvents.Count()-1);
		MusicPlayer.StopMusic();
		MusicPlayer.PlayMusic(_playlist.MusicEvents[_curDex]);
	}

	void playNextSong()
	{
		if (_playbackQueue.Count() < 1)
			resetQueue();

		int dex = Mathf.Clamp(_playbackQueue[0],0,_playlist.MusicEvents.Count()-1);
		_playbackQueue.RemoveAt(0);
		MusicPlayer.PlayMusic(_playlist.MusicEvents[dex]);
		_curDex = dex;
	}

	public void NotifySongComplete()
	{
		if (InfiniteRepeat)
		{
			playNextSong();
			return;
		}
		
		if (_playbackQueue.Count() < 1)
		{
			StopPlayback();
			OnPlaylistCompleted?.Invoke();
		}
	}
}
