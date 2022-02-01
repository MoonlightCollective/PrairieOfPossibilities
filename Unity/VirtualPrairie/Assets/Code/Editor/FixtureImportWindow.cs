using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using Newtonsoft.Json;


class FixtureData
{
	public string label;
	public string comment;
	public List<FixtureItemData> children;
	public List<FixtureOutputItemData> outputs;
}

class FixtureItemData
{
	public float x;
	public float z;
	public List<string> tags;
}

class FixtureOutputsData
{
	public List<FixtureOutputItemData> items;
}

class FixtureOutputItemData
{
	public string host;
	public int start;
	public int universe;
	public int num;
	public List<FixtureOputputSegmentData> segments;
}

class FixtureOputputSegmentData
{
	public int start;
	public int num;
}

public class FixtureImportWindow : EditorWindow
{
	public GameObject FixturePrefab;
	public TextAsset FixtureFile;

	const int pointsPerFixture = 7;
	const int channelsPerDevice = pointsPerFixture * 3;

	[MenuItem("Window/Prairies/ImportFixture")]
	public static void ShowWindow()
	{
		EditorWindow.GetWindow(typeof(FixtureImportWindow));
	}

	void OnGUI()
	{
		GUILayout.Label("Fixture Prefab");
		FixturePrefab = (GameObject) EditorGUILayout.ObjectField(FixturePrefab, typeof(GameObject), true);

		GUILayout.Space(10);

		GUILayout.Label("Fixture Asset");
		FixtureFile = (TextAsset) EditorGUILayout.ObjectField(FixtureFile, typeof(TextAsset), true);

		GUILayout.Space(10);

		if (GUILayout.Button("Import"))
		{
			doFixtureImport(FixtureFile,FixturePrefab);
		}
	}


	void doFixtureImport(TextAsset fixture, GameObject prefab)
	{
		// convert fixture to string (TODO: load from raw JSON file with LoadResource rather than a TextAsset);
		string fixtureStr = fixture.ToString();

		// built our JSON structures
		Debug.Log("Deserializing JSON");
		var fixtureData = JsonConvert.DeserializeObject<FixtureData>(fixtureStr);
		Debug.Log("Children found: " + fixtureData.children.Count);

		// Create or find the parent object for our plants
		GameObject layoutObj = GameObject.Find("Layout");
		if (layoutObj == null)
		{
			// create new parent object if there is one.
			layoutObj = new GameObject("Layout");
			layoutObj.transform.position = Vector3.zero;
		}

		// Clear existing layout if there is one.
		int count = layoutObj.transform.childCount;
		for (int i = count -1; i >= 0; i--)
		{
			GameObject.DestroyImmediate(layoutObj.transform.GetChild(i).gameObject);
		}

		List<PlantColorManager> allDevices = new List<PlantColorManager>();

		// instantiate and place all fixtures at proper x,y		
		int plantId = 0;
		foreach (var item in fixtureData.children)
		{
			GameObject newObj = PrefabUtility.InstantiatePrefab(FixturePrefab) as GameObject;
			newObj.transform.SetParent(layoutObj.transform, false);
			newObj.transform.position = new Vector3(inchesToMeters(item.x), 0.0f, inchesToMeters(item.z));
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
					setChannelsForRun(seg.start,seg.num,outputItem.universe,universeStartDex, allDevices);
					universeStartDex+=seg.num;
				}
			}
			else
			{
				setChannelsForRun(outputItem.start, outputItem.num, outputItem.universe,0,allDevices);
			}
		}
	}

	public void setChannelsForRun(int startPoint, int runPointCount, int universe, int universePointDexStart, List<PlantColorManager> allDevices)
	{
		Debug.Log($"SetChannelsForRun:sp:{startPoint},rdCnt:{runPointCount},u:{universe},UPDexStar{universePointDexStart}");
		int curChan	 = startPoint;

		// how many fixtures is this?
		if (runPointCount % pointsPerFixture != 0)
		{
			Debug.LogWarning($"Run of length {runPointCount} not a multiple of {pointsPerFixture} - which means it's addressing a partial fixture. Is this intentional?");
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
			
			allDevices[fixtureDex].AssociatePointData(localPointDex,universe,p+universePointDexStart);
		}
	}

	float inchesToMeters(float feet)
	{
		return feet * .3048f / 12.0f;
	}
}
