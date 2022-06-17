using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using NaughtyAttributes;

public class GlobalClock : MonoBehaviour
{
	[Header("Clock Settings")]
	public float BPM = 120;
	public int BeatPerMeasure;
	[ReadOnly]	
	public int CurMeasure = 0;
	[ReadOnly]	
	public int CurQuarterInMeasure = 0;
	[ReadOnly]	
	public int CurEighthInMeasure = 0;
	[ReadOnly]	
	public int CurSixtenthInQuarter = 0;
	public bool DebugBeat = true;

	float _secPerSixteenth;
	float _syncTimer = 0f;

	public System.Action<int> QuarterNoteEvent;
	public System.Action<int> EighthNoteEvent;
	public System.Action<int> SixteenthNoteEvent;
	public System.Action<int> MeasureEvent;

	public void Start()
	{
		ResetBeat();
		if (DebugBeat)
		{
			MeasureEvent += DebugMeasure;
			QuarterNoteEvent += DebugQuarter;
			EighthNoteEvent += DebugEighth;
			SixteenthNoteEvent += DebugSixteenth;
		}
	}

	public void DebugQuarter(int q)
	{
		Debug.Log($"Quater:{q}");
	}
	
	public void DebugEighth(int e)
	{
		Debug.Log($"Eighth:{e}");
	}

	public void DebugSixteenth(int s)
	{
		Debug.Log($"Sixteenth:{s}");

	}

	public void DebugMeasure(int m)
	{
		Debug.Log($"Measure:{m}");
	}

	public void ResetBeat()
	{
		_syncTimer = 0;
		CurMeasure = -1;
		CurSixtenthInQuarter = -1;
		CurEighthInMeasure = -1;
		CurQuarterInMeasure = -1;
	}

	public void Update()
	{
		_secPerSixteenth = ((1.0f / BPM) * 60f) / 4.0f;
		updateBeatTimer();
	}

	void updateBeatTimer()
	{
		_syncTimer += Time.deltaTime;
		while (_syncTimer >= _secPerSixteenth && _secPerSixteenth > 0)
		{
			// tick forward!
			CurSixtenthInQuarter++;

			if (CurSixtenthInQuarter >= 4)
			{
				CurSixtenthInQuarter = 0;
				CurQuarterInMeasure++;
				
				if (CurQuarterInMeasure >= BeatPerMeasure)
				{
					CurQuarterInMeasure = 0;
					CurEighthInMeasure = 0;
					CurMeasure++;
					MeasureEvent?.Invoke(CurMeasure);
				}

				QuarterNoteEvent?.Invoke(CurQuarterInMeasure);
			}

			if (CurSixtenthInQuarter % 2 == 0)
			{
				CurEighthInMeasure++;
				EighthNoteEvent?.Invoke(CurEighthInMeasure);
			}

			SixteenthNoteEvent?.Invoke(CurSixtenthInQuarter);
			_syncTimer -= _secPerSixteenth;
		}
	}

}
