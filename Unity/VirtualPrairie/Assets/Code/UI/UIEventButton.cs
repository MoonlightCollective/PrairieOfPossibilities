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
	Dictionary<string,object> _fieldDict;

	public void findRequiredObjectsCommon()
	{
		_button = GetComponentInChildren<Button>();
		_text = GetComponentInChildren<TextMeshProUGUI>();
	}

	public void InitFromMqttTriggerEntry(MessageToTriggerEntry triggerEntry,MqttTrigger triggerTarget,Color buttonColor)
	{
		_buttonType = EEventButtonType.MQTT;
		findRequiredObjectsCommon();
		_message = triggerEntry.Message;
		_mqttTarget = triggerTarget;
		if (string.IsNullOrEmpty(triggerEntry.DisplayName))
			_text.text = $"<b>{triggerEntry.Message}</b><br>" + $"({triggerTarget.gameObject.name})";
		else
			_text.text = $"<b>{triggerEntry.DisplayName}</b><br>" + $"({triggerTarget.gameObject.name})";
			
		_button.onClick.AddListener(()=>OnMqttPressed());
		_button.image.color = buttonColor;

		_fieldDict = new Dictionary<string, dynamic>();
		foreach (var filterEntry in triggerEntry.FieldFilters)
		{
			_fieldDict[filterEntry.FieldName] = filterEntry.FieldValue;
		}
	}
	
	public void initFromMusicTrigger(MusicMarkerTrigger markerTrigger,Color buttonColor)
	{
		_buttonType = EEventButtonType.MusicMarker;
		findRequiredObjectsCommon();
		_message = markerTrigger.Marker;
		_musicMarkerTarget = markerTrigger;
		_button.image.color = buttonColor;
		_text.text = $"<b>{_message}</b>\n(MusicT:{markerTrigger.gameObject.name})";
		_button.onClick.AddListener(()=>OnMusicPressed());
		_fieldDict = new Dictionary<string, dynamic>();
	}

	public void initFromMusicGate(MusicMarkerGate markerGate, bool OnEvent,Color buttonColor)
	{
		_buttonType = EEventButtonType.MusicMarkerGate;
		findRequiredObjectsCommon();
		_message = OnEvent?markerGate.OnMarker:markerGate.OffMarker;
		_button.image.color = buttonColor;
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