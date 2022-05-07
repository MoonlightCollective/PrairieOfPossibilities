using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KeyboardGate : GateBase
{
	[Header("Keyboard")]
	public KeyCode Key = KeyCode.A;
	public void Update()
	{
		if (Input.GetKeyDown(Key))
		{
			Debug.Log($"Key Down {Key.ToString()}");
			GateTargets.EmitOnEvent(new PrairieTriggerParams($"{Key}-On"));
		}
		if (Input.GetKeyUp(Key))
		{
			GateTargets.EmitOffEvent(new PrairieTriggerParams($"{Key}-Off"));
		}
	}
}
