using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

[System.Serializable]
public class ArmChaseTriggerEntry
{
	public string Name;// not used, but handy in the editor for organization
	[Header("Trig")]
	public ChaseParticleMultiPattern TargetChasePattern;
	public List<int> ArmIds = new List<int>();
	public bool OverrideColorize = false;
	public bool FireTriggerAlso = false;
	
	[AllowNesting]
	[ShowIf("OverrideColorize")]
	public ColorizeBrightnessValue ColorizeSettings;

	protected List<TriggerListener> _trigListeners = null;
	PrairieTriggerParams pt = new PrairieTriggerParams("ArmChaseTrig",0,0);

	public void EmitTrigger()
	{
		if (TargetChasePattern == null)
		{
			Debug.LogWarning($"ArmChaseTriggerEntry {Name} has no target pattern set!");
			return;
		}

		if (FireTriggerAlso && _trigListeners == null)
		{
			_trigListeners = new List<TriggerListener>(TargetChasePattern.GetComponents<TriggerListener>());
		}

		if (OverrideColorize && ColorizeSettings != null)
		{
			TargetChasePattern.ColorizeSettings = ColorizeSettings;	
		}

		TargetChasePattern.EmitParticleList(ArmIds);
		if (FireTriggerAlso && _trigListeners != null)
		{
			foreach (var tl in _trigListeners)
			{
				tl.NotifyTriggered(pt);
			}
		}
	}
}

