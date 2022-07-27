using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

[System.Serializable]
public class TopicToEventEntry
{
	public string Topic;
	public UnityEvent<string> OnMessage;

}
