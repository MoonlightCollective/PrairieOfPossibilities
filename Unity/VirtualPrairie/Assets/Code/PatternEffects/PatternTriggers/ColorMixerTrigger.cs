using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ColorMixerTrigger : TriggerListener
{
	public ColorPaletteMixer TargetMixer;
	public ColorPaletteMixerEntry Entry;
	public float TransitionTime = 1.0f;
	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		if (TargetMixer != null && Entry != null)
		{
			TargetMixer.InitiateTransition(Entry,TransitionTime);
		}
	}
}
