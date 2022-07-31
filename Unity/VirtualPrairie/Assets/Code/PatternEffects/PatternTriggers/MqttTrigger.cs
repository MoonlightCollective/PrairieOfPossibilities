using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

[System.Serializable]
public class MessageToTriggerEntry
{
	public string DisplayName;
	public string Message;
	public List<TopicFilterEntry> FieldFilters;
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
	public Color EditGroupColor = new Color(.8f,.8f,.8f);

	public void NotifyMessage(string message,Dictionary<string,object> fields)
	{
		foreach (var entry in MessageMappings)
		{			
			if (entry.Message == message)
			{
				if (entry.FieldFilters != null)
				{
					if (!PrairieUtil.CheckFieldsAgainstFilter(fields,entry.FieldFilters))
					{
						// skip to next iteration of the outer loop. This message isn't going to get an event fired.
						continue;
					}
				}
				entry.Targets.EmitTrigger(new PrairieTriggerParams(message,entry.SendParams?entry.Param0:0f,entry.SendParams?entry.Param1:0f));
			}
		}
	}
}
