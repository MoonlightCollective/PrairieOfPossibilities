using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

[CreateAssetMenu(fileName = "Ring Settings", menuName = "Prairie Settings/RingSettings", order = 1)]
public class RingSettings : ScriptableObject
{
	public EOriginLoc Origin;
	
 	// in meters
	 public float FalloffRange = 10f;

	[CurveRange(0,0,1,300,EColor.Green)]
	public AnimationCurve RingMovement = AnimationCurve.Linear(0,0,1,300);

	[CurveRange(0,0,1,1,EColor.Yellow)] 
	public AnimationCurve FalloffCurve = AnimationCurve.Linear(0,1.0f,1,0.0f);
}
