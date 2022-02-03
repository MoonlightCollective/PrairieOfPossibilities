using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FixtureLayoutRings : FixtureLayoutBase
{
	[Header("Ring Params")]
	public float CenterRadiusFt = 30f;
	public int NumAisles;
	public float AisleWidthFt;
	public float AisleCurve = 10 / 360 * 2 * Mathf.PI;

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
			angleOffset += AisleCurve;
			ring++;
		}

		// int numArcs = NumAisles + 1;

/*		while (fixturesLeft > 0)
		{
			float perimeter = Mathf.PI * 2.0f * radius;
			float angle = angleOffset;
			float arcLen = ((perimeter - (AisleWidthFt * numArcs)) / numArcs);

			int arcBaseCt = (int)(arcLen / BaseSpacingFt) + 1; 			// # bases used in this run, err on the side of density
			float aisleAngle = (AisleWidthFt / perimeter) * 2.0f * Mathf.PI;	// angle of each aisle
			float baseAngle = ((lightRunDist / (arcBaseCt -1)) / perimeter) * 2.0f * Mathf.PI; // angle between bases for this run

			if (fixturesLeft <= (aisles * arcBaseCt))
				lastRing = true;

			for (int k = 0; k <= aisles; k++)
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
					
					newObj.transform.position = new Vector3(PrairieUtil.FeetToMeters(x),0.0f,PrairieUtil.FeetToMeters(z));
					_curChannel += _channelsPerFixture;
					
					fixturesLeft--;
					angle += baseAngle;
				}

				angle -= baseAngle;
			}

			radius += BaseSpacingFt;
			angleOffset += AisleCurve;
			ring++;
		}*/
		return true;
	}
}
