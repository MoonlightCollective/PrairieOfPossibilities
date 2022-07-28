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
	List<string> _topics = new List<string>();
	protected UIMqttStatus _statusUI;

	protected override void Awake()
	{
		_eventHandlers = new List<MqttEventHandler>(GameObject.FindObjectsOfType<MqttEventHandler>());
		_statusUI = GameObject.FindObjectOfType<UIMqttStatus>();
		base.Awake();
	}

	protected override void Start()
	{
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
		_eventHandlers = new List<MqttEventHandler>(GameObject.FindObjectsOfType<MqttEventHandler>());
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
			Debug.Log($"MqttControllerSubscribeTopics- subscribed to {_topics.Count} mqtt topics");
		}
	}

	protected override void DecodeMessage(string topic, byte[] message)
	{
		base.DecodeMessage(topic, message);
		string messageStr = new string(System.Text.UTF8Encoding.UTF8.GetString(message));
		bool handled = false;

		messageStr = messageStr.TrimStart();
		if (messageStr[0] != '{')
		{
			// handle non-json message
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
				Dictionary<string,dynamic> fieldDict = fieldObj.ToObject<Dictionary<string,dynamic>>();
				// JsonConvert.DeserializeObject<Dictionary<string,object>>(fieldObj);
				// Dictionary<string,object> fieldDict = (Dictionary<string,object>) payloadObj["fields"].deser;

				// handle non-json message
				foreach (var meh in _eventHandlers)
				{
					handled = handled || meh.NotifyJsonMessage(topic,messageName,fieldDict);
				}
			}
			catch (Exception e)
			{
				Debug.LogError($"Bad JSON received {(e)}\n{messageStr}");
				return;
			}


		}

		if (handled)
			DebugLog($"Event:{topic}.{messageStr}");
		else
			DebugLog($"Ignoring: {topic}/{messageStr}");

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