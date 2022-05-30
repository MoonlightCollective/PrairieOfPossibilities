using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class MessageToTriggerEntry
{
	public string Message;
	public TriggerEmitter Targets;
}

public class MqttTrigger : MonoBehaviour
{
	public List<MessageToTriggerEntry> MessageMappings = new List<MessageToTriggerEntry>();

	public void NotifyMessage(string message)
	{
		foreach (var entry in MessageMappings)
		{
			if (entry.Message == message)
			{
				entry.Targets.EmitTrigger(new PrairieTriggerParams(message,0,0));
			}
		}
	}
}
