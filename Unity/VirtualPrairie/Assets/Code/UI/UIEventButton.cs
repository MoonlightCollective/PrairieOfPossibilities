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
		MusicMarker,
		MusicMarkerGate,
	}
	
	EEventButtonType _buttonType;
	Button _button;
	TextMeshProUGUI _text;

	string _message;
	MqttTrigger _mqttTarget;
	MusicMarkerTrigger _musicMarkerTarget;
	MusicMarkerGate _musicMarkerGateTarget;

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
	
	public void initFromMusicTrigger(MusicMarkerTrigger markerTrigger)
	{
		_buttonType = EEventButtonType.MusicMarker;
		findRequiredObjectsCommon();
		_message = markerTrigger.Marker;
		_musicMarkerTarget = markerTrigger;
		_text.text = $"<b>{_message}</b>\n({markerTrigger.gameObject.name})";
		_button.onClick.AddListener(()=>OnMusicPressed());
	}

	public void initFromMusicGate(MusicMarkerGate markerGate, bool OnEvent)
	{
		_buttonType = EEventButtonType.MusicMarkerGate;
		findRequiredObjectsCommon();
		_message = OnEvent?markerGate.OnMarker:markerGate.OffMarker;
		_musicMarkerGateTarget = markerGate;
		_text.text = $"<b>{_message}</b>\n({markerGate.gameObject.name})";
		_button.onClick.AddListener(()=>OnMusicGatePressed());
	}

	void OnMusicGatePressed()
	{
		_musicMarkerGateTarget.NotifyMarker(_message);
	}

	void OnMusicPressed()
	{
		_musicMarkerTarget.NotifyMarker(_message);
	}

	void OnMqttPressed()
	{
		_mqttTarget.NotifyMessage(_message);
	}
}