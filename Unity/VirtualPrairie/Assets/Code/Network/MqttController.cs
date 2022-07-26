using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using M2MqttUnity;
using uPLibrary.Networking.M2Mqtt.Messages;
using UnityEngine.Events;
using NaughtyAttributes;

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

		foreach (var meh in _eventHandlers)
		{
			handled = handled || meh.NotifyMessage(topic, messageStr);
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