using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.PostProcessing;
using UnityEngine.Rendering.Universal;

public class UIDisplayModeController : MonoBehaviour
{
	ColorAdjustments _colorAdjustments = null;
	
	public void Activate()
	{
		enableColorEffect(true);
		gameObject.SetActive(true);
	}

	public void Deactivate()
	{
		enableColorEffect(false);
		gameObject.SetActive(false);
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
