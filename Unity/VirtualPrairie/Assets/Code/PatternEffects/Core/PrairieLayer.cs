using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

[System.Serializable]
public class LayerBlendSettings
{
	public ColorBlend.EBlendMode BlendMode = ColorBlend.EBlendMode.AlphaBlend;
	[Range(0,1)]
	public float LayerAlpha = 1.0f;
}

[System.Serializable]
public class TimeSettings
{
	[Range(0,5)]
	public float TimeMult = 1.0f;
}

public class PrairieLayer : MonoBehaviour
{
	public LayerBlendSettings BlendSettings;
	public TimeSettings TimeSettings;
}

