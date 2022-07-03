using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using Assets.Code.StateTable;
using FMOD.Studio;
using FMODUnity;
using UnityEngine;

[System.Serializable]
public class HearbeatFmodVals
{
	public float SpeedVal = 0f;
	public float DistVal = 1f;
}

public class BoothTriggerHandler : TriggerListener
{

	[Header("Audio Event Params")]
	public List<HearbeatFmodVals> HeartbeatFmodParams = new List<HearbeatFmodVals>();
	public EventReference HeartbeatEvent;
	EventInstance _heartbeatInstance;
	public EventReference EnterEvent;
	EventInstance _enterEventInstance;
	public EventReference ExitEvent;
	EventInstance _exitEventInstance;

	[Header("Event Triggers")]
	public TriggerEmitter EnterDoorTrigger;
	public TriggerEmitter ExitDoorTrigger;
	public TriggerEmitter SingleThumpTrigger;

	private FMOD.Studio.EVENT_CALLBACK _heartFmodCallback;
	private GCHandle _heartFmodCallbackUserDataHandle;

	public void Start()
	{
		createFmodInstances();
	}
	
	//
	// createFModInstances - do all the audio trigger setup, including installing a callback handler for hearbeat
	//
	void createFmodInstances()
	{
		_heartbeatInstance = FMODUnity.RuntimeManager.CreateInstance(HeartbeatEvent);
		_enterEventInstance = FMODUnity.RuntimeManager.CreateInstance(EnterEvent);
		_exitEventInstance = FMODUnity.RuntimeManager.CreateInstance(ExitEvent);

		_heartFmodCallbackUserDataHandle = GCHandle.Alloc(this);
		_heartFmodCallback = new FMOD.Studio.EVENT_CALLBACK(fmodEventCallback);
		_heartbeatInstance.setUserData(GCHandle.ToIntPtr(_heartFmodCallbackUserDataHandle));
		_heartbeatInstance.setCallback(_heartFmodCallback,EVENT_CALLBACK_TYPE.TIMELINE_MARKER);
	}

	[AOT.MonoPInvokeCallback(typeof(FMOD.Studio.EVENT_CALLBACK))]
	static FMOD.RESULT fmodEventCallback(FMOD.Studio.EVENT_CALLBACK_TYPE type, IntPtr evInstancePtr, IntPtr parameterPtr)
	{
		FMOD.Studio.EventInstance instance = new FMOD.Studio.EventInstance(evInstancePtr);
		
		IntPtr evUserDataPtr;
		BoothTriggerHandler bthInstance = null;
		FMOD.RESULT result = instance.getUserData(out evUserDataPtr);
		if (result != FMOD.RESULT.OK)
		{
			Debug.LogError("fmp: Event callback user data error: " + result);
		}
		else if (evUserDataPtr != IntPtr.Zero)
		{
			// Get the object to store beat and marker details
			GCHandle userHandle = GCHandle.FromIntPtr(evUserDataPtr);
			bthInstance = (BoothTriggerHandler)userHandle.Target;
		}

		switch (type)
		{
			case FMOD.Studio.EVENT_CALLBACK_TYPE.TIMELINE_MARKER:
			{
				var timelineParam = (FMOD.Studio.TIMELINE_MARKER_PROPERTIES)Marshal.PtrToStructure(parameterPtr, typeof(FMOD.Studio.TIMELINE_MARKER_PROPERTIES));
				if (bthInstance != null)
				{
					string pName = timelineParam.name;
					Debug.Log($"---booth marker: {pName}");
					if (pName.Contains("Thump"))
					{
						bthInstance.NotifyHeartThump(pName);
					}
				}
				break;
			}
		}

		return FMOD.RESULT.OK;
	}

	public virtual void NotifyHeartThump(string eventName)
	{
		SingleThumpTrigger.EmitTrigger(new PrairieTriggerParams(eventName));
	}

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		string evName = tParams.Name;
		Debug.Log($"BoothTrigger: {evName}");
		if (evName.Contains("Zone"))
		{
			handleZoneEvent(tParams);
		}
		else if (evName.Contains("ProximityExit"))
		{
			handleZoneExitEvent();
		}
		else if (evName.Contains("Door"))
		{
			handleDoorEvent(tParams);
		}
		else if (evName.Contains("ThumpBooth"))
		{
			handleThumpEvent(tParams);
		}
	}

	void handleZoneExitEvent()
	{
		if (_heartbeatInstance.isValid())
			_heartbeatInstance.stop(FMOD.Studio.STOP_MODE.ALLOWFADEOUT);
	}

	void handleThumpEvent(PrairieTriggerParams ptp)
	{
		Debug.Log("Booth Thump");
		SingleThumpTrigger.EmitTrigger(ptp);
	}

	void handleDoorEvent(PrairieTriggerParams tParams)
	{
		// make sure we are out of all zones if the door opens.
		handleZoneExitEvent();

		string evName = tParams.Name;
		if (evName.Contains("Initial"))
		{
			playInitialDoorSound();
			EnterDoorTrigger.EmitTrigger(new PrairieTriggerParams(evName,0,0));
		}
		else if (evName.Contains("Exit"))
		{
			playExitDoorSound();
			ExitDoorTrigger.EmitTrigger(new PrairieTriggerParams(evName,0,0));
		}
	}

	void playInitialDoorSound()
	{
		Debug.Log("Booth InitialDoor");
		if (_enterEventInstance.isValid())
		{
			_enterEventInstance.start();
		}
	}

	void playExitDoorSound()
	{
		Debug.Log("Booth ExitDoor");
		if (_exitEventInstance.isValid())
		{
			_exitEventInstance.start();
		}
	}

	void handleZoneEvent(PrairieTriggerParams tParams)
	{
		Debug.Log("Booth ZoneEvent");
		string evName = tParams.Name;
		int zoneId = parseIntParamFromMessage(evName);
		if (zoneId < 0 || zoneId >= HeartbeatFmodParams.Count)
		{
			Debug.Log("Bad zone ID:" + zoneId);
			return;
		}
		else
		{
			if (!_heartbeatInstance.isValid())
			{
				Debug.LogError("Invalid hearbeat FMOD instance");
				return;
			}
			float valueForZone = HeartbeatFmodParams[zoneId].SpeedVal;
			_heartbeatInstance.setParameterByName("HeartbeatSpeed",valueForZone);

			valueForZone = HeartbeatFmodParams[zoneId].DistVal;
			_heartbeatInstance.setParameterByName("HeartbeatDist",valueForZone);

			PLAYBACK_STATE pbState;
			_heartbeatInstance.getPlaybackState(out pbState);
			if (pbState != PLAYBACK_STATE.PLAYING)
				_heartbeatInstance.start();
		}
	}

	int parseIntParamFromMessage(string message,int defaultVal = -1)
	{
		int dashDex = message.LastIndexOf("-");
		if (dashDex < 0 || (dashDex == message.Length-1))
		{
			Debug.Log("Unable to parse zone for event:" + message);
			return defaultVal;
		}

		int paramVal = defaultVal;
		int.TryParse(message.Substring(dashDex+1), out paramVal);
		return paramVal;
	}
}
