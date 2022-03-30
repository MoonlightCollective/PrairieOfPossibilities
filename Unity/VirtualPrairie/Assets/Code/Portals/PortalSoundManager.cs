using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using FMODUnity;
using FMOD.Studio;
using System;

public class PortalSoundManager : MonoBehaviour
{
	public EventReference EntryEvent;
	public EventReference ExitEvent;
	protected EventInstance _curEventInstance;

	public void FireEntrySound()
	{
		if (alreadyPlaying())
		{
			Debug.Log("Can't play portal audio - already playing something");
			return;
		}
		playSoundEvent(EntryEvent);
	}

	public void FireExitSound()
	{
		if (alreadyPlaying())
		{
			Debug.Log("Can't play portal audio - already playing something");
			return;
		}
		playSoundEvent(ExitEvent);
	}

	protected bool alreadyPlaying()
	{
		if (_curEventInstance.isValid())
		{
			PLAYBACK_STATE playbackState;
			_curEventInstance.getPlaybackState(out playbackState);
			if (playbackState == PLAYBACK_STATE.PLAYING)
				return true;
		}

		return false;
	}

	void playSoundEvent(EventReference eventRef)
	{
		if (_curEventInstance.hasHandle())
		{
			Debug.Log("fmp: Releasing prev music handle");
			_curEventInstance.setUserData(IntPtr.Zero);
			_curEventInstance.release();
		}

		_curEventInstance =FMODUnity.RuntimeManager.CreateInstance(eventRef);
		if (!_curEventInstance.hasHandle())
		{
			Debug.LogWarning("psm: have NO handle!");
			return;
		}

		_curEventInstance.start();
	}
}
