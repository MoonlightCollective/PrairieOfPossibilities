using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public abstract class DmxColorPoint : MonoBehaviour
{
	public abstract void SetFromDmxColor(byte[] newData);
	public abstract void SetFromDmxColor(ArraySegment<byte> newDataSeg);
	// the global dmx controller
	public PrairieDmxController Controller;
	// the host address of the dmx controller
	public string Host = "undefined";
	// the universe of the dmx controller
	public int Universe = -1;
	// the point index in the entire scene 
	public int GlobalPointIndex = -1;
	// the point index in the local dmx universe
	public int LocalPointIndex = -1;
}
