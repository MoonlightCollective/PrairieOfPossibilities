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
		GlobalPlantSettings.FindGlobalInstance();
		base.GenerateLayout(rootObj, fixturePrefab);

		if (!string.IsNullOrEmpty(JsonFilePath))
		{
			string jsonStr = File.ReadAllText(JsonFilePath);
			if (!string.IsNullOrEmpty(jsonStr))
			{
				doFixtureImport(rootObj, jsonStr,fixturePrefab);
				return true;
			}
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

		var allDevices = new List<WiredFixtureBase>();
		// instantiate and place all fixtures at proper x,y		
		foreach (var item in fixtureData.children)
		{
			// create the plant !
			GameObject newObj = AddFixture(new Vector3(PrairieUtil.InchesToMeters(item.x), 0.0f, PrairieUtil.InchesToMeters(item.z)), rootObj, prefab, true);

			// need to keep an ordered list of imported plants so we can index into them for wired paths.
			var wfb = newObj.GetComponentInChildren<WiredFixtureBase>();
			if (wfb != null)
			{
				allDevices.Add(wfb);
			}
		}

		// now reconstruct paths.
		if (!Application.isEditor || true)
		{
			WiredPathManager pathManager = WiredPathManager.Instance;
			pathManager.ClearAllPaths();
			foreach (var pathData in fixtureData.wirePaths)
			{
				WiredPath newPath = WiredPathManager.NewPathInstance();
				newPath.ArtnetHost = pathData.artnetHost;
				newPath.Universe = pathData.universe;
				newPath.ChannelStart = pathData.channelStart;
				newPath.PathId = pathData.pathId;
				foreach (var pathDataItem in pathData.items)
				{
					if (pathDataItem.FixtureType == "PlantFixture")
					{
						if (pathDataItem.FixtureId < allDevices.Count)
						{
							WiredFixtureBase wfb = allDevices[pathDataItem.FixtureId];
							newPath.AddFixture(wfb);
						}
						else
						{
							Debug.LogWarning($"Fixture ({pathDataItem.FixtureId}) out of range in path {newPath.PathId} - skipping");
						}

					}
					else
					{
						Debug.LogWarning($"Unknown Fixture type in path {pathDataItem.FixtureType} - skipping.");
					}
				}
				pathManager.AddPath(newPath);
			}
		}

		// Now parse our outputs to figure out how to map DMX channels to specific points on specific fixtures.
		// TODO - let's pull this from the wire data instead!
		foreach (var outputItem in fixtureData.outputs)
		{
			if (outputItem.segments != null && outputItem.segments.Count > 0)
			{
				// dealing with a list of mapped ranges.
				int universeStartDex = 0;
				foreach (var seg in outputItem.segments)
				{
					setChannelsForRun(rootObj, seg.start,seg.num,outputItem.host, outputItem.universe,universeStartDex);
					universeStartDex+=seg.num;
				}
			}
			else
			{
				setChannelsForRun(rootObj, outputItem.start, outputItem.num, outputItem.host, outputItem.universe,0);
			}
		}

		if (!Application.isEditor || true)
		{
			PlantSelectionManager.Instance.NotifyFixtureImport();
			WiredPathManager.Instance.NotifyNewLayout();
		}

		PrairiePatternLayer[] patterns = FindObjectsOfType<PrairiePatternLayer>(true);
		foreach (var p in patterns)
		{
			p.NotifyNewLayout();
		}
	}

	// helper function that will setup all of the dmx channels for a "run" of a single output (aka dmx controller)
	private void setChannelsForRun(GameObject rootObj, int startPoint, int runPointCount, string host, int universe, int universePointDexStart)
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

		// go through the whole run
		for (int p = 0; p < runPointCount; p++)
		{
			int point = startPoint + p;
			int fixtureDex = point / pointsPerFixture;
			int localPointDex = point % pointsPerFixture;

			// make sure that this plant fixture exists in the scene (by index)
			if (fixtureDex >= rootObj.transform.childCount)
			{
				Debug.LogError($"Point out of range: Point {point}, Fixture {fixtureDex}, PointDex {localPointDex}");
			}
			
			// find the right plant
			PlantColorManager pcm = rootObj.transform.GetChild(fixtureDex).GetComponent<PlantColorManager>();
			// update the point data
			pcm.AssociatePointData(localPointDex, host, universe, p+universePointDexStart);
		}
	}
}
