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
	Dictionary<string,dynamic> _fieldDict;

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
		if (string.IsNullOrEmpty(triggerEntry.DisplayName))
			_text.text = $"<b>{triggerEntry.Message}</b>" + $" (MQTT:{triggerTarget.gameObject.name})";
		else
			_text.text = $"<b>{triggerEntry.DisplayName}</b>" + $" (MQTT:{triggerTarget.gameObject.name})";
			
		_button.onClick.AddListener(()=>OnMqttPressed());
		_fieldDict = new Dictionary<string, dynamic>();
		foreach (var filterEntry in triggerEntry.FieldFilters)
		{
			_fieldDict[filterEntry.FieldName] = filterEntry.FieldValue;
		}
	}
	
	public void initFromMusicTrigger(MusicMarkerTrigger markerTrigger)
	{
		_buttonType = EEventButtonType.MusicMarker;
		findRequiredObjectsCommon();
		_message = markerTrigger.Marker;
		_musicMarkerTarget = markerTrigger;
		_text.text = $"<b>{_message}</b>\n(MusicT:{markerTrigger.gameObject.name})";
		_button.onClick.AddListener(()=>OnMusicPressed());
		_fieldDict = new Dictionary<string, dynamic>();
	}

	public void initFromMusicGate(MusicMarkerGate markerGate, bool OnEvent)
	{
		_buttonType = EEventButtonType.MusicMarkerGate;
		findRequiredObjectsCommon();
		_message = OnEvent?markerGate.OnMarker:markerGate.OffMarker;
		_musicMarkerGateTarget = markerGate;
		_text.text = $"<b>{_message}</b>\n(MusicG:{markerGate.gameObject.name})";
		_button.onClick.AddListener(()=>OnMusicGatePressed());
		_fieldDict = new Dictionary<string, dynamic>();
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
		_mqttTarget.NotifyMessage(_message, _fieldDict);
	}
}