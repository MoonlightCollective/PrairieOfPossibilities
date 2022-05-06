using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using Nothke.Utils;
using UnityEngine;

public class PatternLayerAlphaTrigger : MonoBehaviour
{
	public bool EnableKeyboardDebug;
	
	[EnableIf("EnableKeyboardDebug")]
	public KeyCode DebugKey;

	public ADSREnvelope AlphaEnv = ADSREnvelope.Default();

	protected PrairiePatternLayer _patternLayer = null;

	public void Start()
	{
		getPatternLayer();
	}

	void getPatternLayer()
	{
		_patternLayer = GetComponent<PrairiePatternLayer>();
	}

	public void Update()
	{
		if (_patternLayer == null)
			getPatternLayer();

		if (_patternLayer == null)
			return;

		bool signalOn = false;
		if (EnableKeyboardDebug)
		{
			signalOn = Input.GetKey(DebugKey);
		}
		_patternLayer.BlendSettings.LayerAlpha = AlphaEnv.Update(signalOn,Time.deltaTime);
	}
}
