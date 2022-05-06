using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using PygmyMonkey.ColorPalette;
using UnityEngine;

public class PrairieLayerGroup : MonoBehaviour
{
	public LayerGroupSettings GroupSettings;
	
	protected ColorPalette _groupPalette;
	public ColorPalette GroupPalette => _groupPalette;

	public float GroupAlpha => GroupSettings.GroupAlpha;

	protected List<PrairiePatternLayer> _layers = new List<PrairiePatternLayer>();

	//===============
	// Maintain a list of patterns so we don't have to GetComponent every frame
	// on our children. We'll use the actual hierarchy to manage the patterns and
	// their order
	//===============
	public void OnTransformChildrenChanged()
	{
		rebuildLayerList();
	}

	public void Start()
	{
		rebuildLayerList();
	}

	//===============
	// Update - update all our patterns.
	//===============
	public virtual void Update()
	{
		if (!GroupSettings.Enabled)
		{
			return;
		}

		updateGroupPalette();
		
		foreach (var layer in _layers)
		{
			if (layer.gameObject.activeInHierarchy)
			{
				layer.Run(Time.deltaTime, this, PrairieUtil.Points);
			}
		}
	}
	
	//===============
	// Internal methods
	//===============

	// build our list of layers from transform's children
	protected void rebuildLayerList()
	{
		_layers.Clear();
		foreach (Transform child in transform)
		{
			PrairiePatternLayer pattern = child.GetComponent<PrairiePatternLayer>();
			if (pattern != null)
			{
				_layers.Add(pattern);
			}
		}
	}

	// based on our settings, figure out which color palette we should be using.
	protected void updateGroupPalette()
	{
		_groupPalette = null;
		if (!GroupSettings.UseCurrentPalette)
		{
			if (GroupSettings.SpecificPaletteIndex < ColorPaletteData.Singleton.colorPaletteList.Count)
			{
				// use a specific palette, as long as our index is in range.
				_groupPalette = ColorPaletteData.Singleton.colorPaletteList[GroupSettings.SpecificPaletteIndex];
			}
			else
			{
				// out of range - fall back to current palette.
				_groupPalette = null;
			}
		}
		
		if (GroupSettings.UseCurrentPalette || (_groupPalette==null))
		{
			_groupPalette = ColorPaletteData.Singleton.getCurrentPalette();
		}
	}
}