using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public enum EClockDivision
{
	Measure,
	Quarter,
	Eighth,
	Sixteenth
}

public class ClockToTriggerBase : MonoBehaviour
{
	public EClockDivision ClockDivision;
	public GlobalClock Clock;
	
	public void Start()
	{
		if (Clock != null)
		{
			Clock.QuarterNoteEvent += notifyQuarter;
			Clock.EighthNoteEvent += notifyEighth;
			Clock.MeasureEvent += notifyMeasure;
			Clock.SixteenthNoteEvent += notifySixteenth;
		}
	}

	void notifyQuarter(int countId)
	{
		if (ClockDivision == EClockDivision.Quarter)
		{
			triggerEvent("ClockQuarter",countId);
		}
	}

	void notifyEighth(int countId)
	{
		if (ClockDivision == EClockDivision.Eighth)
		{
			triggerEvent("ClockEighth",countId);
		}
	}

	void notifySixteenth(int countId)
	{
		if (ClockDivision == EClockDivision.Sixteenth)
		{
			triggerEvent("ClockSixteenth",countId);
		}
	}

	void notifyMeasure(int countId)
	{
		if (ClockDivision == EClockDivision.Measure)
		{
			triggerEvent("ClockMeasure",countId);
		}
	}

	protected virtual void triggerEvent(string evName, int evParam)
	{
		// TriggerOut.EmitTrigger(new PrairieTriggerParams(evName,(float)evParam,0f));
	}
}

public class ClockToTrigger : ClockToTriggerBase
{
	public TriggerEmitter TriggerOut;
	
	protected override void triggerEvent(string evName, int evParam)
	{
		TriggerOut.EmitTrigger(new PrairieTriggerParams(evName,(float)evParam,0f));
	}
}
