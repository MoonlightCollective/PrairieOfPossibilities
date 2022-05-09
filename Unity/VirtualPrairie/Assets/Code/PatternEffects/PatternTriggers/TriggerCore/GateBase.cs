using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Scripting;

//===============
// GateBase - use as a simple base class for a component that will emit gate events.
//===============
public abstract class GateBase : MonoBehaviour
{
	public GateEmitter GateTargets;

	public void Awake()
	{
		GateTargets.Init();
	}
}

