using System.Collections;
using System.Collections.Generic;
using Assets.Code.StateTable;
using NaughtyAttributes;
using UnityEngine;


public enum ESquenceTriggerBehavior
{
	OneShot,
	LoopToggle,
	LoopCount,
}

[System.Serializable]
public class TriggerSequenceEntry
{
	public string Name = "Trigger";
	public float StepPreDelay = 0f;
	public TriggerEmitter TriggerTargets;
}

public class TimedSequenceTrigger : TriggerListener
{
	public ESquenceTriggerBehavior RunBehaviour = ESquenceTriggerBehavior.OneShot;
	[ShowIf("RunBehaviour", ESquenceTriggerBehavior.LoopCount)]
	public int LoopCount = 1;

	public List<TriggerSequenceEntry> SequenceTriggers;
	public bool StartActive = false;
	public float DelayBetweenTriggers = 1.0f;

	[Range(0.1f,10)]
	public float TimeMult = 1f;
	private float _delayTimer = 0f;
	private int _nextTriggerDex = 0;

	protected enum ETimedSequenceTriggerState
	{
		Init,
		Idle,
		Running,
	}
	
	protected enum ETimedSequenceTriggerAction
	{
		Enter,
		Update,
		NotifyTrigger,
		Exit,
	}
	
	protected StateTable<ETimedSequenceTriggerState,TimedSequenceTrigger,ETimedSequenceTriggerAction> _stateMachine;
	
	protected PrairieTriggerParams _triggerParams;

	//===============
	// TriggerListener events
	//===============
	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		_stateMachine.DoStateAction(ETimedSequenceTriggerAction.NotifyTrigger, new StateTableValue{ Value = tParams});
	}

	//===============
	// Unity Events
	//===============
	public void Awake()
	{
		createStateMachine();
		_stateMachine.GotoState(ETimedSequenceTriggerState.Init);
	}

	protected void createStateMachine()
	{
		_stateMachine = new StateTable<ETimedSequenceTriggerState,TimedSequenceTrigger,ETimedSequenceTriggerAction>(this);
		_stateMachine.InitActionTable();
	}
	
	public void Update()
	{
		_stateMachine.DoStateAction(ETimedSequenceTriggerAction.Update);
	}

	//=================
	// Init State
	//=================
	protected virtual void InitEnter(){}
	protected virtual void InitUpdate()
	{
		_stateMachine.GotoState(StartActive?ETimedSequenceTriggerState.Running:ETimedSequenceTriggerState.Idle);
	}

	//=================
	// Idle State
	//=================
	protected virtual void IdleEnter()
	{
		_delayTimer = 0f;
		_nextTriggerDex = 0;
	}
	protected virtual void IdleUpdate()
	{

	}

	protected virtual void IdleNotifyTrigger(StateTableValue v)
	{
		if (SequenceTriggers.Count > 0)
		{
			_triggerParams = (PrairieTriggerParams)v.Value;
			_stateMachine.GotoState(ETimedSequenceTriggerState.Running);
		}
	}

	//=================
	// Running State
	//=================
	int _loopsRemaining = 0;
	protected virtual void RunningEnter()
	{
		if (SequenceTriggers.Count < 1)
		{
			_stateMachine.GotoState(ETimedSequenceTriggerState.Idle);
		}
		_loopsRemaining = LoopCount;
		_nextTriggerDex = 0;
		_delayTimer = SequenceTriggers[_nextTriggerDex].StepPreDelay;
	}

	protected virtual void RunningNotifyTrigger(StateTableValue v)
	{
		if (RunBehaviour == ESquenceTriggerBehavior.LoopToggle)
		{
			_stateMachine.GotoState(ETimedSequenceTriggerState.Idle);
		}
	}

	protected virtual void RunningUpdate()
	{
		_delayTimer -= Time.deltaTime * TimeMult;
		if (_delayTimer < 0f)
		{
			SequenceTriggers[_nextTriggerDex].TriggerTargets.EmitTrigger(_triggerParams);
			_nextTriggerDex++;
			if (_nextTriggerDex >= SequenceTriggers.Count)
			{
				switch (RunBehaviour)
				{
					case ESquenceTriggerBehavior.OneShot:
						_delayTimer = 0f;
						_nextTriggerDex = 0;
						_stateMachine.GotoState(ETimedSequenceTriggerState.Idle);
						return;
					case ESquenceTriggerBehavior.LoopToggle:
						_nextTriggerDex = 0;
						break;
					case ESquenceTriggerBehavior.LoopCount:
						_loopsRemaining--;
						_nextTriggerDex = 0;
						if (_loopsRemaining < 1)
						{
							_stateMachine.GotoState(ETimedSequenceTriggerState.Idle);
							break;
						}
						break;
				}
			}
			_delayTimer += DelayBetweenTriggers;
			_delayTimer += SequenceTriggers[_nextTriggerDex].StepPreDelay;
		}
	}
}
