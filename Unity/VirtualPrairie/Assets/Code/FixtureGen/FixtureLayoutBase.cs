using System.Collections;
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

	protected int _lastFixtureId = 0;

	public abstract void SaveSettings();
	public abstract void LoadSettings();

	public virtual bool GenerateLayout(GameObject rootObj, GameObject fixturePrefab)
	{
		ClearChildrenFrom(rootObj);
		_curUniverse = UniverseStart;
		_lastFixtureId = 0;
		return true;
	}

	protected void ClearChildrenFrom(GameObject rootObj)
	{
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

	protected bool AddFixture(Vector3 newPosFt, GameObject rootObj, GameObject prefabObj)
    {
		// don't add if this is too close to an existing base
		// currently using "2 meters" as the threshold
		// TODO: make this spacing more dynamic
		Vector3 newPosM = new Vector3(PrairieUtil.FeetToMeters(newPosFt.x), 0.0f, PrairieUtil.FeetToMeters(newPosFt.z));

		int count = rootObj.transform.childCount;
		for (int i=0; i < count; i++)
        {
			var fixture = rootObj.transform.GetChild(i).gameObject;
			Vector3 pos = fixture.transform.position;
			if (Vector3.Distance(pos, newPosM) < 1.5f)
			{
				// Debug.LogWarning("Skipping fixture add "+ _lastFixtureId);
				return false;
			}
        }

		if (_curChannel + _channelsPerFixture >= _channelsPerUniverse)
		{
			_curUniverse++;
			_curChannel = 0;
		}

		GameObject newObj = CreateObjFromPrefab(prefabObj);
		newObj.transform.SetParent(rootObj.transform, false);

		PlantColorManager pcm = newObj.GetComponentInChildren<PlantColorManager>();
		if (pcm != null)
		{
			pcm.PlantId = _lastFixtureId++;
			if (pcm.transform.GetSiblingIndex() != pcm.PlantId)
			{
				Debug.LogWarning($"ID/Sibling mismatch {pcm.PlantId} {transform.GetSiblingIndex()}");
			}
		}
		else
		{
			Debug.LogWarning($"Not a plant: {newObj.gameObject.name}, {_lastFixtureId}");
		}


		// Debug.Log($"{newPosFt.x}, {newPosFt.z}");
		newObj.transform.position = newPosM;
		_curChannel += _channelsPerFixture;
		return true;
	}
}