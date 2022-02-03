
using System.Collections;
using UnityEngine;

public class FixtureLayoutGrid : FixtureLayoutBase
{
	[Header("Grid Params")]
	public int NumRows = 10;
	public float RowSpacingFt = 7f;


	public override bool GenerateLayout(GameObject rootObj, GameObject fixturePrefab)
	{
		base.GenerateLayout(rootObj,fixturePrefab);

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
