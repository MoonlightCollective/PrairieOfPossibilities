using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;

public class UIMqttStatus : MonoBehaviour, IPointerDownHandler
{
	public TextMeshProUGUI Text;

	MqttController _mqtt;
	public void Start()
	{
		_mqtt = GameObject.FindObjectOfType<MqttController>();
	}
	public void NotifyDebug(string debug)
	{
		Text.text = $"{debug}";
	}

	public void NotifyWarning(string warn)
	{
		Text.text = $"<color=yellow>{warn}</color>";
	}

	public void NotifyError(string error)
	{
		Text.text = $"<red=yellow>{error}</red>";
	}

	public void NotifyClicked()
	{
		Debug.Log("CLICKED");
		if (_mqtt == null)
		{
			Text.text = "No MQTT in scene";
		}
		else
		{
			if (_mqtt.IsClientConnected)
			{
				Debug.Log("Already connected - ignore click");
			}
			else
			{
				NotifyDebug("Attempt manual connect");
				_mqtt.Connect();
			}
		}
	}

	public void OnPointerDown(PointerEventData eventData)
	{
		NotifyClicked();
	}
}
