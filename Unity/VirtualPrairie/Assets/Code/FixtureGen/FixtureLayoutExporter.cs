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
		foreach (Transform obj in rootObj.transform)
		{
			PlantColorManager pcm = obj.gameObject.GetComponent<PlantColorManager>();
			if (pcm == null)
				continue; // skip if not a plant.
			
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
}
