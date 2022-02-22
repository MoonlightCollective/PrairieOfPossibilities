using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FixtureLayoutSunflower : FixtureLayoutBase
{
	[Header("Sunflower Params")]
	public float CenterRadiusFt = 30f;
    public float SpacingExp = 1.002f;

	public override void SaveSettings()
	{
		PlayerPrefs.SetInt("SunflowerNumFixtures", NumFixtures);
		PlayerPrefs.SetFloat("SunflowerFixtureSpacing", BaseSpacingFt);
		PlayerPrefs.SetFloat("SunflowerCenterRadius", CenterRadiusFt);
		PlayerPrefs.SetFloat("SunflowerSpacingExp", SpacingExp);
	}

	static int kDefaultNumFixtures = 400;
	static float kDefaultFixtureSpacing = 3f;
	static float kDefaultCenterRad = 30f;
    static float kDefaultSpacingExp = 1.002f;

	public override void LoadSettings()
	{
		NumFixtures = PlayerPrefs.GetInt("SunflowerNumFixtures",kDefaultNumFixtures);
		BaseSpacingFt = PlayerPrefs.GetFloat("SunflowerFixtureSpacing",kDefaultFixtureSpacing);
		CenterRadiusFt = PlayerPrefs.GetFloat("SunflowerCenterRadius",kDefaultCenterRad);
        SpacingExp = PlayerPrefs.GetFloat("SunflowerSpacingExp",kDefaultSpacingExp);
	}

	public override bool GenerateLayout(GameObject rootObj, GameObject fixturePrefab)
	{
		base.GenerateLayout(rootObj, fixturePrefab);

		int fixturesLeft = NumFixtures;
		float twoPi = Mathf.PI * 2f;
        float GoldenRatio = 1.61803398875f;

        int i = 0;
		while (fixturesLeft > 0)
		{
			float angle = i * twoPi / (GoldenRatio * GoldenRatio);
            float radius = Mathf.Pow(SpacingExp, i) * BaseSpacingFt * Mathf.Sqrt(i);
			float x = radius * Mathf.Cos(angle);
			float z = radius * Mathf.Sin(angle);
            i = i + 1;
            if (radius < CenterRadiusFt)
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