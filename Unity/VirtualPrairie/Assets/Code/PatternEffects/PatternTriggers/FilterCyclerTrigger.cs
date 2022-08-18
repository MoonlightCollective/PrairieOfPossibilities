using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FilterCyclerTrigger : TriggerListener
{
	List<PrairiePatternLayer> _patterns;
	public List<PatternPointFilterBase> FilterSettings = new List<PatternPointFilterBase>();
	int _curSettingDex;

	public void Awake()
	{
		_patterns = new List<PrairiePatternLayer>(GetComponentsInChildren<PrairiePatternLayer>());
	}

	public void Start()
	{
		_curSettingDex = 0;
		applyColorizeSettingForDex(_curSettingDex);
	}

	void applyColorizeSettingForDex(int dex)
	{
		if (FilterSettings.Count < 1 || dex < 0 || dex >= FilterSettings.Count)
			return;

		foreach (var p in _patterns)
		{
			p.PointFilter = FilterSettings[dex];
		}
	}
	
	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		applyColorizeSettingForDex(_curSettingDex);
		_curSettingDex = (_curSettingDex + 1) % FilterSettings.Count;
	}

}
