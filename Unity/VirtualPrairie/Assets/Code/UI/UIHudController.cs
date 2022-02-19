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
	public TextMeshProUGUI FlyText;
	
	protected GameObject _plantLayoutRoot;
	protected PrairieWalkCam _cam;

	void Awake()
	{
		_plantLayoutRoot = PrairieUtil.GetLayoutRoot();
		_cam = PrairieUtil.GetCamera();
	}

	void Start()
	{
		GlobalPlantSettings settings = GlobalPlantSettings.Instance;
		settings.LoadFromPrefs();
		BrightnessSlider.Slider.value = settings.Brightness;
		AlphaSlider.Slider.value = settings.StemAlpha;
		GlowSlider.Slider.value = settings.GlowIntensity;
		
		Slider[] sliders = GetComponentsInChildren<Slider>();
		foreach (var s in sliders)
		{
			s.onValueChanged.AddListener(OnValueUpdate);
		}
	}

    void Update()
    {
		PlantCountText.text = $"Fixtures:{_plantLayoutRoot.transform.childCount}";
		FlyText.text = $"Flying:{_cam.isFlying}";
    }

	public void OnValueUpdate(float value)
	{
		GlobalPlantSettings settings = GlobalPlantSettings.Instance;
		settings.Brightness = BrightnessSlider.Slider.value;
		settings.StemAlpha = AlphaSlider.Slider.value;
		settings.GlowIntensity = GlowSlider.Slider.value;
		GlobalPlantSettings.Instance.SavePrefs();
	}
}
