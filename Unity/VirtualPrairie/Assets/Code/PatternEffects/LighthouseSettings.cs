using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "Lighthouse Settings", menuName = "Prairie Settings/LighthouseSettings", order = 1)]
public class LighthouseSettings : ScriptableObject
{
	public PrairieUtil.AxisEnum Axis;

	[Range(0,2)]
	public float Speed;
	[Range(0,1)]
	public float Width;
}
