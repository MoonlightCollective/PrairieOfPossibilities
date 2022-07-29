using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class MqttEventHandler : MonoBehaviour
{
	public List<TopicToEventEntry> TopicEvents;
	protected Dictionary<string,TopicToEventEntry> _eventMap = new Dictionary<string, TopicToEventEntry>();

	public bool DebugLog = false;

	public void Awake()
	{
	}

	public void ResetEventMap()
	{
		_eventMap.Clear();
		foreach (var entry in TopicEvents)
		{
			_eventMap[entry.Topic] = entry;
		}
	}

	public bool NotifyMessage(string topic, string messageStr)
	{
		if (DebugLog)
		{
			Debug.Log($"{gameObject.name} recieved TEXT mqtt message: {topic}/{messageStr}");
		}

		if (_eventMap.ContainsKey(topic))
		{
			var entry = _eventMap[topic];
			if (entry.FieldFilters != null && entry.FieldFilters.Count > 0)
			{
				// we have field filters - those are only ever valid in json messages.
				return false;
			}
			
			entry.OnMessage.Invoke(messageStr,null);
			return true;
		}
		else
		{
			return false;
		}
	}

	public bool NotifyJsonMessage(string topic, string messageName, Dictionary<string,object> fields)
	{	
		if (DebugLog)
		{
			Debug.Log($"{gameObject.name} recieved JSON mqtt message: {topic}/{messageName}");
			foreach (var key in fields.Keys)
			{
				Debug.Log($"{key},{fields[key]}");
			}
		}
		
		if (_eventMap.ContainsKey(topic))
		{
			var entry = _eventMap[topic];
			if (entry.FieldFilters != null)
			{
				if (!PrairieUtil.CheckFieldsAgainstFilter(fields,entry.FieldFilters))
					return false;

				// falls through to invoke the message - no failed filter checks!
			}

			_eventMap[topic].OnMessage.Invoke(messageName,fields);
			return true;
		}
		
		return false;
	}
}
