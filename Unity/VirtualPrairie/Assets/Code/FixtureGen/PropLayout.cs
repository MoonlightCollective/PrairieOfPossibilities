using System.Collections;
using UnityEngine;
using UnityEditor;

public class PropLayout : MonoBehaviour
{
	[Header("Portal Params")]
	public int NumPortals = 4;

	public bool GenerateLayout(GameObject rootObj, GameObject portalPrefab, GameObject boothPrefab)
	{
		// don't clear rootObj -- we're adding props to existing layout
		// ClearChildrenFrom(rootObj);

		for (int j = 0; j < 4; j++)
		{
			Vector3 newPortal = PrairieUtil.GetLayoutGen().Clearings[j];
			GameObject newObj = CreateObjFromPrefab(portalPrefab);
			newObj.transform.SetParent(rootObj.transform, false);
			newObj.transform.position = new Vector3(PrairieUtil.FeetToMeters(newPortal.x), 0.0f, PrairieUtil.FeetToMeters(newPortal.z));

			float rotAngle = 90 + (180 * Mathf.Atan2(newPortal.x, newPortal.z) / Mathf.PI);
			newObj.transform.Rotate (0, rotAngle, 0);
		} 
		for (int j = 4; j < 6; j++)
		{
			Vector3 newBooth = PrairieUtil.GetLayoutGen().Clearings[j];
			GameObject newObj = CreateObjFromPrefab(boothPrefab);
			newObj.transform.SetParent(rootObj.transform, false);
			newObj.transform.position = new Vector3(PrairieUtil.FeetToMeters(newBooth.x), 0.0f, PrairieUtil.FeetToMeters(newBooth.z));
		}
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