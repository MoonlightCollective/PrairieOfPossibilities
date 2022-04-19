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
		FixtureData data = new FixtureData();
		data.label = rootObj.gameObject.name;
		data.comment = "Exported from virtual prairie";
		data.children = items;
		data.outputs = outputItems;
		return data;
	}
}
