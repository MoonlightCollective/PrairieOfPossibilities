using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using Nothke.Utils;
using UnityEngine;

public class PatternLayerAlphaTrigger : TriggerListener
{
	[Snapshot]
	public ADSREnvelope AlphaEnv = ADSREnvelope.Default();

	protected PrairiePatternLayer _patternLayer = null;
	protected bool _trigger = false;

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

		bool signalOn = _trigger;
		_patternLayer.BlendSettings.LayerAlpha = AlphaEnv.Update(signalOn,Time.deltaTime * _patternLayer.TimeSettings.TimeMult);
		_trigger = false;
	}

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		PrairieUtil.EventDebug($"{gameObject.name} Notified trigger received");
		_trigger = true;
	}
}
