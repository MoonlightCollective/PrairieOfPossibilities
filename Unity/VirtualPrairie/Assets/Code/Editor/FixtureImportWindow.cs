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
}

class FixtureItemData
{
	public float x;
	public float z;
	public List<string> tags;
}

public class FixtureImportWindow : EditorWindow
{
	public GameObject FixturePrefab;
	public TextAsset FixtureFile;

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
		string fixtureStr = fixture.ToString();

		Debug.Log("Deserializing JSON");
		var fixtureData = JsonConvert.DeserializeObject<FixtureData>(fixtureStr);
		
		Debug.Log("Children found: " + fixtureData.children.Count);

		GameObject layoutObj = GameObject.Find("Layout");
		if (layoutObj == null)
		{
			layoutObj = new GameObject("Layout");
			layoutObj.transform.position = Vector3.zero;
		}

		int count = layoutObj.transform.childCount;
		for (int i = count -1; i >= 0; i--)
		{
			GameObject.DestroyImmediate(layoutObj.transform.GetChild(i).gameObject);
		}

		foreach (var item in fixtureData.children)
		{
			GameObject newObj = GameObject.Instantiate(FixturePrefab);
			newObj.transform.SetParent(layoutObj.transform, false);
			newObj.transform.position = new Vector3(feetToMeters(item.x), 0.0f, feetToMeters(item.z));
		}
	}

	float feetToMeters(float feet)
	{
		return feet * .3048f / 12.0f;
	}
}
