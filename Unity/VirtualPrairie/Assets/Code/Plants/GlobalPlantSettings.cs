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

	// go search the scene graph to find the global instance
    public static void FindGlobalInstance()
	{
		if (s_instance == null)
		{
			Debug.Log($"Finding the GlobalPlantSettings");	
			GlobalPlantSettings[] plantSettings = GameObject.FindObjectsOfType<GlobalPlantSettings>();
			if (plantSettings == null || plantSettings.Length != 1)
			{
				Debug.Log($"GlobalPlantSettings not found !   we have {plantSettings.Length} of them");	
			}
			else 
			{
				// use the first one
				s_instance = plantSettings[0];
			}
		}
	}

	public void Awake()
	{
		Debug.Log($"GlobalPlantSettings:Awake");
		GlobalPlantSettings.FindGlobalInstance();
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
