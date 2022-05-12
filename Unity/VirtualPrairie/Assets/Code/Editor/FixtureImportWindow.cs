using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using Newtonsoft.Json;



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

		if (GUILayout.Button("Import Text Asset"))
		{
			doImportAsset();
		}

		if (GUILayout.Button("Import File..."))
		{
			doImportFile();
		}

		GUILayout.Space(10);

		if (GUILayout.Button("Generate"))
		{
			doGenerateButton();
		}
	}

	void doGenerateButton()
	{
		FixtureLayoutGen gen = GameObject.FindObjectOfType<FixtureLayoutGen>();
		if (gen == null)
		{
			return;
		}

		gen.GenerateLayout(PrairieUtil.GetLayoutRoot());
	}

	void doImportFile()
	{
		var layoutSettings = GameObject.FindObjectOfType<UILayoutSettingsController>();
		if (layoutSettings != null)
		{
			layoutSettings.OnImportButton();
		}
	}

	void doImportAsset()
	{
		FixtureLayoutGen gen = GameObject.FindObjectOfType<FixtureLayoutGen>();
		if (gen == null)
		{
			return;
		}

		gen.DoImportLayout(PrairieUtil.GetLayoutRoot(),AssetDatabase.GetAssetPath(FixtureFile),true);
	}

}
