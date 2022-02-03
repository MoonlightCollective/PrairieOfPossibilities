using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GlobalPlantSettings : MonoBehaviour
{
	[Header("Plant Color and Brightness")]
	public float Brightness;
	public float StemAlpha;
	public float GlowIntensity;
	public float GroundGlowAlpha = 0.5f;
	
	[Header("DebugCycling")]
	public bool DebugRainbow = false;
	public float DebugRainbowCycleTime = 5.0f;

	// Singleton
	public static GlobalPlantSettings Instance => s_instance;
	private static GlobalPlantSettings s_instance;

	public void Awake()
	{
		s_instance = this;
		LoadFromPrefs();
	}

	public void LoadFromPrefs()
	{
		Brightness = PlayerPrefs.GetFloat("Brightness",.5f);
		GlowIntensity = PlayerPrefs.GetFloat("GlowIntensity",1.9f);
		StemAlpha = PlayerPrefs.GetFloat("StemAlpha",.25f);
	}

	public void SavePrefs()
	{
		PlayerPrefs.SetFloat("Brightness", Brightness);
		PlayerPrefs.SetFloat("GlowIntensity", GlowIntensity);
		PlayerPrefs.SetFloat("StemAlpha", StemAlpha);
	}
	
}
