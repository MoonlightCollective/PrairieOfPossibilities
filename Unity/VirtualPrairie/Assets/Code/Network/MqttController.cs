using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using M2MqttUnity;
using uPLibrary.Networking.M2Mqtt.Messages;
using UnityEngine.Events;

/// <summary>
/// Examples for the M2MQTT library (https://github.com/eclipse/paho.mqtt.m2mqtt),
/// </summary>

[System.Serializable]
public class TopicToEventEntry
{
	public string Topic;
	public UnityEvent<string> OnMessage;
}

public class MqttController : M2MqttUnityClient
{
	public List<TopicToEventEntry> TopicEvents;
	
	protected Dictionary<string,UnityEvent<string>> _eventMap = new Dictionary<string,UnityEvent<string>>();

	protected override void OnConnected()
	{
		base.OnConnected();
		Debug.Log("MQTT connected");
	}

	protected override void SubscribeTopics()
	{
		base.SubscribeTopics();
		List<string> topics = new List<string>();
		_eventMap.Clear();
		foreach (var entry in TopicEvents)
		{
			topics.Add(entry.Topic);
			_eventMap[entry.Topic] = entry.OnMessage;
		}
		client.Subscribe(topics.ToArray(),new byte[] { MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE });
	}

	protected override void DecodeMessage(string topic, byte[] message)
	{
		base.DecodeMessage(topic, message);
		if (_eventMap.ContainsKey(topic))
		{
			_eventMap[topic].Invoke(new string(System.Text.UTF8Encoding.UTF8.GetString(message)));
		}
		else
		{
			Debug.Log($"No event for topic {topic}");
		}
	}
}