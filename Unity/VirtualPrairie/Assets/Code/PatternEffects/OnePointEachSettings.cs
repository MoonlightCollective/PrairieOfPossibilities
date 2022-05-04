using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "OnePointEachSettings", menuName = "Prairie Settings/OnePointEach Settings", order = 1)]
public class OnePointEachSettings : ScriptableObject
{
	public float DelayTimeSec = 0.5f;
	public SmartColorSlot PointColor;
}
