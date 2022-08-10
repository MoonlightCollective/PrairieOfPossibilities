using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using Newtonsoft.Json;

public class FixtureLayoutExporter : MonoBehaviour
{
	public bool DoFixtureExport(GameObject rootObj, string exportPath)
	{
		FixtureData data = buildExportData(rootObj);
		if (data == null)
			return false;

		string jsonStr = JsonConvert.SerializeObject(data,Formatting.Indented);
		Debug.Log(jsonStr);

		File.WriteAllText(exportPath,jsonStr);
		return true;
	}

	FixtureData buildExportData(GameObject rootObj)
	{
		List<FixtureItemData> items = new List<FixtureItemData>();

		// go through all my children looking for plants
		int itemCount = 0;
		foreach (Transform obj in rootObj.transform)
		{
			PlantColorManager pcm = obj.gameObject.GetComponent<PlantColorManager>();
			if (pcm == null)
			{
				// Debug.LogWarning($"Skipping {obj.gameObject.name} - not a Plant fixture");
				continue; // skip if not a plant.
			}

			if (itemCount != pcm.PlantId)
			{
				Debug.LogWarning($"out of order plant id:{pcm.PlantId} in plant, but is the item dex{itemCount}");
			}

			itemCount++;

			FixtureItemData fid = new FixtureItemData { x = PrairieUtil.MetersToInches(pcm.transform.position.x), z = PrairieUtil.MetersToInches(pcm.transform.position.z) };			
			
			// export tags
			List<string> tagData = new List<string>();
			foreach (PrairieTag t in pcm.FixtureTags)
			{
				tagData.Add(t.Name);
			}
			fid.tags = tagData;
			
			items.Add(fid);
		}


		List<FixtureOutputItemData> outputItems = new List<FixtureOutputItemData>();

		List<WirePathData> wirePathData = buildWirePathExportData();
		List<PortalItemData> portalData = buildPortalExportData();
		List<BoothItemData> boothData = buildBoothExportData();

		FixtureData data = new FixtureData();
		data.label = rootObj.gameObject.name;
		data.comment = "Exported from virtual prairie";
		data.children = items;
		data.outputs = outputItems;
		data.wirePaths = wirePathData;
		data.portals = portalData;
		data.booths = boothData;
		
		return data;
	}

	List<WirePathData> buildWirePathExportData()
	{
		List<WirePathData> dataList = new List<WirePathData>();
		foreach (var path in WiredPathManager.Instance.Paths)
		{
			WirePathData pathData = new WirePathData();
			pathData.artnetHost = path.ArtnetHost;
			pathData.channelStart = path.ChannelStart;
			pathData.pathId = path.PathId;
			pathData.universe = path.Universe;
			List<WirePathItemData> pathItemList = new List<WirePathItemData>();
			foreach (var fixture in path.Fixtures)
			{
				WirePathItemData item = new WirePathItemData();
				item.PathId = fixture.PathIndex;
				item.FixtureId = fixture.FixtureId;
				item.FixtureType = fixture.FixtureType;
				pathItemList.Add(item);
			}
			pathData.items = pathItemList;
			dataList.Add(pathData);
		}
		return dataList;
	}

	List<PortalItemData> buildPortalExportData()
	{
		List<PortalItemData> dataList = new List<PortalItemData>();

		var rootObj = PrairieUtil.GetPortalRoot();
		foreach (Transform child in rootObj.transform)
		{
			Portal p = child.GetComponentInChildren<Portal>();
			if (p != null)
			{
				Vector3 portalPosFt = PrairieUtil.MetersToInches(child.transform.position);
				PortalItemData data = new PortalItemData{x = portalPosFt.x, z = portalPosFt.z,portalId = p.PortalId};
				data.rotation = new RotData(child);
				dataList.Add(data);
			}
			else
			{
				Debug.LogWarning($"Encountered a child in Portal root ({child.gameObject.name}) that doesn't have a portal script - NOT EXPORTED ");
			}
		}

		return dataList;
	}

	List<BoothItemData> buildBoothExportData()
	{
		List<BoothItemData> dataList = new List<BoothItemData>();

		var rootObj = PrairieUtil.GetBoothRoot();
		foreach (Transform child in rootObj.transform)
		{
			Booth booth = child.GetComponentInChildren<Booth>();
			if (booth != null)
			{
				Vector3 boothPosFt = PrairieUtil.MetersToInches(child.transform.position);
				BoothItemData data = new BoothItemData{x = boothPosFt.x, z = boothPosFt.z, boothId = booth.BoothId};
				data.rotation = new RotData(child);
				dataList.Add(data);
			}
			else
			{
				Debug.LogWarning($"Encountered a child in Booth root ({child.gameObject.name}) that doesn't have a booth script - NOT EXPORTED ");
			}
		}

		return dataList;
	}

	public void ExportPathDataCSV(string exportFilePath)
	{
		string HeaderStr = "PathId,Host,Universe,ChannelStart,Fixture0,Fixture1,DistanceFt";
		using (StreamWriter stream = new StreamWriter(exportFilePath) )
		{
			stream.WriteLine(HeaderStr);
			foreach (var path in WiredPathManager.Instance.Paths)
			{
				string host = path.ArtnetHost;
				string channelStart = path.ChannelStart.ToString();
				string pathId = path.PathId;
				string universe = path.Universe.ToString();
				for (int i = 0; i < path.Fixtures.Count-1; i++)
				{
					Vector3 startPos = path.Fixtures[i].transform.position;
					Vector3 endPos = path.Fixtures[i+1].transform.position;
					float distM = Vector3.Distance(endPos,startPos);
					float distFt = PrairieUtil.MetersToFeet(distM);
					stream.WriteLine($"{pathId},{host},{universe},{channelStart},{(path.Fixtures[i].FixtureId).ToString()},{(path.Fixtures[i+1].FixtureId).ToString()},{distFt.ToString()}");
				}
				stream.Flush();
			}
			stream.Flush();
		}
	}

	public void ExportBaseDataCSV(string exportFilePath)
	{
		var rootObj = PrairieUtil.GetLayoutRoot();
		string HeaderStr = "BaseId,x,z,DistFromCtr,Theta,ChannelStart,PathId";
		using (StreamWriter stream = new StreamWriter(exportFilePath) )
		{
			stream.WriteLine(HeaderStr);

			foreach (Transform obj in rootObj.transform)
			{
				Vector3 origin = new Vector3(0, 0, 0);
				Vector3 zAxis = new Vector3(0, 0, 1);

				PlantColorManager pcm = obj.gameObject.GetComponent<PlantColorManager>();
				if (pcm == null)
				{
					// Debug.LogWarning($"Skipping {obj.gameObject.name} - not a Plant fixture");
					continue; // skip if not a plant.
				}
				float distM = Vector3.Distance(pcm.transform.position, origin);
				float distFt = PrairieUtil.MetersToInches(distM);
				float theta = Vector3.Angle(zAxis, pcm.transform.position);
				float x = PrairieUtil.MetersToInches(pcm.transform.position.x);
				float z = PrairieUtil.MetersToInches(pcm.transform.position.z);
				stream.WriteLine($"{pcm.PlantId},{x.ToString()},{z.ToString()},{distFt.ToString()},{theta.ToString()},{pcm.ChannelStart.ToString()},{pcm.PathId}");
			}
			stream.Flush();
		}
	}

}
