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


public class ColorPaletteMixer : TriggerListener
{
	[ReadOnly]
	public ColorPaletteMix ActiveColors;

	[Header("TargetPaletteSelector")]
	[OnValueChanged("targetChanged")]
	public ColorPaletteMixerEntry TargetPalette = new ColorPaletteMixerEntry();

	[Header("Palette Playlist")]
	public bool EnableAutoCycle;
	public float AutoCycleTime = 5.0f;

	public List<ColorPaletteMixerEntry> PalettePlaylist = new List<ColorPaletteMixerEntry>();

	[Header("Transition Behavior")]
	public float DefaultTransitionTime = 2.0f;
	float _curTransitionTime;

	public enum ETriggerBehavior
	{
		None,
		CyclePlaylist,
		ShufflePlaylist
	}

	[Header("Trigger Behavior")]
	public 	ETriggerBehavior TriggerBehavior = ETriggerBehavior.None;


	float _transitionAlpha = 1;
	int _curPaletteDex = -1;
	int _targetPeltteDex = 0;
	
	int _cycleDex = 0;
	float _timer;

	[Foldout("Debug")]
	[ReadOnly]
	public ColorPaletteMix FromColors;
	[Foldout("Debug")]
	[ReadOnly]
	public ColorPaletteMix ToColors;

	void targetChanged()
	{
		// Debug.Log("Target Changed");
		// _targetPeltteDex = TargetPalette.PaletteDex;
		// startTransitionToTarget();
	}

	public void Awake()
	{
		TargetPalette.SyncWithGlobalPalette();
		foreach (var p in PalettePlaylist)
		{
			p.SyncWithGlobalPalette();
		}
		SnapToTargetPalette();
		_timer = AutoCycleTime;
	}

	public void Update()
	{
		if (TargetPalette.PaletteDex != _curPaletteDex && (_transitionAlpha >= 1f || _transitionAlpha < 0f))
		{
			startTransitionToTarget(_curTransitionTime);
		}

		if (EnableAutoCycle)
		{
			_timer -= Time.deltaTime;
			if (_timer < 0)
			{
				autoCyclePalette();
				_timer = AutoCycleTime;
			}
		}

		updateTransition();
	}

	void autoCyclePalette()
	{
		Debug.Log("Auto Cycle");
		if (PalettePlaylist.Count <= 1)
		{
			return;
		}

		int newDex = _curPaletteDex;
		while (newDex == _curPaletteDex)
			newDex = Random.Range(0,PalettePlaylist.Count);

		Debug.Log("New Target:" + newDex);
		InitiateTransition(PalettePlaylist[newDex],DefaultTransitionTime);
		_timer = AutoCycleTime;
	}

	public void InitiateTransition(ColorPaletteMixerEntry targetEntry, float duration)
	{
		_curTransitionTime = duration;
		TargetPalette = targetEntry;
	}

	void startTransitionToTarget(float transitionTime)
	{
		Debug.Log($"start transition to palette:{TargetPalette.PaletteDex}, {transitionTime}");
		_curTransitionTime = transitionTime;
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
			_transitionAlpha = Mathf.Clamp01(_transitionAlpha + Time.deltaTime / _curTransitionTime);
			for (int i = 0; i < ColorPaletteMix.kPrairieColorMixCount; i++)
			{
				ActiveColors.Colors[i] = Color.Lerp(FromColors.Colors[i],ToColors.Colors[i],_transitionAlpha);
			}
			if (_transitionAlpha >= 1)
			{
				_curPaletteDex = _targetPeltteDex;
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

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		switch (TriggerBehavior)
		{
			case ETriggerBehavior.None:
				return;
			case ETriggerBehavior.CyclePlaylist:
				if (PalettePlaylist.Count <= 1)
				{
					Debug.Log($"{gameObject.name} - attmept to cycle palette from trigger, but don't have palette playlist entries to cycle");
				}
				_cycleDex = (_cycleDex+1)%PalettePlaylist.Count;
				TargetPalette = PalettePlaylist[_cycleDex];
				startTransitionToTarget(DefaultTransitionTime);
				break;
			case ETriggerBehavior.ShufflePlaylist:
				autoCyclePalette();
				break;
		}
	}
}
