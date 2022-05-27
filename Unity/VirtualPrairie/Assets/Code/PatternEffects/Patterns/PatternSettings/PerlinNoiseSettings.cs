
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using NaughtyAttributes;

[System.Serializable]
public class PerlinNoiseSettings
{
	[Header("NoiseScale")]
	public Vector3 NoiseScale = Vector3.one;

	[Header("NosieOffset")]
	public Vector3 InitialOffsets = Vector3.zero;

	[CurveRange(0f,0f,1f,1f)]
	public AnimationCurve BrightnessCurve = AnimationCurve.Linear(0f,0f,1f,1f);

	[Header("Offset Motion")]
	[Range(-10,10)]
	public float MotionSpeedX = 0f;
	[Range(-10,10)]
	public float MotionSpeedY = 0f;
	[Range(-10,10)]
	public float MotionSpeedZ = 0f;
}
