using System.Collections;
using System.Collections.Generic;
using FMOD.Studio;
using FMODUnity;
using UnityEngine;

public class PhoneBoothSensor : MonoBehaviour
{
	bool CameraInRange = false;
	public EventReference HeartbeatAudioEvent;
	protected EventInstance _heartbeatEventInstance;

	public float MaxHeartbeatDist = 20.0f;
	public float MinHeartbeatDist = 5.0f;
	
	GameObject _playerObj = null;
	
	public void OnTriggerEnter(Collider c)
	{
		Debug.Log("TriggerEnter!");
		if (c.gameObject.tag == "Player")
		{
			CameraInRange = true;
			startAudio();
			_playerObj = c.gameObject;
		}
	}

	public void OnTriggerExit(Collider c)
	{
		if (c.gameObject.tag == "Player")
		{
			CameraInRange = false;
			if (alreadyPlaying())
			{
				stopAudio();
			}
		}
		_playerObj = null;
	}

	void startAudio()
	{
		if (alreadyPlaying())
		{
			Debug.Log("Already playing");
			return;
		}

		if (_heartbeatEventInstance.hasHandle())
		{
			_heartbeatEventInstance.setUserData(System.IntPtr.Zero);
			_heartbeatEventInstance.release();
		}

		_heartbeatEventInstance = FMODUnity.RuntimeManager.CreateInstance(HeartbeatAudioEvent);
		if (!_heartbeatEventInstance.hasHandle())
		{
			Debug.LogError("Unable to start heartbeat!");
			return;
		}
		Debug.Log("Starting heartbeat");
		_heartbeatEventInstance.set3DAttributes(RuntimeUtils.To3DAttributes(gameObject));
		_heartbeatEventInstance.start();
	}

	protected bool alreadyPlaying()
	{
		if (_heartbeatEventInstance.isValid())
		{
			PLAYBACK_STATE playbackState;
			_heartbeatEventInstance.getPlaybackState(out playbackState);
			if (playbackState == PLAYBACK_STATE.PLAYING)
				return true;
		}

		return false;
	}

	protected void stopAudio()
	{
		if (alreadyPlaying())
		{
			_heartbeatEventInstance.stop(FMOD.Studio.STOP_MODE.ALLOWFADEOUT);
		}
	}

    // Update is called once per frame
    void Update()
    {
        if (!CameraInRange || _playerObj == null)
		{
			return;
		}

		float dist = Mathf.Abs(Vector3.Distance(transform.position,_playerObj.transform.position) - MinHeartbeatDist);
		float normDist = Mathf.Clamp01(Mathf.Lerp(1,0,dist/(MaxHeartbeatDist-MinHeartbeatDist)));
		_heartbeatEventInstance.setParameterByName("HeartbeatSpeedA",normDist);
		_heartbeatEventInstance.setParameterByName("HeartbeatDistA",normDist);
		Debug.Log($"{normDist},{dist}");

    }
}	