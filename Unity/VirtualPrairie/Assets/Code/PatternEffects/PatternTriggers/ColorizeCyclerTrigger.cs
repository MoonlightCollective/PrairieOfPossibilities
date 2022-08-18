using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ColorizeCyclerTrigger : TriggerListener
{
	List<PrairiePatternMonochromaticBase> _patterns;
	List<ParticlePattern> _particlePatterns;
	public List<ColorizeBrightnessValue> ColorizeSettings;
	int _curSettingDex;

	public void Awake()
	{
		_patterns = new List<PrairiePatternMonochromaticBase>(GetComponentsInChildren<PrairiePatternMonochromaticBase>());
		_particlePatterns = new List<ParticlePattern>(GetComponentsInChildren<ParticlePattern>());
	}

	public void Start()
	{
		_curSettingDex = 0;
		applyColorizeSettingForDex(_curSettingDex);
	}

	void applyColorizeSettingForDex(int dex)
	{
		if (ColorizeSettings.Count < 1 || dex < 0 || dex >= ColorizeSettings.Count)
			return;

		foreach (var p in _patterns)
		{
			p.ColorizeSettings = ColorizeSettings[dex];
		}
		foreach (var pp in _particlePatterns)
		{
			pp.ColorizeSettings = ColorizeSettings[dex];
		}
	}
	
	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		applyColorizeSettingForDex(_curSettingDex);
		_curSettingDex = (_curSettingDex + 1) % ColorizeSettings.Count;
	}
}
