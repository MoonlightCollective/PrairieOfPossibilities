using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using PygmyMonkey.ColorPalette;
using UnityEngine;

[System.Serializable]
public class ColorPaletteMix
{
	public const int kPrairieColorMixCount = 6;
	public Color[] Colors = new Color[kPrairieColorMixCount];
}

[System.Serializable]
public class ColorPaletteMixerEntry
{
	[Dropdown("validPaletteDex")]
	[OnValueChanged("SyncWithGlobalPalette")]
	public int PaletteDex = 0;

	#pragma warning disable 414
    private int[] validPaletteDex{
		get
		{
			int[] retList = new int[ColorPaletteData.Singleton.colorPaletteList.Count];
			for (int i = 0; i < retList.Length; i++)
			{
				retList[i] = i;
			}
			return retList;
		}
	}
	#pragma warning restore 414

	public void SyncWithGlobalPalette()
	{
		PaletteDex = Mathf.Min(PaletteDex,ColorPaletteData.Singleton.colorPaletteList.Count-1);
	}
}

public class ColorPaletteMixer : MonoBehaviour
{
	[ReadOnly]
	public ColorPaletteMix ActiveColors;

	[Header("TargetPaletteSelector")]
	public ColorPaletteMixerEntry TargetPalette = new ColorPaletteMixerEntry();

	[Header("Palette Playlist")]
	public bool EnableAutoCycle;
	public float DefaultTransitionTime = 2.0f;
	public List<ColorPaletteMixerEntry> PalettePlaylist = new List<ColorPaletteMixerEntry>();

	float _transitionAlpha = 1;
	int _curPaletteDex = -1;
	int _targetPeltteDex = 0;

	[Foldout("Debug")]
	[ReadOnly]
	public ColorPaletteMix FromColors;
	[Foldout("Debug")]
	[ReadOnly]
	public ColorPaletteMix ToColors;

	public void Awake()
	{
		TargetPalette.SyncWithGlobalPalette();
		foreach (var p in PalettePlaylist)
		{
			p.SyncWithGlobalPalette();
		}
		SnapToTargetPalette();
	}

	public void Update()
	{
		if (TargetPalette.PaletteDex != _targetPeltteDex)
		{
			startTransitionToTarget();
		}

		updateTransition();
	}

	void startTransitionToTarget()
	{
		_targetPeltteDex = TargetPalette.PaletteDex;
		var palette = ColorPaletteData.Singleton.colorPaletteList[TargetPalette.PaletteDex];
		for (int i = 0; i < ColorPaletteMix.kPrairieColorMixCount;i++)
		{
			FromColors.Colors[i] = ActiveColors.Colors[i];
			int cDex = Mathf.Min(i,palette.colorInfoList.Count-1);
			ToColors.Colors[i] = palette.colorInfoList[i].color;
		}
		_transitionAlpha = 0f;
	}

	void updateTransition()
	{
		if (_transitionAlpha < 1.0f)
		{
			_transitionAlpha = Mathf.Clamp01(_transitionAlpha + Time.deltaTime / DefaultTransitionTime);
			for (int i = 0; i < ColorPaletteMix.kPrairieColorMixCount; i++)
			{
				ActiveColors.Colors[i] = Color.Lerp(FromColors.Colors[i],ToColors.Colors[i],_transitionAlpha);
			}
		}
	}

	public void SnapToTargetPalette()
	{
		var palette = ColorPaletteData.Singleton.colorPaletteList[TargetPalette.PaletteDex];
		for(int i = 0; i < ColorPaletteMix.kPrairieColorMixCount; i++)
		{
			int cDex = Mathf.Min(i,palette.colorInfoList.Count-1);
			ActiveColors.Colors[i] = palette.colorInfoList[cDex].color;
		}

		_transitionAlpha = 1.0f;
		_targetPeltteDex = TargetPalette.PaletteDex;
		_curPaletteDex = TargetPalette.PaletteDex;
	}


}
