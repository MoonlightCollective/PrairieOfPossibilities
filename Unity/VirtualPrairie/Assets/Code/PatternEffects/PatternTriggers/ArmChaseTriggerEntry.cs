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

	[AllowNesting]
	[ShowIf("OverrideColorize")]
	public ColorizeBrightnessValue ColorizeSettings;

	public void EmitTrigger()
	{
		if (TargetChasePattern == null)
		{
			Debug.LogWarning($"ArmChaseTriggerEntry {Name} has no target pattern set!");
			return;
		}

		if (OverrideColorize && ColorizeSettings != null)
		{
			TargetChasePattern.ColorizeSettings = ColorizeSettings;	
		}

		TargetChasePattern.EmitParticleList(ArmIds);
	}
}

