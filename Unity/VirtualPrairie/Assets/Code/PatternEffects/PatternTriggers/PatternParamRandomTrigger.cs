using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

public class PatternParamRandomTrigger : TriggerListener
{
	public PatternParamTriggerSettings ParamTriggerSettings;

	[Snapshot]
	public ENumberParamType ParamType;

	[Range(-1,1)]
	[Snapshot]
	[ShowIf("ParamType",ENumberParamType.Float)]
	public float RangeMin = 0;
	
	[Range(-1,1)]
	[Snapshot]
	[ShowIf("ParamType",ENumberParamType.Float)]
	public float RangeMax = 10;

	[ShowIf("ParamType",ENumberParamType.Integer)]
	[Snapshot]
	[Range(0,100)]
	public int RangeMinInt;

	[Range(0,100)]
	[Snapshot]
	[ShowIf("ParamType",ENumberParamType.Integer)]
	public int RangeMaxInt;

	public void Start()
	{
		if (ParamTriggerSettings.TargetSelf)
		{
			ParamTriggerSettings.TargetPattern = gameObject.GetComponent<PrairiePatternLayer>();
		}
	}

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		if (ParamType == ENumberParamType.Float)
		{
			float newVal = Random.Range(RangeMin,RangeMax);
			ParamTriggerSettings.TargetPattern.SetIndexedFloat(ParamTriggerSettings.TargetParamIndex,newVal);
		}
		else
		{
			float newVal = (float) Random.Range(RangeMinInt,RangeMaxInt);
			ParamTriggerSettings.TargetPattern.SetIndexedFloat(ParamTriggerSettings.TargetParamIndex,newVal);
		}
	}
}
