using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class UILabelSlider : MonoBehaviour
{
	protected Slider _slider;
	public Slider Slider => _slider;
	public int NumValueDigits = 1;
	public bool WriteSettingsOnChange = true;

	protected TextMeshProUGUI _labelText;
	protected TextMeshProUGUI _valueText;

    void Awake()
    {
		_slider = GetComponentInChildren<Slider>();
		_labelText = transform.Find("LabelText").GetComponent<TextMeshProUGUI>();
		_valueText = transform.Find("ValueText").GetComponent<TextMeshProUGUI>();
    }

	public void OnUpdateValue(float newVal)
	{
		if (_valueText != null)
			_valueText.text = newVal.ToString($"F{NumValueDigits}");
		
		if (WriteSettingsOnChange)
			GlobalPlantSettings.Instance.SavePrefs();
	}

}
