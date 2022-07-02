using System.Collections;
using System.Collections.Generic;
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
	public List<HearbeatFmodVals> HeartbeatFmodParams = new List<HearbeatFmodVals>();

	public EventReference HeartbeatEvent;
	EventInstance _heartbeatInstance;
	public EventReference ExitEvent;
	EventInstance _exitEventInstance;

	public EventReference EnterEvent;
	EventInstance _enterEventInstance;

	public void Start()
	{
		createFmodInstances();
	}
	
	void createFmodInstances()
	{
		_heartbeatInstance = FMODUnity.RuntimeManager.CreateInstance(HeartbeatEvent);
		_enterEventInstance = FMODUnity.RuntimeManager.CreateInstance(EnterEvent);
		_exitEventInstance = FMODUnity.RuntimeManager.CreateInstance(ExitEvent);
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
	}

	void handleZoneExitEvent()
	{
		if (_heartbeatInstance.isValid())
			_heartbeatInstance.stop(FMOD.Studio.STOP_MODE.ALLOWFADEOUT);
	}

	void handleDoorEvent(PrairieTriggerParams tParams)
	{
		// make sure we are out of all zones if the door opens.
		handleZoneExitEvent();

		string evName = tParams.Name;
		if (evName.Contains("Initial"))
		{
			playInitialDoorSound();
		}
		else if (evName.Contains("Exit"))
		{
			playExitDoorSound();
		}
	}

	void playInitialDoorSound()
	{
		Debug.Log("InitialDoor");
		if (_enterEventInstance.isValid())
		{
			_enterEventInstance.start();
		}
	}

	void playExitDoorSound()
	{
		Debug.Log("ExitDoor");
		if (_exitEventInstance.isValid())
		{
			_exitEventInstance.start();
		}
	}

	void handleZoneEvent(PrairieTriggerParams tParams)
	{
		Debug.Log("ZoneEvent");
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
