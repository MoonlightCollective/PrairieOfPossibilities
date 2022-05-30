using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;


public enum EParticleParamType
{
	Integer,
	Float,
	FloatRange,
}

[System.Serializable]
public class FloatRange
{
	public float MinVal = 0f;
	public float MaxVal = 1f;
	public float RandomVal => Random.Range(MinVal,MaxVal);
	
	public FloatRange(float minVal, float maxVal)
	{
		MinVal = minVal;
		MaxVal = maxVal;
	}
};

[System.Serializable]
public class PrairieParticleSettingEntry
{
	public string Name;
	
	public EParticleParamType ParamType;
	
	[ShowIf("ParamType",EParticleParamType.Float)]
	[AllowNesting]
	public float FloatValue;

	[ShowIf("ParamType",EParticleParamType.Integer)]
	[AllowNesting]
	public int IntValue;

	[ShowIf("ParamType",EParticleParamType.FloatRange)]
	[AllowNesting]
	public FloatRange FloatRangeValue;
}

[System.Serializable]
public class PrairieParticleSettings
{
	public List<PrairieParticleSettingEntry> Settings = new List<PrairieParticleSettingEntry>();
	protected Dictionary<string,PrairieParticleSettingEntry> _paramDict = new Dictionary<string, PrairieParticleSettingEntry>();
	bool needRebuild = true;
	public void SetDirty() { needRebuild = true; }

	void rebuildDictionary()
	{
		_paramDict.Clear();
		foreach (var s in Settings)
		{
			_paramDict[s.Name] = s;
		}
	}

	public float GetFloatSetting(string name, float defaultVal)
	{
		if (needRebuild)
			rebuildDictionary();

		if (_paramDict.ContainsKey(name) && _paramDict[name].ParamType == EParticleParamType.Float)
			return _paramDict[name].FloatValue;

		return defaultVal;
	}

	public float GetIntSetting(string name, int defaultValue)
	{
		if (needRebuild)
			rebuildDictionary();
		
		if (_paramDict.ContainsKey(name) && _paramDict[name].ParamType == EParticleParamType.Integer)
			return _paramDict[name].IntValue;
		

		return defaultValue;
	}

	public FloatRange GetFloatRangeSetting(string name, FloatRange defaultValue)
	{
		if (needRebuild)
			rebuildDictionary();

		if (_paramDict.ContainsKey(name) && _paramDict[name].ParamType == EParticleParamType.FloatRange)
			return _paramDict[name].FloatRangeValue;

		return defaultValue;
	}

	public bool HaveSetting(string name)
	{
		if (needRebuild)
			rebuildDictionary();
		
		return _paramDict.ContainsKey(name);
	}

	public bool HaveSetting(string name, EParticleParamType pType)
	{
		if (needRebuild)
			rebuildDictionary();
		
		return (_paramDict.ContainsKey(name) && _paramDict[name].ParamType == pType);
	}	
}
