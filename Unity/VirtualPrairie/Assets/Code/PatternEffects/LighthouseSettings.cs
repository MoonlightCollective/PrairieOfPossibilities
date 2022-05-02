using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "Lighthouse Settings", menuName = "Prairie Settings/LighthouseSettings", order = 1)]
public class LighthouseSettings : ScriptableObject
{
	public LighthousePattern.AxisEnum Axis;
	public float Speed;
	public float Width;
}
