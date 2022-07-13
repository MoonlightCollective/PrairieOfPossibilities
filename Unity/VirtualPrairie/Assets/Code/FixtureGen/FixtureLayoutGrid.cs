
using System.Collections;
using UnityEngine;

public class FixtureLayoutGrid : FixtureLayoutBase
{
	[Header("Grid Params")]
	public int NumRows = 10;
	public float RowSpacingFt = 7f;

	static int kDefaultNumFixtures = 20;
	static float kDefaultFixtureSpacing = 8;
	static int kDefaultNumRows = 2;
	static float kDefaultRowSpacing = 6;

	public override void SaveSettings()
	{
		PlayerPrefs.SetInt("GridNumFixtures", NumFixtures);
		PlayerPrefs.SetFloat("GridFixtureSpacing", BaseSpacingFt);
		PlayerPrefs.SetFloat("GridRowSpacing", RowSpacingFt);
		PlayerPrefs.SetInt("GridNumRows",NumRows);
	}

	public override void LoadSettings()
	{
		NumFixtures = PlayerPrefs.GetInt("GridNumFixtures",kDefaultNumFixtures);
		BaseSpacingFt = PlayerPrefs.GetFloat("GridFixtureSpacing",kDefaultFixtureSpacing);
		RowSpacingFt = PlayerPrefs.GetFloat("GridRowSpacing",kDefaultRowSpacing);
		NumRows = PlayerPrefs.GetInt("GridNumRows",kDefaultNumRows);
	}

	public override bool GenerateLayout(GameObject rootObj, GameObject fixturePrefab, GameObject portalPrefab = null, GameObject boothPrefab = null)
	{
		base.GenerateLayout(rootObj,fixturePrefab,portalPrefab,boothPrefab);

		int basesPerRow = (int)(NumFixtures/NumRows);
		for (int r = 0; r < NumRows; r++)
		{
			float offset = 0;
			if (r%2 == 0)
				offset = BaseSpacingFt / 2.0f;
			
			for (int c = 0; c < basesPerRow; c++)
			{
				GameObject newObj = CreateObjFromPrefab(fixturePrefab);
				newObj.transform.SetParent(rootObj.transform,false);
				
				Vector3 pos = new Vector3();
				pos.x = offset + c * PrairieUtil.FeetToMeters(BaseSpacingFt);
				pos.y = 0.0f;
				pos.z = r * PrairieUtil.FeetToMeters(RowSpacingFt);
				newObj.transform.position = pos;
			}
		}
		
		return true;
	}


}
