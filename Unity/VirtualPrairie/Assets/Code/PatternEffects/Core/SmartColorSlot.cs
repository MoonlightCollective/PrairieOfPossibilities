using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

[System.Serializable]
public class SmartColorSlot
{
	public bool UsePalette = false;

	[HideIf("UsePalette")]
	[AllowNesting]
	public Color StaticColor = new Color(1f,0f,0f,1f);
	
	[ShowIf("UsePalette")]
	[AllowNesting]
	[Range(0,7)]
	public int ColorIndex = 0;

	public Color Color(PrairieLayerGroup group)
	{
		if (UsePalette)
		{
			if (group.GroupPalette != null && 
				ColorIndex > -1 &&
				ColorIndex < group.GroupPalette.colorInfoList.Count)
			{
				return group.GroupPalette.colorInfoList[ColorIndex].color;
			}
		}

		return StaticColor;
	}
}
