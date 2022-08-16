using System.Collections;
using System.Collections.Generic;
using Assets.Code.StateTable;
using FMOD.Studio;
using FMODUnity;
using UnityEngine;

public class EchoEventTrigger : TriggerListener
{
	public List<EventReference> FmodEvents;
	public float CooldownTime = 5.0f;
	public float VoiceVolumeTarget = 0f;
	public float VoiceDuckRate = 1.0f;
	public float VoiceDuckDuration = 15.0f;

	string kVoiceEventVolKey = "VEventVol";

	EventInstance _inst;
	private float _cachedVoiceVol = 1.0f;
	private float _curVoiceVol = 1.0f;
	private int _portalDex = 0;

	private enum EEchoEventTriggerState
	{
		Init,
		Idle,
		Playing,
		Cooldown,
	}
	
	private enum EEchoEventTriggerAction
	{
		[StateActionRequired(false)] Enter,
		[StateActionRequired(false)] Update,
		[StateActionRequired(false)] Exit,
		[StateActionRequired(false)] NotifyTrigger,
	}
	
	private StateTable<EEchoEventTriggerState,EchoEventTrigger,EEchoEventTriggerAction> _stateMachine;
	
	private void createStateMachine()
	{
		_stateMachine = new StateTable<EEchoEventTriggerState,EchoEventTrigger,EEchoEventTriggerAction>(this);
		_stateMachine.InitActionTable();
	}

	//===============
	// Unity Events
	//===============
	public void Awake()
	{
		createStateMachine();
		_stateMachine.GotoState(EEchoEventTriggerState.Init);
	}
	
	public void Update()
	{
		_stateMachine.DoStateAction(EEchoEventTriggerAction.Update);
	}

	public void Start()
	{

	}

	void OnDestroy()
	{
		if (_inst.isValid())
		{
			_inst.release();
		}
	}

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		int portalDex = ((int)tParams.Param1) - 1;
		_stateMachine.DoStateAction(EEchoEventTriggerAction.NotifyTrigger, new StateTableValue{ Value = portalDex });
	}

	//=================
	// Init State
	//=================
	protected void InitEnter() 
	{
	}
	protected void InitUpdate()
	{
		_stateMachine.GotoState(EEchoEventTriggerState.Idle);
	}
	protected void InitExit() { }

	//=================
	// Idle State
	//=================
	protected void IdleEnter() { }
	protected void IdleUpdate()
	{
	
	}
	protected void IdleExit() { }
	protected void IdleNotifyTrigger(StateTableValue v)
	{
		int dex = (int)v.Value;
		if (dex < FmodEvents.Count)
		{
			_portalDex = dex;
			_stateMachine.GotoState(EEchoEventTriggerState.Playing);
		}
	}

	//=================
	// Playing State
	//=================
	float _voiceDucTimer = 0f;
	protected void PlayingEnter()
	{
		_inst = FMODUnity.RuntimeManager.CreateInstance(FmodEvents[_portalDex]);
		if (_inst.isValid())
		{
			_inst.start();
		}

		FMODUnity.RuntimeManager.StudioSystem.getParameterByName(kVoiceEventVolKey,out _curVoiceVol);
		_cachedVoiceVol = _curVoiceVol;
		_voiceDucTimer = VoiceDuckDuration;
	}
	protected void PlayingUpdate()
	{
		if (_curVoiceVol > VoiceVolumeTarget)
		{
			_curVoiceVol = Mathf.MoveTowards(_curVoiceVol,VoiceVolumeTarget,Time.deltaTime * VoiceDuckRate);
			FMODUnity.RuntimeManager.StudioSystem.setParameterByName(kVoiceEventVolKey,_curVoiceVol);
		}

		if (_voiceDucTimer > 0)
		{
			_voiceDucTimer -= Time.deltaTime;
		}
		else 
		{
			if (_inst.isValid())
			{
				PLAYBACK_STATE pbs = PLAYBACK_STATE.STOPPED;
				_inst.getPlaybackState(out pbs);
				Debug.Log("Playback state:" + pbs.ToString());
				if (pbs != PLAYBACK_STATE.PLAYING && pbs != PLAYBACK_STATE.STARTING)
				{
					Debug.Log("Not playing any more");
					_stateMachine.GotoState(EEchoEventTriggerState.Cooldown);
					return;			
				}
			}
			else
			{
				Debug.Log("Invalid Instance");
				_stateMachine.GotoState(EEchoEventTriggerState.Cooldown);
				return;			
			}
		}
	}

	protected void PlayingExit()
	{
		if (_inst.isValid())
		{
			_inst.release();
		}
	}
	protected void PlayingNotifyTrigger(StateTableValue v)
	{
		Debug.Log("EchoEvent: Currently playing, ignoring echo event trigger");
	}

	//=================
	// Cooldown State
	//=================
	float _cooldownTimer;
	protected void CooldownEnter() 
	{
		_cooldownTimer = CooldownTime;
	}
	protected void CooldownUpdate()
	{
		if (_curVoiceVol < _cachedVoiceVol)
		{
			_curVoiceVol = Mathf.MoveTowards(_curVoiceVol,_cachedVoiceVol,Time.deltaTime * VoiceDuckRate);
			FMODUnity.RuntimeManager.StudioSystem.setParameterByName(kVoiceEventVolKey,_curVoiceVol);
		}

		_cooldownTimer -= Time.deltaTime;
		if (_cooldownTimer <= 0)
		{
			_stateMachine.GotoState(EEchoEventTriggerState.Idle);
		}
	}
	protected void CooldownExit() 
	{
		FMODUnity.RuntimeManager.StudioSystem.setParameterByName(kVoiceEventVolKey,_cachedVoiceVol);
	}
	protected void CooldownNotifyTrigger(StateTableValue v)
	{
		Debug.Log($"EchoEvent: Currently cooling down ({_cooldownTimer} secs left), ignoring echo event trigger");
	}

}
