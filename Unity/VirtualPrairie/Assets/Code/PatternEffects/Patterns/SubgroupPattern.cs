using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;
using UnityEngine.Rendering.Universal;


public class SubgroupPattern : PrairiePatternLayer
{
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

	public virtual void Start()
	{
		rebuildLayerList();
	}

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


	public override void Run(float deltaTime,PrairieLayerGroup group, List<StemColorManager> points)
	{
		float prevSubgroupAlpha = group.SubgroupAlpha;
		group.SetSubgroupAlpha(BlendSettings.LayerAlpha * prevSubgroupAlpha);

		foreach (var l in _layers)
		{
			if (l.gameObject.activeInHierarchy)
				l.Run(deltaTime * GetTimeMult(), group, points);
		}

		group.SetSubgroupAlpha(prevSubgroupAlpha);
	}
}