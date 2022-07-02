using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

[System.Serializable]
public class MessageToTriggerEntry
{
	public string Message;
	public TriggerEmitter Targets;
	public bool SendParams = false;
	[ShowIf("SendParams")]
	[AllowNesting]
	public float Param0 = 0f;

	[ShowIf("SendParams")]
	[AllowNesting]
	public float Param1 = 0f;
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
				entry.Targets.EmitTrigger(new PrairieTriggerParams(message,entry.SendParams?entry.Param0:0f,entry.SendParams?entry.Param1:0f));
			}
		}
	}
}
