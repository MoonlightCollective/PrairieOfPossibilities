using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class UIHudController : MonoBehaviour
{
	public TextMeshProUGUI PlantCountText;
	public TextMeshProUGUI FieldDiameterText;
	public TextMeshProUGUI ReadmeText;
	public UILabelSlider BrightnessSlider;
	public UILabelSlider GlowSlider;
	public UILabelSlider AlphaSlider;
	public UILabelSlider FrameSkipSlider;
	public TextMeshProUGUI FlyText;
	public Toggle ArtnetToggle;
	public Toggle MqttToggle;
	protected GameObject _plantLayoutRoot;
	protected PrairieWalkCam _cam;
	protected FixtureLayoutGen _fixtureLayoutGen;

	protected PrairieDmxController _dmxController;
	protected MqttController _mqttController;

	void Awake()
	{
		_plantLayoutRoot = PrairieUtil.GetLayoutRoot();
		_cam = PrairieUtil.GetCamera();
		_fixtureLayoutGen = PrairieUtil.GetLayoutGen();
		_dmxController = GameObject.FindObjectOfType<PrairieDmxController>();
		_mqttController = GameObject.FindObjectOfType<MqttController>();
	}

	void Start()
	{
		GlobalPlantSettings settings = GlobalPlantSettings.Instance;
		settings.LoadFromPrefs();
		BrightnessSlider.Slider.value = settings.Brightness;
		AlphaSlider.Slider.value = settings.StemAlpha;
		GlowSlider.Slider.value = settings.GlowIntensity;
		FrameSkipSlider.Slider.value = settings.VisualsFrameSkip;

		ArtnetToggle.SetIsOnWithoutNotify(settings.AutoConnectArtNet);
		_dmxController.DmxMode = settings.AutoConnectArtNet?PrairieDmxController.DmxSendListenMode.Send:PrairieDmxController.DmxSendListenMode.Off;

		MqttToggle.SetIsOnWithoutNotify(settings.AutoConnectMqtt);
		_mqttController.autoConnect = settings.AutoConnectMqtt;

		ArtnetToggle.onValueChanged.AddListener((val)=>OnUpdateArtnetVal(val));
		MqttToggle.onValueChanged.AddListener((val)=>OnUpdateMqttVal(val));

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
		FieldDiameterText.text = $"Radius:{PrairieUtil.MetersToFeet(_fixtureLayoutGen.MaxDistFromOrigin).ToString("F1")}ft";
	}

	public void OnUpdateArtnetVal(bool newVal)
	{
		GlobalPlantSettings.Instance.AutoConnectArtNet = newVal;
		_dmxController.DmxMode = newVal?PrairieDmxController.DmxSendListenMode.Send:PrairieDmxController.DmxSendListenMode.Off;
		_dmxController.ReInit();
		GlobalPlantSettings.Instance.SavePrefs();
	}

	public void OnUpdateMqttVal(bool newVal)
	{
		GlobalPlantSettings.Instance.AutoConnectMqtt = newVal;
		if (!_mqttController.IsClientConnected && newVal)
		{
			_mqttController.Connect();
		}
		GlobalPlantSettings.Instance.SavePrefs();
	}

	public void OnValueUpdate(float value)
	{
		GlobalPlantSettings settings = GlobalPlantSettings.Instance;
		settings.Brightness = BrightnessSlider.Slider.value;
		settings.StemAlpha = AlphaSlider.Slider.value;
		settings.GlowIntensity = GlowSlider.Slider.value;
		settings.VisualsFrameSkip = (int)FrameSkipSlider.Slider.value;
		GlobalPlantSettings.Instance.SavePrefs();
	}
}
