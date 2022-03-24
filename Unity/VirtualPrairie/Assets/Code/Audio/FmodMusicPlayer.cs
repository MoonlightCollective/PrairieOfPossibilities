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
}

public class FmodMusicPlayer : PrairieMusicPlayer
{
	EventReference _curEventRef;
	EventInstance _curEventInstance;

	private enum EFmodMusicPlayerState
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
		_stateMachine.InitActionTable();
	}
	
	void reset()
	{
		_curEventInstance.clearHandle();
	}

	public override void PlayMusic(EventReference musicEvent)
	{
		_stateMachine.DoStateAction(EFmodMusicPlayerAction.Play,new StateTableValue{Value = musicEvent});
	}

	public override void StopMusic()
	{
		_stateMachine.DoStateAction(EFmodMusicPlayerAction.Stop);
	}

	//===============
	// Unity Events
	//===============
	public void Awake()
	{
		findRequiredObjects();
		createStateMachine();
		_stateMachine.GotoState(EFmodMusicPlayerState.Stopped);
	}
	
	public void Update()
	{
		_stateMachine.DoStateAction(EFmodMusicPlayerAction.Update);
	}

	private void findRequiredObjects()
	{
	}

	protected EventInstance createNewInstance(EventReference eventRef)
	{
		EventInstance inst = FMODUnity.RuntimeManager.CreateInstance(eventRef);
		return inst;
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
		}
	}
	protected void StoppedUpdate()
	{
		
	}
	protected void StoppedExit() { }
	protected void StoppedPlay(StateTableValue v)
	{
		EventReference ev = (EventReference)v.Value;
		
		Debug.Log($"fmp: Trying to play:{ev.Path}");
		if (_curEventInstance.hasHandle())
		{
			Debug.Log("fmp: Releasing prev music handle");
			_curEventInstance.release();
		}

		_curEventInstance = createNewInstance(ev);
		if (_curEventInstance.hasHandle())
		{
			Debug.Log("fmp: have handle");
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
			reset();
			_stateMachine.GotoState(EFmodMusicPlayerState.Stopped);
			return;
		}
		
		_curEventInstance.stop(FMOD.Studio.STOP_MODE.IMMEDIATE);
	}
	protected void PausedUpdate()
	{
	
	}
	protected void PausedExit() { }
	protected void PausedPlay(StateTableValue v)
	{
		EventReference ev = (EventReference)v.Value;
		if (ev.IsNull && _curEventInstance.isValid())
		{
			_stateMachine.GotoState(EFmodMusicPlayerState.Playing);
			return;
		}
		
		if (!_curEventRef.IsNull && (ev.Path == _curEventRef.Path))
		{
			if (_curEventInstance.isValid())
			{
				_stateMachine.GotoState(EFmodMusicPlayerState.Playing);
				return;
			}
		}
		
		doStartPlaying(ev);
	}

	void doStartPlaying(EventReference ev)
	{
		_curEventRef = ev;
		_curEventInstance = createNewInstance(ev);
		_stateMachine.GotoState(EFmodMusicPlayerState.Playing);
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
		_curEventInstance.start();
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
			doStartPlaying(ev);
		}

	}
}
