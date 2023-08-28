using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using Newtonsoft.Json;

public class FixtureLayoutImport : FixtureLayoutBase
{
	[Header("Import")]
	public string JsonFilePath;

	public override bool GenerateLayout(GameObject rootObj, GameObject fixturePrefab, GameObject portalPrefab = null, GameObject boothPrefab = null)
	{
		GlobalPlantSettings.FindGlobalInstance();
		base.GenerateLayout(rootObj, fixturePrefab, portalPrefab, boothPrefab);

		if (!string.IsNullOrEmpty(JsonFilePath))
		{
			Debug.Log($"FixtureLayoutImport:GenerateLayout- importing file '{JsonFilePath}'");

#if UNITY_ANDROID && !UNITY_EDITOR
			// on android, use UnityWebRequest
			UnityEngine.Networking.UnityWebRequest www = UnityEngine.Networking.UnityWebRequest.Get(JsonFilePath);
			www.SendWebRequest();
			while (!www.downloadHandler.isDone)
			{
			}
			string jsonStr = www.downloadHandler.text;
#else
			if (!File.Exists(JsonFilePath))
			{
				Debug.LogError($"Unable to find file: {JsonFilePath} - doesn't exist!");
				return false;
			}
			string jsonStr = File.ReadAllText(JsonFilePath);
#endif
			if (!string.IsNullOrEmpty(jsonStr))
			{
				doFixtureImport(rootObj, jsonStr, fixturePrefab, portalPrefab, boothPrefab);
				return true;
			}
            else
            {
				Debug.LogError($"Unable to load file: {JsonFilePath}");
				return false;
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


	void doFixtureImport(GameObject rootObj, string fixtureStr, GameObject prefab, GameObject portalPrefab, GameObject boothPrefab)
	{
		// built our JSON structures
		var fixtureData = JsonConvert.DeserializeObject<FixtureData>(fixtureStr);
		Debug.Log($"FixtureLayoutImport:GenerateLayout - fixtures: {fixtureData.children.Count} wire paths: {fixtureData.wirePaths.Count}");

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
			var pcm = newObj.GetComponentInChildren<PlantColorManager>();
			if (pcm != null)
			{
				allDevices.Add(pcm);
			}

			// apply tags from fixture data.
			if (item.tags != null)
				pcm.AddFixtureTags(item.tags);
		}

		// now place all the portals.  we will place the portal under the "portals" root obj for now
		GameObject portalsObj = PrairieUtil.GetPortalRoot();
		PrairieUtil.ClearChildrenFrom(portalsObj);
		if (portalsObj != null && portalPrefab != null && fixtureData.portals != null)
		{
			Debug.Log($"FixtureLayoutImport:Adding Portals.Count={fixtureData.portals.Count}");
			foreach (var item in fixtureData.portals)
			{
				// create the portal !
				var newPos = new Vector3(PrairieUtil.InchesToMeters(item.x), 0.0f, PrairieUtil.InchesToMeters(item.z));
				GameObject newObj = CreateObjFromPrefab(portalPrefab);
				newObj.transform.SetParent(portalsObj.transform, false);
				newObj.transform.position = newPos;
				newObj.transform.localRotation = item.rotation.QuaternionFromRot();
				Portal p = newObj.GetComponentInChildren<Portal>();
				p.PortalId = item.portalId;
			}
		}

		GameObject boothRoot = PrairieUtil.GetBoothRoot();
		PrairieUtil.ClearChildrenFrom(boothRoot);
		if (boothRoot != null && boothPrefab != null && fixtureData.booths != null)
		{
			Debug.Log($"FixtureLayoutImport:Adding Booths.Count={fixtureData.booths.Count}");
			foreach (var item in fixtureData.booths)
			{
				// create the portal !
				var newPos = new Vector3(PrairieUtil.InchesToMeters(item.x), 0.0f, PrairieUtil.InchesToMeters(item.z));
				GameObject newObj = CreateObjFromPrefab(boothPrefab);
				newObj.transform.SetParent(boothRoot.transform, false);
				newObj.transform.position = newPos;
				newObj.transform.localRotation = item.rotation.QuaternionFromRot();
				Booth b = newObj.GetComponentInChildren<Booth>();
				b.BoothId = item.boothId;
			}
		}

		// now reconstruct paths.
		if (Application.isPlaying)
		{
			WiredPathManager pathManager = WiredPathManager.Instance;
			pathManager.ClearAllPaths();
			if (fixtureData.wirePaths == null)
			{
				Debug.Log("No wire paths in fixture data");
			}
			else
			{
				Debug.Log($"FixtureLayoutImport:Adding paths.Count={fixtureData.wirePaths.Count}");

				int AutoChannelStart = 1;
				
				foreach (var pathData in fixtureData.wirePaths)
				{
					WiredPath newPath = WiredPathManager.NewPathInstance();
					newPath.ArtnetHost = pathData.artnetHost;
					newPath.Universe = pathData.universe;
					newPath.ChannelStart = pathData.channelStart;
					newPath.Generator = pathData.generator; // TODO: handle old jsons without generator info
					if (newPath.ChannelStart > 0)
					{
						// that path has a channel start !  use this channel as our new auto channel start to keep things running.
						Debug.Log($"FixtureLayoutImport: path has a channel start, using that as the new auto channel start ({newPath.ChannelStart})");
						AutoChannelStart = newPath.ChannelStart;
					}
					else 
					{
						// otherwise, keep trucking with our auto run logic
						Debug.Log($"FixtureLayoutImport: path doesnt have a channel start, using auto channel start ({AutoChannelStart})");
						newPath.ChannelStart = AutoChannelStart;
					}
					newPath.PathId = pathData.pathId;
					Debug.Log($"Adding path.  PathId:({newPath.PathId}) IP:({newPath.ArtnetHost}) Universe:({newPath.Universe}) ChannelStart:({newPath.ChannelStart})");

					foreach (var pathDataItem in pathData.items)
					{
						if (pathDataItem.FixtureType == "PlantFixture")
						{
							if (pathDataItem.FixtureId < allDevices.Count)
							{
								WiredFixtureBase wfb = allDevices[pathDataItem.FixtureId];
								// note: the channel override does not reset the run (but this run still skips this slot)
								newPath.AddFixture(wfb, pathDataItem.ChannelStartOverride);
								// update the auto counters
								AutoChannelStart += PrairieDmxController.ChannelsPerFixture;
								// does this new auto start have enough space for an entire fixture?
								if (AutoChannelStart > PrairieDmxController.MaxChannelStartPerUniverse)
								{
									// roll over
									Debug.Log($"FixtureLayoutImport: rolling over the auto start channel to 1");
									AutoChannelStart = 1;
								}
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
		}

		if (Application.isPlaying)
        {
			PlantSelectionManager.Instance.NotifyFixtureImport();
			WiredPathManager.Instance.NotifyNewLayout();
			PrairieTagManager.Instance.NotifyNewLayout();
		}

		PrairiePatternLayer[] patterns = FindObjectsOfType<PrairiePatternLayer>(true);
		foreach (var p in patterns)
		{
			p.NotifyNewLayout();
		}

		PrairieLayerGroup[] groups = FindObjectsOfType<PrairieLayerGroup>(true);
		foreach(var g in groups)
		{
			g.NotifyNewLayout();
		}

		PrairieDmxController[] dmxController = GameObject.FindObjectsOfType<PrairieDmxController>();
		if (dmxController != null && dmxController.Length == 1)
		{
			// rebuild the dmx universe map
			Debug.Log($"Rebuilding DMX Universe Map");
			dmxController[0].BuildUniverseMap();
		}		
	}
}
