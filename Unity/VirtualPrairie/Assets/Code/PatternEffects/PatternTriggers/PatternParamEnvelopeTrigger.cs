using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using Nothke.Utils;
using UnityEngine;


[System.Serializable]
public class ParamEnvelope
{
	public int TargetParamIndex;
	public ParamEnvelope()
	{
		Envelope = new ADSREnvelope();
		Envelope.attack = 1.0f;
		Envelope.decay = 0f;
		Envelope.sustain = 1f;
		Envelope.decay = 1f;
	}
	public float Multiplier = 1.0f;

	[Space]
	public ADSREnvelope Envelope = ADSREnvelope.Default();
}

public class PatternParamEnvelopeTrigger : TriggerListener
{
	public bool TargetSelf = true;
	[HideIf("TargetSelf")]
	public PrairiePatternLayer TargetPattern;

	public List<ParamEnvelope> Envelopes = new List<ParamEnvelope>();

	bool _triggered = false;

	public void Start()
	{
		if (TargetSelf)
		{
			TargetPattern = gameObject.GetComponent<PrairiePatternLayer>();
		}
	}

	public void Update()
	{
		if (Envelopes.Count < 1)
			return;

		if (TargetPattern != null)
		{
			foreach (var pEnv in Envelopes)
			{
				float newVal = pEnv.Envelope.Update(_triggered,Time.deltaTime);
				TargetPattern.SetIndexedFloat(pEnv.TargetParamIndex,newVal*pEnv.Multiplier);
			}
		}
		else
		{
			if (_triggered)
				Debug.Log($"{gameObject.name}: TriggerEnv failed - TargetPattern == null");
		}

		_triggered = false;
	}

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		PrairieUtil.EventDebug($"{gameObject.name} Notify trigger received.");
		_triggered = true;
	}
}
