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

	public override bool GenerateLayout(GameObject rootObj, GameObject fixturePrefab, GameObject portalPrefab = null, GameObject boothPrefab = null)
	{
		base.GenerateLayout(rootObj, fixturePrefab, portalPrefab, boothPrefab);

		int fixturesLeft = NumFixtures;
		int numLights = 0;

		float radius = CenterRadiusFt;
		float angleOffset = 0;
		int ring = 0;
		int arcBaseCt = 0;

		float twoPi = Mathf.PI * 2f;

		while (fixturesLeft > 0)
		{
			float perimeter = radius * twoPi;

			int numArcs = Mathf.Max(1,NumAisles);
			int numAisles = Mathf.Max(0,NumAisles);
			float arcLen = ((perimeter - (numAisles * AisleWidthFt)) / numArcs);

			// hack to create higher density for the innermost ring
			if (ring == 0)
				arcBaseCt = (int)(arcLen / 6.0f) + 1; 			// set spacing to just 6' for the innermost ring
			else
				arcBaseCt = (int)(arcLen / BaseSpacingFt) + 1;          // # bases used in this run, err on the side of density

			float aisleAngle = (AisleWidthFt / perimeter) * twoPi;
			float anglePerFixture = 0f;
			if (arcBaseCt > 1)
				anglePerFixture = ((arcLen / Mathf.Max(1,(arcBaseCt -1))) / perimeter) * twoPi;
			
			float angle = (angleOffset + (aisleAngle / 2.0f));

			for (int k = 0; k < numArcs; k++)
			{

				for (int j = 0; j < arcBaseCt; j++)
				{
					// TODO - add tags.

					float x = radius * Mathf.Cos(angle);
					float z = radius * Mathf.Sin(angle);

					// TODO add yinYang tags

					//TODO add section, ring, and base# tags
					
					if (_curChannel + PrairieDmxController.ChannelsPerFixture >= PrairieDmxController.ChannelsPerUniverse)
					{
						_curUniverse++;
						_curChannel = 0;
					}

					GameObject newObj = CreateObjFromPrefab(fixturePrefab);
					newObj.transform.SetParent(rootObj.transform,false);
					
					Debug.Log($"{numLights}, a:{angle}, x:{x}, z:{z}");
					newObj.transform.position = new Vector3(PrairieUtil.FeetToMeters(x),0.0f,PrairieUtil.FeetToMeters(z));
					_curChannel += PrairieDmxController.ChannelsPerFixture;
					
					fixturesLeft--;
					numLights++;
					angle += anglePerFixture;
				}
				angle += aisleAngle;
				angle -= anglePerFixture;
			}
			radius += BaseSpacingFt;
			angleOffset += ((AisleCurve/10) * Mathf.PI/180.0f);
			// angleOffset += (anglePerFixture / 2.0f);
			ring++;
		}


		return true;
	}
}
