using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using Newtonsoft.Json;

public class FixtureLayoutImport : FixtureLayoutBase
{
	[Header("Import")]
	public string JsonFilePath;


	public override bool GenerateLayout(GameObject rootObj, GameObject fixturePrefab)
	{
		base.GenerateLayout(rootObj, fixturePrefab);

		string jsonStr = File.ReadAllText(JsonFilePath);
		if (!string.IsNullOrEmpty(jsonStr))
		{
			doFixtureImport(rootObj, jsonStr,fixturePrefab);
			return true;
		}
		
		return false;
	}

	public override void LoadSettings()
	{
		
	}

	public override void SaveSettings()
	{

	}


	void doFixtureImport(GameObject rootObj, string fixtureStr, GameObject prefab)
	{
		// built our JSON structures
		Debug.Log("Deserializing JSON");
		var fixtureData = JsonConvert.DeserializeObject<FixtureData>(fixtureStr);
		Debug.Log("Children found: " + fixtureData.children.Count);

		ClearChildrenFrom(rootObj);

		List<PlantColorManager> allDevices = new List<PlantColorManager>();

		// instantiate and place all fixtures at proper x,y		
		int plantId = 0;
		foreach (var item in fixtureData.children)
		{
			GameObject newObj = CreateObjFromPrefab(prefab);
			newObj.transform.SetParent(rootObj.transform, false);
			newObj.transform.position = new Vector3(PrairieUtil.InchesToMeters(item.x), 0.0f, PrairieUtil.InchesToMeters(item.z));
			PlantColorManager pcm = newObj.GetComponent<PlantColorManager>();
			pcm.PlantId = plantId++;
			pcm.PointRangeMin = pcm.PlantId * 7;
			pcm.PointRangeMax = pcm.PointRangeMin + 7;

			Vector3 castStart = newObj.transform.position + Vector3.up * 40.0f;

			RaycastHit hit;
			if (Physics.Raycast(castStart, Vector3.down, out hit, 40f, LayerMask.GetMask("Ground"), QueryTriggerInteraction.Ignore))
			{
				newObj.transform.position = hit.point;
			}

			allDevices.Add(pcm);
		}


		// Now parse our outputs to figure out how to map DMX channels to specific points on specific fixtures.
		foreach (var outputItem in fixtureData.outputs)
		{
			if (outputItem.segments != null && outputItem.segments.Count > 0)
			{
				// dealing with a list of mapped ranges.
				int universeStartDex = 0;
				foreach (var seg in outputItem.segments)
				{
					setChannelsForRun(seg.start,seg.num,outputItem.host, outputItem.universe,universeStartDex, allDevices);
					universeStartDex+=seg.num;
				}
			}
			else
			{
				setChannelsForRun(outputItem.start, outputItem.num, outputItem.host, outputItem.universe,0,allDevices);
			}
		}
	}

	public void setChannelsForRun(int startPoint, int runPointCount, string host, int universe, int universePointDexStart, List<PlantColorManager> allDevices)
	{
		int pointsPerFixture = FixtureLayoutBase.kPointsPerFixture;

		Debug.Log($"SetChannelsForRun:sp:{startPoint},rdCnt:{runPointCount},u:{universe},UPDexStar{universePointDexStart}");
		int curChan	 = startPoint;

		// how many fixtures is this?
		if (runPointCount % pointsPerFixture != 0)
		{
			Debug.LogWarning($"Run of length {runPointCount} not a multiple of {FixtureLayoutBase.kPointsPerFixture} - which means it's addressing a partial fixture. Is this intentional?");
		}

		if (startPoint % pointsPerFixture != 0)
		{
			Debug.LogWarning($"Start point not a multiple of 7 - will result in partial mapping, which will be bad");
		}

		for (int p = 0; p < runPointCount; p++)
		{
			int point = startPoint + p;
			int fixtureDex = point / pointsPerFixture;
			int localPointDex = point % pointsPerFixture;
			if (fixtureDex >= allDevices.Count)
			{
				Debug.LogError($"Point out of range: Point {point}, Fixture {fixtureDex}, PointDex {localPointDex}");
			}
			
			allDevices[fixtureDex].AssociatePointData(localPointDex,host,universe,p+universePointDexStart);
		}
	}


}
