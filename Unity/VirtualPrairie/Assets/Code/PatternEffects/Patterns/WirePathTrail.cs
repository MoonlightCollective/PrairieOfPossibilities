using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[SnapshotAll]
public class WirePathTrail : PrairiePatternMonochromaticBase
{
	
	[Range(0,1)]
	public float MaxBrightness;
	
	[Range(0,1)]
	public float MinBrightness;

	[Header("Indexed Params")]	
	public float EffectT;
	public float TrailLength = 1.0f;

	[Range(0,50)]
	public int MinUniverseId;
	[Range(0,50)]
	public int MaxUniverseId;


	public enum EPathIdFilter 
	{
		All,
		EvenUniverseOnly,
		OddUniverseOnly,
	};

	public EPathIdFilter PathFilter;

	public override void Run(float deltaTime, PrairieLayerGroup group, List<StemColorManager> points)
	{
		List<WiredPath> paths = WiredPathManager.Instance.Paths;
		foreach (var p in paths)
		{
			if (validPath(p))
			{
				float pathLen = p.GetPathLengthMeters();
				float cumulativeDist = 0f;
				
				for(int i = 0; i < p.Fixtures.Count; i++)
				{
					if (i > 0)
						cumulativeDist += Vector2.Distance(p.Fixtures[i].GetPosition(),p.Fixtures[i-1].GetPosition());

					float distFract = TrailLength * cumulativeDist/p.GetPathLengthMeters(); // fraction of whole run this fixture is.
					float val = 0f;
					if (distFract <= EffectT)
					{
						val = EffectT - distFract;
						val = (1-val);
					}
					float b = Mathf.Lerp(MinBrightness,MaxBrightness,val);
					Color blendColor = ColorForBrightness(b,group);
					foreach (var scm in p.Fixtures[i].FixtureStems())
					{
						scm.SetColor(ColorBlend.BlendColors(blendColor,scm.CurColor,BlendSettings.BlendMode));
					}
				}
			}
		}
	}

	public override void SetIndexedFloat(int paramDex, float newVal)
	{
		switch (paramDex) 
		{
			case 0: EffectT = newVal; break;
			case 1: TrailLength = Mathf.Clamp01(newVal); break;
			case 2: MinUniverseId = (int)newVal; break;
			case 3: MaxUniverseId = (int)newVal; break;
		}
	}

	bool validPath(WiredPath p)
	{
		if (p.Universe < MinUniverseId || p.Universe > MaxUniverseId)
			return false;
		
		switch (PathFilter)
		{
			case EPathIdFilter.All:
			default:
				return true;
			case EPathIdFilter.EvenUniverseOnly:
				return (p.Universe >= 0 && (p.Universe%2==0));
			case EPathIdFilter.OddUniverseOnly:
				return (p.Universe >= 0 && (p.Universe%2==1));
		}
	}
}
