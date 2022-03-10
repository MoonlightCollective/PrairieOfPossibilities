using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FixtureLayoutSunflower : FixtureLayoutBase
{
	[Header("Sunflower Params")]
	public float CenterRadiusFt = 0f;
    public float SpacingExp = 1.001f;
	public float ClearingOffset = 0;
	public float ClearingSize = 30;

	public override void SaveSettings()
	{
		PlayerPrefs.SetInt("SunflowerNumFixtures", NumFixtures);
		PlayerPrefs.SetFloat("SunflowerFixtureSpacing", BaseSpacingFt);
		PlayerPrefs.SetFloat("SunflowerCenterRadius", CenterRadiusFt);
		PlayerPrefs.SetFloat("SunflowerSpacingExp", SpacingExp);
		PlayerPrefs.SetFloat("SunflowerClearingOffset", ClearingOffset);
		PlayerPrefs.SetFloat("SunflowerClearingSize", ClearingSize);

	}

	static int kDefaultNumFixtures = 420;
	static float kDefaultFixtureSpacing = 3.6f;
	static float kDefaultCenterRad = 0f;
    static float kDefaultSpacingExp = 1.001f;
	static float kDefaultClearingOffset = 0;
	static float kDefaultClearingSize = 12;

	public override void LoadSettings()
	{
		NumFixtures = PlayerPrefs.GetInt("SunflowerNumFixtures",kDefaultNumFixtures);
		BaseSpacingFt = PlayerPrefs.GetFloat("SunflowerFixtureSpacing",kDefaultFixtureSpacing);
		CenterRadiusFt = PlayerPrefs.GetFloat("SunflowerCenterRadius",kDefaultCenterRad);
        SpacingExp = PlayerPrefs.GetFloat("SunflowerSpacingExp",kDefaultSpacingExp);
		ClearingOffset = PlayerPrefs.GetFloat("SunflowerClearingOffset", kDefaultClearingOffset);
		ClearingSize = PlayerPrefs.GetFloat("SunflowerClearingSize", kDefaultClearingSize);
	}

	public override bool GenerateLayout(GameObject rootObj, GameObject fixturePrefab)
	{
		base.GenerateLayout(rootObj, fixturePrefab);

		int fixturesLeft = NumFixtures;
		float twoPi = Mathf.PI * 2f;
		float GoldenRatio = 1.61803398875f;
		Vector3[] clearings;
		clearings = new Vector3[6];
		float clearing_angle, clearing_distance;

		// create clearings for portals and hot spots
		clearing_distance = 50 + ClearingOffset;
		for (int j = 0; j < 4; j++)
		{
			// create circle for new clearing
			clearing_angle = j * (Mathf.PI / 2); // set at 90, 180, 270, etc

			clearings[j] = new Vector3(clearing_distance * Mathf.Cos(clearing_angle), 0, clearing_distance * Mathf.Sin(clearing_angle));
		}
		// now create clearings for phone booths
		clearing_distance = clearing_distance * 1.5f; // put phone booths 1.5x further from center than portals
		clearing_angle = Mathf.PI / 4; // set at 45 degrees
		clearings[4] = new Vector3(clearing_distance * Mathf.Cos(clearing_angle), 0, clearing_distance * Mathf.Sin(clearing_angle));
		clearing_angle += Mathf.PI; // add 180 degrees
		clearings[5] = new Vector3(clearing_distance * Mathf.Cos(clearing_angle), 0, clearing_distance * Mathf.Sin(clearing_angle));

		int i = 0;
		while (fixturesLeft > 0)
		{
			float angle = i * twoPi / (GoldenRatio * GoldenRatio);
			float radius = Mathf.Pow(SpacingExp, i) * BaseSpacingFt * Mathf.Sqrt(i);

			float x = radius * Mathf.Cos(angle);
			float z = radius * Mathf.Sin(angle);
			Vector3 plant_loc = new Vector3(x, 0, z);

			i = i + 1;
			if (radius < CenterRadiusFt)
				continue;

			// create clearings for portals and hot spots
			float clearing_radius = ClearingSize; // in feet

			if (Vector3.Distance(clearings[0], plant_loc) < clearing_radius ||
				Vector3.Distance(clearings[1], plant_loc) < clearing_radius ||
				Vector3.Distance(clearings[2], plant_loc) < clearing_radius ||
				Vector3.Distance(clearings[3], plant_loc) < clearing_radius ||
				Vector3.Distance(clearings[4], plant_loc) < clearing_radius ||
				Vector3.Distance(clearings[5], plant_loc) < clearing_radius)
				continue;
			
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
		}
		return true;
	}
}