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

	public bool InfiniteRepeat = true;

	protected List<int> _playbackQueue = new List<int>();
	

	public void Awake()
	{
		resetQueue();
	}

	void resetQueue()
	{
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

	bool _started = false;
	public void Start()
	{
		playNextSong();
	}

	public void Update()
	{

	}

	void playNextSong()
	{
		if (_playbackQueue.Count() < 1)
			resetQueue();

		int dex = Mathf.Clamp(_playbackQueue[0],0,MusicEvents.Count()-1);
		_playbackQueue.Remove(0);
		MusicPlayer.PlayMusic(MusicEvents[dex]);
	}
}
