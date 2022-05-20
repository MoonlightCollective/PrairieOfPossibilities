using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using NaughtyAttributes;
using PygmyMonkey.ColorPalette;

[System.Serializable]
public abstract class ColorizeBrightnessValue : ColorizeBase
{
	public abstract Color ColorForBrightness(float v, PrairieLayerGroup group );
}

[System.Serializable]
[CreateAssetMenu(fileName = "Colorize-BrightToGradient", menuName = "Prairie Colors/Bright To Gradient", order = 1)]
public class ColorizeBrightToGradient : ColorizeBrightnessValue
{
	public SmartColorSlot MinColor;
	public SmartColorSlot MaxColor;

	public override Color ColorForBrightness(float v, PrairieLayerGroup group )
	{
		float clampedV = Mathf.Clamp01(v);
		if (group == null || group.GroupColors == null)
		{
			return simpleLerp(clampedV);
		}

		if (MinColor.UsePalette && MaxColor.UsePalette)
		{
			ColorPaletteMix mix = group.GroupColors;

			// special case - do a palette gradient
			int MaxColorDex = Mathf.Min(Mathf.Max(MaxColor.ColorIndex,MinColor.ColorIndex),ColorPaletteMix.kPrairieColorMixCount);
			int MinColorDex = Mathf.Min(Mathf.Min(MaxColor.ColorIndex,MinColor.ColorIndex),ColorPaletteMix.kPrairieColorMixCount);
			
			float colorDexDelta = (float)MaxColorDex - (float)MinColorDex;
			if (colorDexDelta <= 0)
				return MinColor.Color(group);

			// If I could pick a floating point index, where would I sit?
			float floatDex = Mathf.Lerp(MinColorDex,MaxColorDex,clampedV);

			// now Color lerp between the bookending indicies.
			int minLerpDex = Mathf.Clamp(Mathf.FloorToInt(floatDex),0,ColorPaletteMix.kPrairieColorMixCount);
			int maxLerpDex = Mathf.Clamp(Mathf.FloorToInt(floatDex+1),0,ColorPaletteMix.kPrairieColorMixCount);

			return Color.Lerp(mix.Colors[minLerpDex],mix.Colors[maxLerpDex],floatDex -(float)minLerpDex);
		}

		// one or the other might come from the palette, but we aren't lerping through palette stops.
		Color startLerpC = MinColor.Color(group);
		Color endLerpC = MaxColor.Color(group);
		return Color.Lerp(startLerpC,endLerpC,clampedV);
	}

	protected Color simpleLerp(float v)
	{
		return Color.Lerp(MinColor.StaticColor,MaxColor.StaticColor,v);
	}
}
