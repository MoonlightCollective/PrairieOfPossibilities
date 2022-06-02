using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

[System.Serializable]
public class SparkleFixtureState
{
	public float[] StemTimers = new float[7];
	public float[] StemDurations = new float[7];

	protected SparklePattern _parentPattern;
	protected float _flickerTimer;

	public void Init(SparklePattern parentPattern)
	{
		for (int i = 0; i < 7; i++)
		{
			StemTimers[i] = 0f;
			StemDurations[i] = 1.0f;
		}

		_flickerTimer = -1f;
		_parentPattern = parentPattern;
	}

	public void Update(float deltaTime)
	{
		_flickerTimer -= deltaTime;

		if (_flickerTimer < 0)
		{
			int rDex = Random.Range(0,6);
			if (StemTimers[rDex] <= 0)
			{
				StemTimers[rDex] = _parentPattern.SparkleDuration.RandomVal;
				_flickerTimer = _parentPattern.SparkleFrequency.RandomVal;
				StemDurations[rDex] = StemTimers[rDex];
			}
		}

		for (int i = 0; i < StemTimers.Length; i++)
		{
			if (StemTimers[i] > 0)
			{
				StemTimers[i] -= deltaTime;
			}
		}
	}
}

public class SparklePattern : PrairiePatternMonochromaticBase
{
	[Snapshot] public float MinBrightness = 0.1f;
	[Snapshot] public FloatRange SparkleFrequency = new FloatRange(0.01f,0.1f);
	[Snapshot] public FloatRange SparkleDuration = new FloatRange(0.5f,1f);

	[CurveRange(0,-2,1,2)]
	public AnimationCurve FlickerShape = new AnimationCurve(new Keyframe(0,1),new Keyframe(1,0));

	bool _initialized = false;
	
	protected SparkleFixtureState[] _fixtureStates;

	public void Awake()
	{
		_initialized = false;
	}

	void initStates(int count)
	{
		_fixtureStates = new SparkleFixtureState[count];
		for(int i = 0; i < count; i++)
		{
			var s = new SparkleFixtureState();
			s.Init(this);
			_fixtureStates[i] = s;
		}
	}

	public override void Run(float deltaTime, PrairieLayerGroup group, List<StemColorManager> points)
	{
		int fixtureCount = points.Count/7;
		if (!_initialized || (_fixtureStates.Length != fixtureCount))
		{
			initStates(fixtureCount);
			_initialized = true;
		}

		foreach (var s in _fixtureStates)
		{
			s.Update(deltaTime);
		}

		foreach (var p in points)
		{
			if (!filterAllowPoint(p))
				continue;
			
			int fixtureDex = p.ParentFixture.FixtureId;

			SparkleFixtureState fs = _fixtureStates[p.ParentFixture.FixtureId];
			float timerVal = fs.StemTimers[p.StemIndex];
			float val = Mathf.Clamp01(MinBrightness + ((FlickerShape.Evaluate(1- timerVal/(fs.StemDurations[p.StemIndex]))) * (1-MinBrightness)));

			Color blendColor = ColorForBrightness(val,group);
			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendSettings.BlendMode));
		}
	}
}
