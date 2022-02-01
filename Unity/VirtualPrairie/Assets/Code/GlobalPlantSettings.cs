using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GlobalPlantSettings : MonoBehaviour
{
	[Header("Plant Color and Brightness")]
	public float Brightness;
	public float StemAlpha;
	public float GlowIntensity;

	[Header("DebugCycling")]
	public bool DebugRainbow = false;
	public float DebugRainbowCycleTime = 5.0f;

	// Singleton
	public static GlobalPlantSettings Instance => s_instance;
	private static GlobalPlantSettings s_instance;

	public void Awake()
	{
		s_instance = this;
	}
}
