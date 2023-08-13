using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using M2MqttUnity;
using uPLibrary.Networking.M2Mqtt.Messages;
using UnityEngine.Events;
using NaughtyAttributes;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;

/// <summary>
/// Examples for the M2MQTT library (https://github.com/eclipse/paho.mqtt.m2mqtt),
/// </summary>


public class MqttController : M2MqttUnityClient
{
	List<MqttEventHandler> _eventHandlers;
	List<MqttEventHandler> _eventHandlersToDestroy;
	List<string> _topics = new List<string>();
	protected UIMqttStatus _statusUI;
	protected string _praireControlTopic = "praire_control";
	FmodMusicPlayer _fmp;
	PrairieMusicManager _pmm;
    SceneLoader _sceneLoader;
	LayoutAutoLoader _layoutAutoLoader;


	protected override void Awake()
	{
		LoadEventHandlers();

		_statusUI = GameObject.FindObjectOfType<UIMqttStatus>();
		base.Awake();
	}

	protected void LoadEventHandlers()
	{
		if (_eventHandlersToDestroy != null)
		{
			foreach (var meh in _eventHandlersToDestroy)
			{
				Destroy(meh);
			}
		}

		_eventHandlers = new List<MqttEventHandler>(GameObject.FindObjectsOfType<MqttEventHandler>());
		_eventHandlersToDestroy = new List<MqttEventHandler>();

		// add our praire control event handler
		var praireControlEventHandler = gameObject.AddComponent<MqttEventHandler>();
		praireControlEventHandler.TopicEvents = new List<TopicToEventEntry>();
		var entry = new TopicToEventEntry();
		entry.Topic = _praireControlTopic;
		entry.OnMessage = new UnityEvent<string,Dictionary<string,object>>();
		entry.OnMessage.AddListener(OnPraireControl);
		praireControlEventHandler.TopicEvents.Add(entry);
		_eventHandlers.Add(praireControlEventHandler);
		_eventHandlersToDestroy.Add(praireControlEventHandler);
	}

	protected override void Start()
	{
        _fmp = PrairieGlobals.Instance.MusicPlayer;
		_pmm = PrairieGlobals.Instance.MusicManager;
		_sceneLoader = PrairieGlobals.Instance.SceneLoader;
		_layoutAutoLoader = GameObject.FindObjectOfType<LayoutAutoLoader>();

		autoConnect = GlobalPlantSettings.Instance.AutoConnectMqtt;
		base.Start();
		if (!autoConnect)
		{
			DebugLogWarning("AutoConnect Disabled");
		}
	}

	protected override void OnConnected()
	{
		base.OnConnected();
		DebugLog($"Connected:{this.brokerAddress} ({_topics.Count} mapped topics)");
	}

	[Button("Resubscribe")]
	protected override void SubscribeTopics()
	{
		base.SubscribeTopics();
		LoadEventHandlers();
		_topics = new List<string>();
		foreach (var meh in _eventHandlers)
		{
			meh.ResetEventMap();
			foreach (var entry in meh.TopicEvents)
			{
				_topics.Add(entry.Topic);
			}
		}

		if (_topics.Count > 0)
		{
			byte[] qosBytes = new byte[_topics.Count];
			for(int i = 0; i < _topics.Count; i++)
			{
				qosBytes[i] = MqttMsgBase.QOS_LEVEL_AT_LEAST_ONCE;
			}
			client.Subscribe(_topics.ToArray(),qosBytes);
			Debug.Log($"MqttControllerSubscribeTopics- subscribed to {String.Join(",",_topics.ToArray())} mqtt topics");
		}
	}

	protected override void DecodeMessage(string topic, byte[] message)
	{
		base.DecodeMessage(topic, message);
		string messageStr = new string(System.Text.UTF8Encoding.UTF8.GetString(message));
		bool handled = false;

		messageStr = messageStr.TrimStart();
		string debugStr;
		if (messageStr[0] != '{')
		{
			// handle non-json message
			debugStr = messageStr;
			foreach (var meh in _eventHandlers)
			{
				handled = handled || meh.NotifyMessage(topic, messageStr);
			}
		}
		else
		{
			try
			{
				JObject payloadObj = JObject.Parse(messageStr);
				if (!payloadObj.ContainsKey("name"))
				{
					Debug.LogError($"JSON message missing 'name' field {messageStr}");
					return;
				}
				if (!payloadObj.ContainsKey("fields"))
				{
					Debug.LogError($"JSON message missing 'fields' field {messageStr}");
				}

				string messageName = (string) payloadObj["name"];

				JObject fieldObj = (JObject) payloadObj["fields"];
				Dictionary<string,object> fieldDict = fieldObj.ToObject<Dictionary<string,object>>();
				// JsonConvert.DeserializeObject<Dictionary<string,object>>(fieldObj);
				// Dictionary<string,object> fieldDict = (Dictionary<string,object>) payloadObj["fields"].deser;

				// handle non-json message
				foreach (var meh in _eventHandlers)
				{
					handled = handled || meh.NotifyJsonMessage(topic,messageName,fieldDict);
				}
				
				
				debugStr = messageName;
			}
			catch (Exception e)
			{
				Debug.LogError($"Bad JSON received {(e)}\n{messageStr}");
				return;
			}


		}

		if (handled)
			DebugLog($"Event:{topic}.{debugStr}");
		else
			DebugLog($"Ignoring: {topic}/{debugStr}");

	}

	protected void OnPraireControl(string message, Dictionary<string,object> d)
	{
		DebugLog($"OnPraireControl message:{message}");

		if (message == "play")
		{
			if (!_fmp.IsPlaying())
			{
				_pmm.StartPlayback();
			}
		}
		else if (message == "stop")
		{
			if (_fmp.IsPlaying())
			{
				_pmm.PausePlayback();
			}
		}
		else if (message == "pause")
		{
			_layoutAutoLoader.AutoLoadNextScene = false;
		}
		else if (message == "next_song")
		{
			if (_fmp.IsPlaying())
			{
				_pmm.PausePlayback();
			}
			_layoutAutoLoader.AutoLoadNextScene = true;
			_sceneLoader.LoadNextScene();
		}
	}

	protected override void DebugLog(string dbgStr)
	{
		_statusUI?.NotifyDebug(dbgStr);
		Debug.Log(dbgStr);
	}

	protected override void DebugLogWarning(string warnStr)
	{
		_statusUI?.NotifyWarning(warnStr);
		Debug.LogWarning(warnStr);
	}

	protected override void DebugLogError(string errorStr)
	{
		_statusUI?.NotifyWarning(errorStr);
		Debug.LogError(errorStr);
	}
}