using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using static TMPro.SpriteAssetUtilities.TexturePacker_JsonArray;
using static UnityEngine.GraphicsBuffer;

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

	protected int _lastFixtureId = 0;

	public abstract void SaveSettings();
	public abstract void LoadSettings();

	public virtual bool GenerateLayout(GameObject rootObj, GameObject fixturePrefab, GameObject portalPrefab = null, GameObject boothPrefab = null)
	{
		// clear out existing plants, wires, and props
		GlobalPlantSettings.FindGlobalInstance();
		ClearChildrenFrom(rootObj);

		WiredPathManager pathManager = WiredPathManager.Instance;
		pathManager.ClearAllPaths();

		_curUniverse = UniverseStart;
		_curChannel = 0;
		_lastFixtureId = 0;
		return true;
	}

	public void ClearChildrenFrom(GameObject rootObj)
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


        // we need to orient the base so it's oriented toward the center
        // figure out degree of rotation around Y axis
        float azimuth = Mathf.Atan2(newPos.x, newPos.z) * Mathf.Rad2Deg;	// in degrees -- between -180 and 180
        float newRot = 90.0f + azimuth;

        GameObject newObj = CreateObjFromPrefab(prefabObj);
		newObj.transform.SetParent(parentObj.transform, false);
		newObj.transform.position = newPos;
		newObj.transform.Rotate(0, newRot, 0);

		// Debug.Log($"{newPosFt.x}, {newPosFt.z}");

		PlantColorManager pcm = newObj.GetComponentInChildren<PlantColorManager>();
		if (pcm != null)
		{
			pcm.PlantId = _lastFixtureId++;
			if (pcm.transform.GetSiblingIndex() != pcm.PlantId)
			{
				Debug.LogWarning($"ID/Sibling mismatch {pcm.PlantId} {transform.GetSiblingIndex()}");
			}
			pcm.PointRangeMin = pcm.PlantId * PrairieDmxController.PointsPerFixture;
			pcm.PointRangeMax = pcm.PointRangeMin + PrairieDmxController.PointsPerFixture;

			// set arm tag based on new position -- only needed if not set in fixtures file
//			int armID = (int)((azimuth + 180.0f) / 10.0f) + 1;
//			string armTag = "CWArm" + armID;
//			pcm.AddFixtureTag(armTag);
//			armTag = "CCWArm" + armID;
//			pcm.AddFixtureTag(armTag);
		}
		else
		{
			Debug.LogWarning($"Not a plant: {newObj.gameObject.name}, {_lastFixtureId}");
		}

		// support creating plants at runtime, assining universes as we see them.  import files will optionally overwrite these at the end
		if (_curChannel + PrairieDmxController.ChannelsPerFixture >= PrairieDmxController.ChannelsPerUniverse)
		{
			_curUniverse++;
			_curChannel = 0;
		}
		_curChannel += PrairieDmxController.ChannelsPerFixture;

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