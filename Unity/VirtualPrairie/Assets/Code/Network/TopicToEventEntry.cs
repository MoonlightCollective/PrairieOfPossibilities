using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

[System.Serializable]
public class TopicFilterEntry
{
	public string FieldName;
	public string FieldValue;
}

[System.Serializable]
public class TopicToEventEntry
{
	public string Topic;
	public List<TopicFilterEntry> FieldFilters;
	public UnityEvent<string,Dictionary<string,object>> OnMessage;
}
