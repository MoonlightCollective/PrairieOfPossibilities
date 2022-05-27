using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using Nothke.Utils;
using UnityEngine;

[System.Serializable]
public class PatternParamTriggerSettings
{
	[Snapshot]
	public bool TargetSelf = true;

	[HideIf("TargetSelf")]
	[AllowNesting]
	[Snapshot]
	public PrairiePatternLayer TargetPattern;

	[Snapshot]
	public int TargetParamIndex = 0;
	
	[Snapshot]
	public float Multiplier = 1f;
}

public class PatternParamEnvelopeTrigger : TriggerListener
{
	public PatternParamTriggerSettings ParamTriggerSettings;

	[Snapshot]
	public ADSREnvelope Envelope = ADSREnvelope.Default();

	bool _triggered = false;

	public void Start()
	{
		if (ParamTriggerSettings.TargetSelf)
		{
			ParamTriggerSettings.TargetPattern = gameObject.GetComponent<PrairiePatternLayer>();
		}
	}

	public void Update()
	{
		if (ParamTriggerSettings.TargetPattern != null)
		{
			float newVal = Envelope.Update(_triggered,Time.deltaTime * ParamTriggerSettings.TargetPattern.TimeSettings.TimeMult);
			ParamTriggerSettings.TargetPattern.SetIndexedFloat(ParamTriggerSettings.TargetParamIndex,newVal*ParamTriggerSettings.Multiplier);
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
