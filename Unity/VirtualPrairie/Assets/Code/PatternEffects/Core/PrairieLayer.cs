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

[System.Serializable]
public class TimeSettings
{
	[Range(0,5)]
	[Snapshot]
	public float TimeMult = 1.0f;
}

public class PrairieLayer : MonoBehaviour
{
	[Snapshot]
	public LayerBlendSettings BlendSettings;

	[Snapshot]
	public TimeSettings TimeSettings;
}
