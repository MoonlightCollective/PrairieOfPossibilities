using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

[System.Serializable]
public class SmartColorSlot
{
	[Snapshot]
	public bool UsePalette = false;

	[HideIf("UsePalette")]
	[AllowNesting]
	[Snapshot]
	public Color StaticColor = new Color(1f,0f,0f,1f);
	
	[ShowIf("UsePalette")]
	[AllowNesting]
	[Range(0,5)]
	[Snapshot]public int ColorIndex = 0;

	public Color Color(PrairieLayerGroup group)
	{
		if (UsePalette)
		{
			if (group.GroupColors != null && 
				ColorIndex > -1 &&
				ColorIndex < ColorPaletteMix.kPrairieColorMixCount)
			{
				return group.GroupColors.Colors[ColorIndex];
			}
		}

		return StaticColor;
	}
}
