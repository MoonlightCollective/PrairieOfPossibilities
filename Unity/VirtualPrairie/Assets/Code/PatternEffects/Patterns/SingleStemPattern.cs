using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;


public class SingleStemPattern : PrairiePatternMonochromaticBase
{
	[Snapshot]
	public string StemPattern = "1000000";

	[Header("Brightness (index 0,1)")]
	[Snapshot]
	[Range(0,1)]
	public float MinBrightness = 0f;
	[Snapshot]
	[Range(0,1)]
	public float MaxBrightness = 1f;

	[Header("Offsets (value = index 2)")]
	[Snapshot]
	public ENumberParamType OffsetType;

	[Snapshot]
	[ShowIf("OffsetType", ENumberParamType.Float)]
	[Range(0,1)]
	public float PatternOffsetFloat = 0f;

	[ShowIf("OffsetType", ENumberParamType.Integer)]
	[Range(0,6)]
	public int PatternOffsetInt = 0;

	public override void Run(float deltaTime, PrairieLayerGroup group, List<StemColorManager> points)
	{

		int offset;
		int dex;
		if (OffsetType == ENumberParamType.Float)
			offset = (int)(PatternOffsetFloat * (float)(StemPattern.Length-1));
		else
			offset = PatternOffsetInt;

		foreach (var p in points)
		{
			if (!filterAllowPoint(p))
				continue;
			
			dex = p.StemIndex;
			if (dex < 0 || dex >= StemPattern.Length)
				continue;

			float b = MinBrightness;
			dex = (StemPattern.Length - dex + offset) % (StemPattern.Length);
			if (StemPattern[dex] != '0')
			{
				b = MaxBrightness;
			}

			Color blendColor = ColorForBrightness(b,group);
			p.SetColor(ColorBlend.BlendColors(blendColor,p.CurColor,BlendSettings.BlendMode));
		}
	}

	public override void SetIndexedFloat(int paramDex, float newVal)
	{
		switch (paramDex)
		{
			case 0:
				MinBrightness = newVal;
				break;
			case 1:
				MaxBrightness = newVal;
				break;
			case 2:
				if (OffsetType == ENumberParamType.Integer)
				{
					PatternOffsetInt = Mathf.Clamp((int)newVal,0,7);
				}
				else
				{
					PatternOffsetFloat = Mathf.Clamp01(newVal);
				}
				break;
		}

	}
}
