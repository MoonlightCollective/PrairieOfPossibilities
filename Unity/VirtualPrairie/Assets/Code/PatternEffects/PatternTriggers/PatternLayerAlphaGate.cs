using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using Nothke.Utils;
using UnityEngine;

public class PatternLayerAlphaGate : GateListener
{
	public ADSREnvelope AlphaEnv = ADSREnvelope.Default();

	protected PrairiePatternLayer _patternLayer = null;
	protected bool _gateOn = false;

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

		_patternLayer.BlendSettings.LayerAlpha = AlphaEnv.Update(_gateOn,Time.deltaTime);
	}

	public override void NotifyTriggeredOn(PrairieTriggerParams tParams)
	{
		PrairieUtil.EventDebug($"{gameObject.name} NotifiedTriggeredOn");
		_gateOn = true;
	}

	public override void NotifyTriggeredOff(PrairieTriggerParams tParams)
	{
		PrairieUtil.EventDebug($"{gameObject.name} NotifiedTriggeredOff");
		_gateOn = false;
	}
}
