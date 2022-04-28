using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public abstract class FixtureLayoutBase : MonoBehaviour
{
	[Header("Base Params")]
	public int NumFixtures = 20;
	public float BaseSpacingFt = 8;

	[Header("Output Params")]
	public string BaseIP;
	public int UniverseStart;

	protected int _curUniverse;
	protected int _curChannel;
	public static int kChannelsPerPoint = 3;
	public static int kPointsPerFixture = 7;
	protected static int _channelsPerUniverse = 512;
	protected static int _channelsPerFixture = kPointsPerFixture * kChannelsPerPoint;

	public abstract void SaveSettings();
	public abstract void LoadSettings();

	public virtual bool GenerateLayout(GameObject rootObj, GameObject fixturePrefab)
	{
		GlobalPlantSettings.FindGlobalInstance();
		ClearChildrenFrom(rootObj);
		_curUniverse = UniverseStart;
		_curChannel = 0;
		return true;
	}

	protected void ClearChildrenFrom(GameObject rootObj)
	{
		PrairieUtil.Points = null;
		// Clear existing layout if there is one.
		int count = rootObj.transform.childCount;
		for (int i = count -1; i >= 0; i--)
		{
			GameObject.DestroyImmediate(rootObj.transform.GetChild(i).gameObject);
		}
	}

	protected GameObject CreateObjFromPrefab(GameObject prefabObj)
	{
		GameObject obj;
		#if UNITY_EDITOR
			if (EditorApplication.isPlaying)
				obj = PrefabUtility.InstantiatePrefab(prefabObj) as GameObject;
			else
				obj = GameObject.Instantiate(prefabObj) as GameObject;
		#else
				obj = GameObject.Instantiate(prefabObj) as GameObject;
		#endif

		return obj;
	}

	// creates and adds a plant to the scene graph.  note: a fixture is a plant
	// will return null if its too close to another one.  ignores this rule for fromImportFile = true
	protected GameObject AddFixture(Vector3 newPos, GameObject parentObj, GameObject prefabObj, bool fromImportFile = false)
    {
		Debug.Log($"FixtureLayoutBase:AddFixture");

		if (!fromImportFile) 
		{
			// don't add if this is too close to an existing base
			// currently using "2 meters" as the threshold
			// TODO: make this spacing more dynamic
			int count = parentObj.transform.childCount;
			for (int i=0; i < count; i++)
			{
				var fixture = parentObj.transform.GetChild(i).gameObject;
				Vector3 pos = fixture.transform.position;
				if (Vector3.Distance(pos, newPos) < 1.5f)
					return null;
			}
		}

		GameObject newObj = CreateObjFromPrefab(prefabObj);
		newObj.transform.SetParent(parentObj.transform, false);
		newObj.transform.position = newPos;
		// Debug.Log($"{newPosFt.x}, {newPosFt.z}");

		PlantColorManager pcm = newObj.GetComponent<PlantColorManager>();
		pcm.PlantId = parentObj.transform.childCount - 1;

		// add this to the global plant list
		GlobalPlantSettings.Instance.AddFixture(newObj);

		// support creating plants at runtime, assining universes as we see them.  import files will optionally overwrite these at the end
		if (_curChannel + _channelsPerFixture >= _channelsPerUniverse)
		{
			_curUniverse++;
			_curChannel = 0;
		}
		_curChannel += _channelsPerFixture;

		for (int i = 0; i < kPointsPerFixture; ++i)
		{
			pcm.AssociatePointData(i, null, _curUniverse, pcm.PointRangeMin + i);
		}

		// ray cast down and place it on the "ground".  this supports the maps we have with terrain (hills)
		Vector3 castStart = newObj.transform.position + Vector3.up * 40.0f;
		RaycastHit hit;
		if (Physics.Raycast(castStart, Vector3.down, out hit, 40f, LayerMask.GetMask("Ground"), QueryTriggerInteraction.Ignore))
		{
			newObj.transform.position = hit.point;
		}

		return newObj;
	}
}