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

			FixtureItemData fid = new FixtureItemData { x = PrairieUtil.MetersToFeet(pcm.transform.position.x) * 12f, z = PrairieUtil.MetersToFeet(pcm.transform.position.z) * 12f };			
			items.Add(fid);
		}


		List<FixtureOutputItemData> outputItems = new List<FixtureOutputItemData>();

		List<WirePathData> wirePathData = buildWirePathExportData();

		FixtureData data = new FixtureData();
		data.label = rootObj.gameObject.name;
		data.comment = "Exported from virtual prairie";
		data.children = items;
		data.outputs = outputItems;
		data.wirePaths = wirePathData;

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

	public void ExportPathDataCSV(string exportFilePath)
	{
		string HeaderStr = "PathId,Host,Universe,ChannelStart,Fixture0,Fixture1,DistanceM,DistanceFt";
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
					stream.WriteLine($"{pathId},{host},{universe},{channelStart},{(path.Fixtures[i].FixtureId).ToString()},{(path.Fixtures[i+1].FixtureId).ToString()},{distM.ToString()},{distFt.ToString()}");
				}
				stream.Flush();
			}
			stream.Flush();
		}
	}
}
