using System.Collections;
using System.Collections.Generic;
using Assets.Code.StateTable;
using UnityEngine;
using UnityEngine.Events;

public class PortalLogic : MonoBehaviour
{
	public float CooldownTime = 5.0f;
	public bool DebugRainbow = false;
	public enum EPortalSensorID { SensorA, SensorB };
	
	public UnityEvent OnEntryTrigger;
	public UnityEvent OnExitTrigger;
	
	// keeping a list of sensor data - order matters, and helps us determine entry direction.
	List<EPortalSensorID> _triggeredSensors = new List<EPortalSensorID>();

	// an array/list of rgb values for each led light in the portal
	List<int> _portalLights = new List<int>();

	private enum EPortalLogicState
	{
		Idle,
		PlayEcho,
		Cooldown,
	}
	
	private enum EPortalLogicAction
	{
		[StateActionRequired(false)] Enter,
		[StateActionRequired(false)] Update,
		[StateActionRequired(false)] Exit,
		[StateActionRequired(false)] SensorUpdate,
	}
	
	private StateTable<EPortalLogicState,PortalLogic,EPortalLogicAction> _stateMachine;
	
	public void NotifySensorEnter(EPortalSensorID id)
	{
		// Debug.Log($"{gameObject.name} - sensor enter!");

		if (!_triggeredSensors.Contains(id))
		{
			_triggeredSensors.Add(id);
			_stateMachine.DoStateAction(EPortalLogicAction.SensorUpdate);
		}
	}

	public void NotifySensorExit(EPortalSensorID id)
	{
		// Debug.Log($"{gameObject.name} - sensor exit!");

		if (_triggeredSensors.Contains(id))
		{
			_triggeredSensors.Remove(id);
			_stateMachine.DoStateAction(EPortalLogicAction.SensorUpdate);
		}
	}

	//===============
	// Unity Events
	//===============
	public void Awake()
	{
		findRequiredObjects();
		createStateMachine();
		_stateMachine.GotoState(EPortalLogicState.Idle);
	}
	
	public void Update()
	{
		_stateMachine.DoStateAction(EPortalLogicAction.Update);
	}
	protected void findRequiredObjects()
	{
		// find all of our lights
		
	}

	//=================
	// Idle State
	//=================
	protected void IdleEnter() { }
	protected void IdleUpdate() { }
	protected void IdleExit() { }
	protected void IdleSensorUpdate()
	{
		if (_triggeredSensors.Count >= 2)
		{
			_stateMachine.GotoState(EPortalLogicState.PlayEcho);
		}
	}

	//=================
	// PlayEcho State
	//=================
	protected void PlayEchoEnter()
	{
		// choose which event to play based on first entry
		if (_triggeredSensors[0] == EPortalSensorID.SensorA)
			doPlayEchoEntryEvent();
		else
			doPlayEchoExitEvent();
	}

	protected void PlayEchoUpdate()
	{
		_stateMachine.GotoState(EPortalLogicState.Cooldown);
	}
	protected void PlayEchoExit() { }

	protected void doPlayEchoEntryEvent()
	{
		Debug.Log($"PORTAL {gameObject.name} ENTRY");
		OnEntryTrigger?.Invoke();
	}

	protected void doPlayEchoExitEvent()
	{
		Debug.Log($"PORTAL {gameObject.name} EXIT");
		OnExitTrigger?.Invoke();
	}

	//=================
	// Cooldown State
	//=================
	float _cooldownTimer = 0.0f;
	protected void CooldownEnter() 
	{
		_cooldownTimer = 0.0f;
	}
	protected void CooldownUpdate()
	{
		_cooldownTimer += Time.deltaTime;
		if (_cooldownTimer > CooldownTime)
			_stateMachine.GotoState(EPortalLogicState.Idle);
	}

	protected void CooldownExit() { }

	//===============
	// Common stuff
	//===============
	private void createStateMachine()
	{
		_stateMachine = new StateTable<EPortalLogicState,PortalLogic,EPortalLogicAction>(this);
		_stateMachine.InitActionTable();
	}
	

}
