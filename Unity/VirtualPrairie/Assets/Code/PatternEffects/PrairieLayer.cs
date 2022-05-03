using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PrairieLayer : MonoBehaviour
{
	[Header("Layer Blending")]
	public bool PatternEnabled = true;
	public ColorBlend.EBlendMode BlendMode = ColorBlend.EBlendMode.AlphaBlend;
	public float LayerAlpha = 1.0f;
}


