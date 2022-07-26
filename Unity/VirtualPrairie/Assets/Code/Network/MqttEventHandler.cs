using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class MqttEventHandler : MonoBehaviour
{
	public List<TopicToEventEntry> TopicEvents;
	protected Dictionary<string,UnityEvent<string>> _eventMap = new Dictionary<string,UnityEvent<string>>();
	
	public void Awake()
	{
	}

	public void ResetEventMap()
	{
		_eventMap.Clear();
		foreach (var entry in TopicEvents)
		{
			_eventMap[entry.Topic] = entry.OnMessage;
		}
	}

	public bool NotifyMessage(string topic, string messageStr)
	{
		if (_eventMap.ContainsKey(topic))
		{
			_eventMap[topic].Invoke(messageStr);
			return true;
		}
		else
		{
			return false;
		}
	}
}
