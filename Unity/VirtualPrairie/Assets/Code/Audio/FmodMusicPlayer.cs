using System;
using System.Collections;
using System.Collections.Generic;
using Assets.Code.StateTable;
using FMODUnity;
using FMOD.Studio;
using UnityEngine;


public abstract class PrairieMusicPlayer : MonoBehaviour
{
	public event System.EventHandler PlaybackStarted;
	public event System.EventHandler PlayerbackFinished;
	
	public abstract void PlayMusic(EventReference musicEvent);
	public abstract void StopMusic();
	public abstract void PauseMusic();
	public abstract void ResumeMusic();

	public abstract bool ReadyForPlayback();
}	

public class FmodMusicPlayer : PrairieMusicPlayer
{
	EventReference _curEventRef;
	EventInstance _curEventInstance;

	private FMOD.Studio.EVENT_CALLBACK _musicCallback;

	public enum EFmodMusicPlayerState
	{
		Stopped,
		Paused,
		Playing,
	}
	
	private enum EFmodMusicPlayerAction
	{
		[StateActionRequired(false)] Enter,
		[StateActionRequired(false)] Update,
		[StateActionRequired(false)] Exit,
		[StateActionRequired(false)] Play,
		[StateActionRequired(false)] Stop,
		[StateActionRequired(false)] Pause,
	}
	
	private StateTable<EFmodMusicPlayerState,FmodMusicPlayer,EFmodMusicPlayerAction> _stateMachine;
	
	private void createStateMachine()
	{
		_stateMachine = new StateTable<EFmodMusicPlayerState,FmodMusicPlayer,EFmodMusicPlayerAction>(this);
		_stateMachine.LogStatePrefix = "XXXX";
		_stateMachine.LogStateTransitions = true;
		_stateMachine.InitActionTable();
	}
	
	public override bool ReadyForPlayback()
	{
		return (_curEventInstance.isValid());
	}

	public override void PlayMusic(EventReference musicEvent)
	{
		_stateMachine.DoStateAction(EFmodMusicPlayerAction.Play,new StateTableValue{Value = musicEvent});
	}

	public override void ResumeMusic()
	{
		if (ReadyForPlayback())
			_stateMachine.DoStateAction(EFmodMusicPlayerAction.Play,new StateTableValue{Value = _curEventRef});
		else
			StopMusic();
	}

	public override void StopMusic()
	{
		_stateMachine.DoStateAction(EFmodMusicPlayerAction.Stop);
	}

	public override void PauseMusic()
	{
		_stateMachine.DoStateAction(EFmodMusicPlayerAction.Pause);
	}

	//===============
	// Unity Events
	//===============
	public void Awake()
	{
		createStateMachine();
		_stateMachine.GotoState(EFmodMusicPlayerState.Stopped);
	}
	
	public void Update()
	{
		_stateMachine.DoStateAction(EFmodMusicPlayerAction.Update);
	}

	void reset()
	{
		Debug.Log("fmp:RESET");
		_curEventInstance.clearHandle();
	}

	protected EventInstance createNewFmodEventInstance(EventReference eventRef)
	{
		EventInstance inst = FMODUnity.RuntimeManager.CreateInstance(eventRef);
		return inst;
	}


	//===============
	// FMod callback handler
	//===============

	//Helper function for beat callbacks
	[AOT.MonoPInvokeCallback(typeof(FMOD.Studio.EVENT_CALLBACK))]
    static FMOD.RESULT eventCallback(FMOD.Studio.EVENT_CALLBACK_TYPE type, IntPtr evInstancePtr, IntPtr parameterPtr)
	{
        FMOD.Studio.EventInstance instance = new FMOD.Studio.EventInstance(evInstancePtr);

		// switch (type)
		// {
		// Debug.Log($"Event: {type.ToString()}");
		// }
		return FMOD.RESULT.OK;
	}


