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
	public float CenterClearingSpacing = 8.0f;

	public override void SaveSettings()
	{
		PlayerPrefs.SetInt("SunflowerNumFixtures", NumFixtures);
		PlayerPrefs.SetFloat("SunflowerFixtureSpacing", BaseSpacingFt);
		PlayerPrefs.SetFloat("SunflowerCenterRadius", CenterRadiusFt);
		PlayerPrefs.SetFloat("SunflowerSpacingExp", SpacingExp);
		PlayerPrefs.SetFloat("SunflowerClearingOffset", ClearingOffset);
		PlayerPrefs.SetFloat("SunflowerClearingSize", ClearingSize);
		PlayerPrefs.SetFloat("SunflowerCenterClearingSpacing", CenterClearingSpacing);
	}

	static int kDefaultNumFixtures = 420;
	static float kDefaultFixtureSpacing = 3.6f;
	static float kDefaultCenterRad = 0f;
    static float kDefaultSpacingExp = 1.001f;
	static float kDefaultClearingOffset = 0;
	static float kDefaultClearingSize = 15;
	static float kDefaultCenterClearingSpacing = 6.0f;

	public override void LoadSettings()
	{
		NumFixtures = PlayerPrefs.GetInt("SunflowerNumFixtures",kDefaultNumFixtures);
		BaseSpacingFt = PlayerPrefs.GetFloat("SunflowerFixtureSpacing",kDefaultFixtureSpacing);
		CenterRadiusFt = PlayerPrefs.GetFloat("SunflowerCenterRadius",kDefaultCenterRad);
        SpacingExp = PlayerPrefs.GetFloat("SunflowerSpacingExp",kDefaultSpacingExp);
		ClearingOffset = PlayerPrefs.GetFloat("SunflowerClearingOffset", kDefaultClearingOffset);
		ClearingSize = PlayerPrefs.GetFloat("SunflowerClearingSize", kDefaultClearingSize);
		CenterClearingSpacing = PlayerPrefs.GetFloat("SunflowerCenterClearingSpacing", kDefaultCenterClearingSpacing);
	}

	public override bool GenerateLayout(GameObject rootObj, GameObject fixturePrefab, GameObject portalPrefab = null, GameObject boothPrefab = null)
	{
		base.GenerateLayout(rootObj, fixturePrefab, portalPrefab, boothPrefab);

		int fixturesLeft = NumFixtures;
		float twoPi = Mathf.PI * 2f;
		float GoldenRatio = 1.61803398875f;

		// put a circle of lights around the center clearing
		// figure out how many lights we need --- assume 8' spacing around the circle
		float clearing_radius = ClearingSize; // in feet
		if (clearing_radius > 0)
		{
			float perimeter = 2 * Mathf.PI * clearing_radius;
			int numPlants = (int)(perimeter / CenterClearingSpacing);
			float angleStep = Mathf.PI * 2 / numPlants; // angle step per light

			float clearingAngle = 0;
			for (int k = 0; k < numPlants; k++)
			{
				Vector3 newPlant = new Vector3(0, 0, 0);
				newPlant.x += clearing_radius * Mathf.Cos(clearingAngle);
				newPlant.y = 0;
				newPlant.z += clearing_radius * Mathf.Sin(clearingAngle);

				if (AddFixture(new Vector3(PrairieUtil.FeetToMeters(newPlant.x), 0.0f, PrairieUtil.FeetToMeters(newPlant.z)), rootObj, fixturePrefab) != null)
					fixturesLeft--;

				clearingAngle += angleStep;
			}
		}

		// now put circles around phone booths
		// then when placing the rest of the plants, if a new plant is too close to an existing plant we'll skip

		// temp disable
		//for (int j=4; j<6; j++)
		for (int j=4; j<4; j++)
        {
			if (clearing_radius > 0)
			{
				// figure out how many lights we need --- assume 8' spacing around the circle
				float perimeter = 2 * Mathf.PI * clearing_radius;
				int numPlants = (int)(perimeter / CenterClearingSpacing);
				float angleStep = Mathf.PI * 2 / numPlants; // angle step per light

				float clearingAngle = 0;
				for (int k=0; k<numPlants; k++)
				{
					Vector3 newPlant = PrairieUtil.GetLayoutGen().Clearings[j];
					newPlant.x += clearing_radius * Mathf.Cos(clearingAngle);
					newPlant.y = 0;
					newPlant.z += clearing_radius * Mathf.Sin(clearingAngle);

					if (AddFixture(new Vector3(PrairieUtil.FeetToMeters(newPlant.x), 0.0f, PrairieUtil.FeetToMeters(newPlant.z)), rootObj, fixturePrefab) != null)
						fixturesLeft--;

					clearingAngle += angleStep;
				}
			}

		}

		int i = 0;
		int iterBreak = 40000;

		while (fixturesLeft > 0)
		//while (false)
		{
			iterBreak--;
			if (iterBreak < 0)
			{
				Debug.LogError("Iteration interrupt");
				return false;
			}
			float angle = i * twoPi / (GoldenRatio * GoldenRatio);
			float radius = Mathf.Pow(SpacingExp, i) * BaseSpacingFt * Mathf.Sqrt(i);
			//float clearing_radius = ClearingSize; // in feet
			//float portal_clearing_radius = 7;
			float booth_clearing_radius = ClearingSize;

			float x = radius * Mathf.Cos(angle);
			float z = radius * Mathf.Sin(angle);
			Vector3 plant_loc = new Vector3(x, 0, z);

			i = i + 1;
			if (radius < CenterRadiusFt)
				continue;

			// create clearings for portals and hot spots
			if ( false
				// only create clearings for booths
				//Vector3.Distance(PrairieUtil.GetLayoutGen().Clearings[0], plant_loc) < portal_clearing_radius ||
				//Vector3.Distance(PrairieUtil.GetLayoutGen().Clearings[1], plant_loc) < portal_clearing_radius ||
				//Vector3.Distance(PrairieUtil.GetLayoutGen().Clearings[2], plant_loc) < portal_clearing_radius ||
				//Vector3.Distance(PrairieUtil.GetLayoutGen().Clearings[3], plant_loc) < portal_clearing_radius ||
				
				// don't even create clearings for booths
				//Vector3.Distance(PrairieUtil.GetLayoutGen().Clearings[4], plant_loc) < booth_clearing_radius ||
				//Vector3.Distance(PrairieUtil.GetLayoutGen().Clearings[5], plant_loc) < booth_clearing_radius
				)
			{
				Debug.Log($"Skipping for clearing{Vector3.Distance(PrairieUtil.GetLayoutGen().Clearings[4], plant_loc)} {Vector3.Distance(PrairieUtil.GetLayoutGen().Clearings[5], plant_loc)}");
				continue;
			}

			if (AddFixture(new Vector3(PrairieUtil.FeetToMeters(plant_loc.x), 0.0f, PrairieUtil.FeetToMeters(plant_loc.z)), rootObj, fixturePrefab) != null)
				fixturesLeft--;
			else
			{
				Debug.Log("Skipped fixture" + fixturesLeft + " remaining");
			}

		}
		return true;
	}
}