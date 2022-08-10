using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using NaughtyAttributes;
using PygmyMonkey.ColorPalette;

[System.Serializable]
[CreateAssetMenu(fileName = "Colorize-BrightToHSV", menuName = "Prairie Colors/Bright To HSV", order = 2)]
public class ColorizeBrightToHSV : ColorizeBrightnessValue
{
	public override Color ColorForBrightness(float v, PrairieLayerGroup group )
	{
		float clampedV = Mathf.Clamp01(v);
        return UnityEngine.Color.HSVToRGB(v, 1.0f, 1.0f);
	}
}
