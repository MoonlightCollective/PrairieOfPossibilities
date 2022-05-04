using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using PygmyMonkey.ColorPalette;
using UnityEngine;

[System.Serializable]
public class SceneSettings
{
	public bool SceneEnabled = true;
	[Range(0,1)]
	public float SceneAlpha = 1.0f;
	
	public bool UseCurrentPalette = true;

	[DisableIf("UseCurrentPalette")]
	[AllowNesting]
	public int SpecificPaletteIndex = 0;
}

public class PrairieLayerScene : MonoBehaviour
{
	public SceneSettings SceneSettings;
	public List<PrairiePatternLayer> _layers = new List<PrairiePatternLayer>();

	protected ColorPalette _scenePalette;
	public ColorPalette ScenePalette => _scenePalette;

    // Update is called once per frame
    void Update()
    {
		if (!SceneSettings.SceneEnabled)
		{
			return;
		}

		_scenePalette = null;
		if (!SceneSettings.UseCurrentPalette)
		{
			if (SceneSettings.SpecificPaletteIndex < ColorPaletteData.Singleton.colorPaletteList.Count)
			{
				_scenePalette = ColorPaletteData.Singleton.colorPaletteList[SceneSettings.SpecificPaletteIndex];
			}
			else
			{
				_scenePalette = null;
			}
		}

		if (SceneSettings.UseCurrentPalette || (_scenePalette == null))
		{
			_scenePalette = ColorPaletteData.Singleton.getCurrentPalette();
		}

		foreach (var layer in _layers)
		{
			if (layer.gameObject.activeInHierarchy)
			{
				layer.Run(Time.deltaTime, this, PrairieUtil.Points);
			}
		}
    }
}
