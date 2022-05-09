using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PrairieTriggerParams
{
	public string Name = "-";
	public float Param1 = 0f;
	public float Param2 = 0f;
	public PrairieTriggerParams(string n, float p1 = 0, float p2 = 0)
	{
		Name = n;
		Param1 = p1;
		Param2 = p2;
	}
}

public abstract class TriggerBase : MonoBehaviour
{
	public string Name = "Trigger";
	public TriggerEmitter TriggerTargets;
}


