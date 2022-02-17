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

	public abstract void SaveSettings();
	public abstract void LoadSettings();

	public virtual bool GenerateLayout(GameObject rootObj, GameObject fixturePrefab)
	{
		ClearChildrenFrom(rootObj);
		_curUniverse = UniverseStart;
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

}