	//=================
	// Stopped State
	//=================
	protected void StoppedEnter() 
	{
		if (_curEventInstance.isValid())
		{
			_curEventInstance.stop(FMOD.Studio.STOP_MODE.IMMEDIATE);
			_curEventInstance.setTimelinePosition(0);
			reset();
		}
	}
	protected void StoppedUpdate()
	{
		
	}
	protected void StoppedExit() { }
	protected void StoppedPlay(StateTableValue v)
	{
		EventReference ev = (EventReference)v.Value;
		startPlayingEvent(ev);
	}

	void startPlayingEvent(EventReference ev)
	{
		Debug.Log($"fmp: Trying to play:{ev.Path}");
		if (_curEventInstance.hasHandle())
		{
			Debug.Log("fmp: Releasing prev music handle");
			_curEventInstance.release();
		}

		_curEventInstance = createNewFmodEventInstance(ev);
		if (_curEventInstance.hasHandle())
		{
			Debug.Log("fmp: have handle");

			_musicCallback = new FMOD.Studio.EVENT_CALLBACK(eventCallback);
			_curEventInstance.setCallback(_musicCallback,EVENT_CALLBACK_TYPE.ALL);
			_stateMachine.GotoState(EFmodMusicPlayerState.Playing);
		}
		else
		{
			Debug.LogError("Something went wrong - no instance handle for music event");
		}
	}

	//=================
	// Paused State
	//=================
	protected void PausedEnter() 
	{ 
		if (!_curEventInstance.isValid())
		{
			Debug.Log($"fmp: bad curEventInstance - ABORT");
			reset();
			_stateMachine.GotoState(EFmodMusicPlayerState.Stopped);
			return;
		}
		_curEventInstance.setPaused(true);
		// _curEventInstance.stop(FMOD.Studio.STOP_MODE.IMMEDIATE);
	}
	protected void PausedUpdate()
	{
	
	}
	protected void PausedExit() { }
	protected void PausedPlay(StateTableValue v)
	{
		Debug.Log("fmp: Paused Play");
		EventReference ev = (EventReference)v.Value;
		if (ev.IsNull && _curEventInstance.isValid())
		{
			Debug.Log("fmp: Paused resume with NULL handle");
			_stateMachine.GotoState(EFmodMusicPlayerState.Playing);
			return;
		}
		
		if (!_curEventRef.IsNull && (ev.Path == _curEventRef.Path))
		{
			if (_curEventInstance.isValid())
			{
				Debug.Log("fmp: Paused resume with same handle");
				_stateMachine.GotoState(EFmodMusicPlayerState.Playing);
				return;
			}
		}

		Debug.Log("fmp: Paused different handle - start from scratch");
		startPlayingEvent(ev);		
	}

	protected void PausedStop()
	{
		_stateMachine.GotoState(EFmodMusicPlayerState.Stopped);
	}

	//=================
	// Playing State
	//=================
	protected void PlayingEnter() 
	{
		Debug.Log("fmp: playingEnter");
		if (!_curEventInstance.isValid())
		{
			Debug.LogWarning("Attempt to play invalid instance. Stopping");
			reset();
			_stateMachine.GotoState(EFmodMusicPlayerState.Stopped);
		}

		Debug.Log("fmp: playingEnter::start");
		bool isPaused;
		_curEventInstance.getPaused(out isPaused);
		if (isPaused)
		{
			_curEventInstance.setPaused(false);
		}
		else
		{
			_curEventInstance.start();
		}
	}
	protected void PlayingUpdate()
	{
	
	}
	protected void PlayingExit() { }
	protected void PlayingPause()
	{
		_stateMachine.GotoState(EFmodMusicPlayerState.Paused);
	}

	protected void PlayingStop()
	{
		_stateMachine.GotoState(EFmodMusicPlayerState.Stopped);
	}

	protected void PlayingPlay(StateTableValue v)
	{
		EventReference ev = (EventReference)v.Value;
		
		if (ev.IsNull)
		{
			_stateMachine.GotoState(EFmodMusicPlayerState.Stopped);
			return;
		}
		
		if (!_curEventRef.IsNull && (ev.Path == _curEventRef.Path))
		{
			// already playing
			return;
		}
		else if (!ev.IsNull)
		{
			startPlayingEvent(ev);
		}

	}
}
