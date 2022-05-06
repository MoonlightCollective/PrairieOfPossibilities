using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using NaughtyAttributes;
using PygmyMonkey.ColorPalette;

[System.Serializable]
public class ColorizeBrightnessValue : ColorizeBase
{

}

[System.Serializable]
[CreateAssetMenu(fileName = "Colorize-BrightToGradient", menuName = "Prairie Colors/Bright To Gradient", order = 1)]
public class ColorizeBrightToGradient : ColorizeBrightnessValue
{
	public SmartColorSlot MinColor;
	public SmartColorSlot MaxColor;

	public Color ColorForBrightness(float v, PrairieLayerGroup group )
	{
		float clampedV = Mathf.Clamp01(v);
		if (group == null || group.GroupPalette == null)
		{
			return simpleLerp(clampedV);
		}

		if (MinColor.UsePalette && MaxColor.UsePalette)
		{
			ColorPalette palette = group.GroupPalette;
			// special case - do a palette gradient
			int MaxColorDex = Mathf.Min(Mathf.Max(MaxColor.ColorIndex,MinColor.ColorIndex),palette.colorInfoList.Count-1);
			int MinColorDex = Mathf.Min(Mathf.Min(MaxColor.ColorIndex,MinColor.ColorIndex),palette.colorInfoList.Count-1);
			
			float colorDexDelta = (float)MaxColorDex - (float)MinColorDex;
			if (colorDexDelta <= 0)
				return MinColor.Color(group);

			// If I could pick a floating point index, where would I sit?
			float floatDex = Mathf.Lerp(MinColorDex,MaxColorDex,clampedV);

			// now Color lerp between the bookending indicies.
			int minLerpDex = Mathf.FloorToInt(floatDex);
			int maxLerpDex = Mathf.FloorToInt(floatDex+1);
			return Color.Lerp(palette.colorInfoList[minLerpDex].color,palette.colorInfoList[maxLerpDex].color,floatDex -(float)minLerpDex);
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
