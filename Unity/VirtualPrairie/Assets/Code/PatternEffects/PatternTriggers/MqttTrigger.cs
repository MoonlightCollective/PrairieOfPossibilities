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
	public bool ShowDebug = false;

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
						if (ShowDebug)
							Debug.Log($"{gameObject.name} failed trigger filter check");
						// skip to next iteration of the outer loop. This message isn't going to get an event fired.
						continue;
					}
				}
				if (ShowDebug)
					Debug.Log($"{gameObject.name} emitting trigger");
				entry.Targets.EmitTrigger(new PrairieTriggerParams(message,entry.SendParams?entry.Param0:0f,entry.SendParams?entry.Param1:0f));
			}
		}
		if (ShowDebug)
			Debug.Log($"{gameObject.name} no message mapping for {message}");
	}
}
