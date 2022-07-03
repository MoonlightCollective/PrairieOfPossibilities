using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using Nothke.Utils;
using UnityEngine;

public class PatternLayerAlphaTrigger : TriggerListener
{
	[Snapshot]
	public ADSREnvelope AlphaEnv = ADSREnvelope.Default();

	[Snapshot]
	public float Multiplier = 1.0f;
	
	protected List<IAlphaEnvTarget> _patternLayers = new List<IAlphaEnvTarget>();
	protected bool _trigger = false;

	public void Start()
	{
		getPatternLayers();
	}

	void getPatternLayers()
	{
		_patternLayers = new List<IAlphaEnvTarget>(GetComponents<IAlphaEnvTarget>());
	}

	public void Update()
	{
		if (_patternLayers.Count < 1)
			getPatternLayers();

		if (_patternLayers.Count < 1)
		{
			enabled = false;
			return;
		}

		bool signalOn = _trigger;
		foreach (var pl in _patternLayers)
		{
			pl.SetLayerAlpha(Multiplier * AlphaEnv.Update(signalOn,Time.deltaTime * pl.GetTimeMult()));
		}
		_trigger = false;
	}

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		PrairieUtil.EventDebug($"{gameObject.name} Notified trigger received");
		_trigger = true;
	}
}
