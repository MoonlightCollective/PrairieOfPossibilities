using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

[System.Serializable]
public class LayerGroupSettings
{
	public bool Enabled = true;
	[Range(0,1)]
	public float GroupAlpha = 1.0f;
	
	public bool UseCurrentPalette = true;

	[DisableIf("UseCurrentPalette")]
	[AllowNesting]
	public int SpecificPaletteIndex = 0;
}