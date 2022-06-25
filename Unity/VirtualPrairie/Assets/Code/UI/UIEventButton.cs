using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public  class UIEventButton : MonoBehaviour
{
	public enum EEventButtonType
	{
		MQTT,
		Music,
	}
	
	EEventButtonType _buttonType;
	Button _button;
	TextMeshProUGUI _text;

	string _message;
	MqttTrigger _mqttTarget;


	public void findRequiredObjectsCommon()
	{
		_button = GetComponentInChildren<Button>();
		_text = GetComponentInChildren<TextMeshProUGUI>();
	}

	public void InitFromMqttTriggerEntry(MessageToTriggerEntry triggerEntry,MqttTrigger triggerTarget)
	{
		_buttonType = EEventButtonType.MQTT;
		findRequiredObjectsCommon();
		_message = triggerEntry.Message;
		_mqttTarget = triggerTarget;
		_text.text = $"<b>{triggerEntry.Message}</b>" + $" ({triggerTarget.gameObject.name})";
		_button.onClick.AddListener(()=>OnMqttPressed());
	}
	
	void OnMqttPressed()
	{
		_mqttTarget.NotifyMessage(_message);
	}
}