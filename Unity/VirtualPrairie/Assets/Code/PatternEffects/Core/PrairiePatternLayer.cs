using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public enum EOriginLoc
{
	Center,
	ThisObject,
	// GameObject,
}

public abstract class PrairiePatternLayer : PrairieLayer
{
	// Any filtering out of points we shouldn't effect happens using this filter.
	// every pattern can get one.  Call filterAlloPoint() to make the filtering actually happen.
	public PatternPointFilterBase PointFilter;

	//===============
	// Abstract methods you need to implement.
	//===============

	// Run	- Implement Run to do cool things with lights passed in the Points list with given delta time.
	// 		- use the group to deal with things like group alpha.
    public abstract void Run(float deltaTime,PrairieLayerGroup group, List<StemColorManager> points);

	// SetIndexedFloat - A way for parameters to be set by modifier components.
	// 					- for now, you need to implement this explicitly (via switch statement), but hope to 
	//					- add something sexier with reflection
	public virtual void SetIndexedFloat(int paramDex, float newVal) { }

	public virtual void NotifyNewLayout()
	{
		
	}

	// called by Start(). If you override, be sure to call base.init(), 'cause
	// we do important stuff here.
	protected virtual void init()
	{

	}

	//===============
	// Filtering
	//===============

	protected List<TriggerListener> TriggerListeners = new List<TriggerListener>();
	protected List<GateListener> GateListeners = new List<GateListener>();
	
	// filterAllowPoint() - filter out points we shouldn't affect based on our filter setting (if any)
	protected bool filterAllowPoint(StemColorManager point)
	{
		if (PointFilter == null)
			return true;
		return (PointFilter.AllowPoint(point));
	}

	//===============
	// Event handling
	//===============
	public void NotifyGateOn(PrairieTriggerParams tParams)
	{

	}

	public void NotifyGateOff(PrairieTriggerParams tParams)
	{

	}

	public void NotifyTrigger(PrairieTriggerParams tParams)
	{

	}

}
