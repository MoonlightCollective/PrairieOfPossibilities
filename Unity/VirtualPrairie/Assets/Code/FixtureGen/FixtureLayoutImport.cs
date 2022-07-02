using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using Newtonsoft.Json;

public class FixtureLayoutImport : FixtureLayoutBase
{
	[Header("Import")]
	public string JsonFilePath;


	public override bool GenerateLayout(GameObject rootObj, GameObject fixturePrefab, GameObject portalPrefab = null)
	{
		GlobalPlantSettings.FindGlobalInstance();
		base.GenerateLayout(rootObj, fixturePrefab, portalPrefab);

		if (!string.IsNullOrEmpty(JsonFilePath))
		{
			Debug.Log($"FixtureLayoutImport:GenerateLayout- importing file '{JsonFilePath}'");
			string jsonStr = File.ReadAllText(JsonFilePath);
			if (!string.IsNullOrEmpty(jsonStr))
			{
				doFixtureImport(rootObj, jsonStr, fixturePrefab, portalPrefab);
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


	void doFixtureImport(GameObject rootObj, string fixtureStr, GameObject prefab, GameObject portalPrefab)
	{
		// built our JSON structures
		var fixtureData = JsonConvert.DeserializeObject<FixtureData>(fixtureStr);
		Debug.Log($"FixtureLayoutImport:GenerateLayout- children.Count={fixtureData.children.Count}");

		// clear the current scene layout
		ClearChildrenFrom(rootObj);

		var allDevices = new List<WiredFixtureBase>();
		// instantiate and place all fixtures at proper x,y		
		foreach (var item in fixtureData.children)
		{
			// create the plant !
			// note: this creates an in order zero based plant index
			GameObject newObj = AddFixture(new Vector3(PrairieUtil.InchesToMeters(item.x), 0.0f, PrairieUtil.InchesToMeters(item.z)), rootObj, prefab, true);

			// need to keep an ordered list of imported plants so we can index into them for wired paths.
			var wfb = newObj.GetComponentInChildren<WiredFixtureBase>();
			if (wfb != null)
			{
				allDevices.Add(wfb);
			}
		}

		// now place all the portals.  we will place the portal under the "portals" root obj for now
		GameObject portalsObj = GameObject.Find("Portals");
		if (portalsObj != null && portalPrefab != null)
		{
			foreach (var item in fixtureData.portals)
			{
				// create the portal !
				var newPos = new Vector3(PrairieUtil.InchesToMeters(item.x), 0.0f, PrairieUtil.InchesToMeters(item.z));
				GameObject newObj = CreateObjFromPrefab(portalPrefab);
				newObj.transform.SetParent(portalsObj.transform, false);
				newObj.transform.position = newPos;
			}
		}

		// now reconstruct paths.
		if (Application.isPlaying)
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

		if (Application.isPlaying)
		{
			PlantSelectionManager.Instance.NotifyFixtureImport();
			WiredPathManager.Instance.NotifyNewLayout();
		}

		PrairiePatternLayer[] patterns = FindObjectsOfType<PrairiePatternLayer>(true);
		foreach (var p in patterns)
		{
			p.NotifyNewLayout();
		}

		PrairieDmxController[] dmxController = GameObject.FindObjectsOfType<PrairieDmxController>();
		if (dmxController != null && dmxController.Length == 1)
		{
			// rebuild the dmx universe map
			dmxController[0].BuildUniverseMap();
		}		
	}
}
