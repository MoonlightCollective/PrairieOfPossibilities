using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnableTrigger : TriggerListener
{
	public GameObject TargetObject;
	public EEnableBehavior TriggerBehavior = EEnableBehavior.Toggle;

	public enum EEnableBehavior
	{
		On,
		Off,
		Toggle,
	}

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		if (TargetObject == null)
			TargetObject = gameObject;
		
		switch (TriggerBehavior)
		{
			case EEnableBehavior.On:
				TargetObject.gameObject.SetActive(true);
				break;
			case EEnableBehavior.Off:
				TargetObject.gameObject.SetActive(false);
				break;
			case EEnableBehavior.Toggle:
				TargetObject.gameObject.SetActive(!TargetObject.activeInHierarchy);
				break;
		}
	}
}
