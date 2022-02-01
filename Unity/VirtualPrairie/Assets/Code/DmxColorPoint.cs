using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public abstract class DmxColorPoint : MonoBehaviour
{
	public abstract void SetFromDmx(byte[] newData);
	public abstract void SetFromDmx(ArraySegment<byte> newDataSeg);
	public int Universe;
	public int GlobalPointIndex;
	public int LocalPointIndex;
}
