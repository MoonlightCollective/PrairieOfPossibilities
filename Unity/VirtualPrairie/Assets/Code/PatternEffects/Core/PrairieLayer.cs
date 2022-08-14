using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;



[System.Serializable]
public class LayerBlendSettings
{
	[Snapshot]
	public ColorBlend.EBlendMode BlendMode = ColorBlend.EBlendMode.AlphaBlend;

	[Range(0,1)]
	[Snapshot]
	public float LayerAlpha = 1.0f;
}

public interface IAlphaEnvTarget
{
	public void SetLayerAlpha(float newAlpha);
	public float GetTimeMult();
}

[System.Serializable]
public class TimeSettings
{
	[Range(0,5)]
	[Snapshot]
	public float TimeMult = 1.0f;
}

public class PrairieLayer : MonoBehaviour, IAlphaEnvTarget
{
	[Snapshot]
	public LayerBlendSettings BlendSettings;

	[Snapshot]
	public TimeSettings TimeSettings;

	public float GetTimeMult()
	{
		return TimeSettings.TimeMult;
	}

	public void SetLayerAlpha(float newAlpha)
	{
		BlendSettings.LayerAlpha = newAlpha;
	}
}
