using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.PostProcessing;
using UnityEngine.Rendering.Universal;

public class UIDisplayModeController : MonoBehaviour
{
	ColorAdjustments _colorAdjustments = null;
	public bool CycleCamera = true;
	public float CycleCameraTime = 1.0f;

	PrairieWalkCam _walkCam;
	float _camCycleTimer;
	int _curCamDex = -1;
	UIDisplayFeedButtonMaster _feedButtons;

	public void Activate()
	{
		enableColorEffect(true);
		_walkCam = GameObject.FindObjectOfType<PrairieWalkCam>();
		gameObject.SetActive(true);
		_camCycleTimer = -1f;
		_feedButtons = transform.GetComponentInChildren<UIDisplayFeedButtonMaster>();
	}

	public void Deactivate()
	{
		enableColorEffect(false);
		gameObject.SetActive(false);
	}

	public void Update()
	{
		if (CycleCamera)
		{
			updateCamCycle();
		}
	}

	void updateCamCycle()
	{
		if (_camCycleTimer >= 0)
		{
			_camCycleTimer -= Time.deltaTime;
		}

		if (_camCycleTimer < 0)
		{
			_curCamDex = (_curCamDex+1)%_walkCam.CameraStops.Count;
			_feedButtons.SwitchToFeed(_curCamDex);
			_walkCam.TeleportToStop(_curCamDex);
			_camCycleTimer = CycleCameraTime;
		}
	}




	void enableColorEffect(bool doEnable)
	{
		if (_colorAdjustments == null)
		{
			var volumes = GameObject.FindObjectsOfType<Volume>();
			foreach (var v in volumes)
			{
				v.profile.TryGet(out _colorAdjustments);
				if (_colorAdjustments != null)
					break;
			}
		}

		if (_colorAdjustments != null)
		{
			_colorAdjustments.active = doEnable;
		}
	}

}
