using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using Nothke.Utils;
using UnityEngine;

public class PatternLayerAlphaGate : GateListener
{
	[Snapshot] public ADSREnvelope AlphaEnv = ADSREnvelope.Default();
	
	[Snapshot] public float Mult = 1.0f;
	protected IAlphaEnvTarget _target;
	protected bool _gateOn = false;

	public void Start()
	{
		getPatternLayer();
	}

	void getPatternLayer()
	{
		_target = GetComponent<IAlphaEnvTarget>();
	}

	public void Update()
	{
		if (_target == null)
			getPatternLayer();

		if (_target == null)
			return;

		_target.SetLayerAlpha(AlphaEnv.Update(_gateOn,Time.deltaTime * _target.GetTimeMult()) * Mult);
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
