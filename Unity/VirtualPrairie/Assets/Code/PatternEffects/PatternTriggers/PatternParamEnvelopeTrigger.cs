using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using Nothke.Utils;
using UnityEngine;

public class PatternParamEnvelopeTrigger : TriggerListener
{
	[Snapshot]
	public bool TargetSelf = true;

	[HideIf("TargetSelf")]
	[Snapshot]
	public PrairiePatternLayer TargetPattern;

	[Snapshot]
	public int TargetParamIndex = 0;
	
	[Snapshot]
	public float Multiplier = 1f;

	[Snapshot]
	public ADSREnvelope Envelope = ADSREnvelope.Default();

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
		if (TargetPattern != null)
		{
			float newVal = Envelope.Update(_triggered,Time.deltaTime * TargetPattern.TimeSettings.TimeMult);
			TargetPattern.SetIndexedFloat(TargetParamIndex,newVal*Multiplier);
		}
		else
		{
			Debug.LogWarning($"{gameObject.name} - paramEnvelopeTrigger with Null target pattern");
		}
		_triggered = false;
	}

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		PrairieUtil.EventDebug($"{gameObject.name} Notify trigger received.");
		_triggered = true;
	}
}
