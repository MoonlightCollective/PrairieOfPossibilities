using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FixtureLayoutRings : FixtureLayoutBase
{
	[Header("Ring Params")]
	public float CenterRadiusFt = 30f;
	public int NumAisles;
	public float AisleWidthFt;
	public float AisleCurve;

	public override void SaveSettings()
	{
		PlayerPrefs.SetInt("RingNumFixtures", NumFixtures);
		PlayerPrefs.SetFloat("RingFixtureSpacing", BaseSpacingFt);
		PlayerPrefs.SetFloat("RingCenterRadius", CenterRadiusFt);
		PlayerPrefs.SetFloat("RingAisleWidth",AisleWidthFt);
		PlayerPrefs.SetFloat("RingAisleCurve",AisleCurve);
		PlayerPrefs.SetInt("RingNumAisles",NumAisles);
	}

	static int kDefaultNumFixtures = 210;
	static float kDefaultFixtureSpacing = 8f;
	static float kDefaultCenterRad = 25f;
	static float kDefaultAisleWidth = 16f;
	static float kDefaultAisleCurve = 5f;
	static int kDefaultNumAisles = 2;

	public override void LoadSettings()
	{
		NumFixtures = PlayerPrefs.GetInt("RingNumFixtures",kDefaultNumFixtures);
		BaseSpacingFt = PlayerPrefs.GetFloat("RingFixtureSpacing",kDefaultFixtureSpacing);
		CenterRadiusFt = PlayerPrefs.GetFloat("RingCenterRadius",kDefaultCenterRad);
		AisleWidthFt = PlayerPrefs.GetFloat("RingAisleWidth",kDefaultAisleWidth);
		AisleCurve = PlayerPrefs.GetFloat("RingAisleCurve",kDefaultAisleCurve);
		NumAisles = PlayerPrefs.GetInt("RingNumAisles",kDefaultNumAisles);
	}

	public override bool GenerateLayout(GameObject rootObj, GameObject fixturePrefab)
	{
		base.GenerateLayout(rootObj, fixturePrefab);

		int fixturesLeft = NumFixtures;

		float radius = CenterRadiusFt;
		float angleOffset = 0;
		bool lastRing = false;
		int ring = 0;

		float twoPi = Mathf.PI * 2f;

		while (fixturesLeft > 0)
		{
			float perimeter = radius * twoPi;

			int numArcs = Mathf.Max(1,NumAisles);
			int numAisles = Mathf.Max(0,NumAisles);
			float arcLen = ((perimeter - (numAisles * AisleWidthFt)) / numArcs);

			int arcBaseCt = (int)(arcLen / BaseSpacingFt) + 1; 			// # bases used in this run, err on the side of density
			float aisleAngle = (AisleWidthFt / perimeter) * twoPi;
			float anglePerFixture = 0f;
			if (arcBaseCt > 1)
				anglePerFixture = ((arcLen / Mathf.Max(1,(arcBaseCt -1))) / perimeter) * twoPi;
			
			float angle = angleOffset;

			for (int k = 0; k < numArcs; k++)
			{

				for (int j = 0; j < arcBaseCt; j++)
				{
					// TODO - add tags.

					float x = radius * Mathf.Cos(angle);
					float z = radius * Mathf.Sin(angle);

					// TODO add yinYang tags

					//TODO add section, ring, and base# tags
					
					if (_curChannel + _channelsPerFixture >= _channelsPerUniverse)
					{
						_curUniverse++;
						_curChannel = 0;
					}

					GameObject newObj = CreateObjFromPrefab(fixturePrefab);
					newObj.transform.SetParent(rootObj.transform,false);
					
					Debug.Log($"{angle}, {x}, {z}");
					newObj.transform.position = new Vector3(PrairieUtil.FeetToMeters(x),0.0f,PrairieUtil.FeetToMeters(z));
					_curChannel += _channelsPerFixture;
					
					fixturesLeft--;
					angle += anglePerFixture;
				}
				angle += aisleAngle;
				angle -= anglePerFixture;
			}
			radius += BaseSpacingFt;
			angleOffset += ((AisleCurve/10) * Mathf.PI/180.0f);
			ring++;
		}


		return true;
	}
}
