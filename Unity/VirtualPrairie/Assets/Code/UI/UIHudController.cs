using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class UIHudController : MonoBehaviour
{
	public TextMeshProUGUI PlantCountText;
	public UILabelSlider BrightnessSlider;
	public UILabelSlider GlowSlider;
	public UILabelSlider AlphaSlider;
	
	protected GameObject _plantLayoutRoot;

	void Awake()
	{
		_plantLayoutRoot = GameObject.Find("Layout")?.gameObject;
	}

	void Start()
	{
		GlobalPlantSettings settings = GlobalPlantSettings.Instance;
		settings.LoadFromPrefs();
		BrightnessSlider.Slider.value = settings.Brightness;
		AlphaSlider.Slider.value = settings.StemAlpha;
		GlowSlider.Slider.value = settings.GlowIntensity;

	}

    void Update()
    {
		PlantCountText.text = $"Plants:{_plantLayoutRoot.transform.childCount}";
		GlobalPlantSettings settings = GlobalPlantSettings.Instance;
		settings.Brightness = BrightnessSlider.Slider.value;
		settings.StemAlpha = AlphaSlider.Slider.value;
		settings.GlowIntensity = GlowSlider.Slider.value;
    }
}
