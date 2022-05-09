using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class PrairiePatternLayer : PrairieLayer
{
    public abstract void Run(float deltaTime,PrairieLayerGroup scene, List<StemColorManager> points);
	public virtual void SetIndexedFloat(int paramDex, float newVal) { }

	public PatternPointFilterBase PointFilter;

	protected bool filterAllowPoint(StemColorManager point)
	{
		if (PointFilter == null)
			return true;
		return (PointFilter.AllowPoint(point));
	}
}
