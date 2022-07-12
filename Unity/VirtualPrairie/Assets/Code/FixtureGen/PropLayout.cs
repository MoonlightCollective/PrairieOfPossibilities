using System.Collections;
using UnityEngine;
using UnityEditor;

public class PropLayout : MonoBehaviour
{
	[Header("Portal Params")]
	public int NumPortals = 4;

	public bool GenerateLayout(GameObject portalPrefab, GameObject boothPrefab)
	{
		GameObject portalRoot = PrairieUtil.GetPortalRoot();
		PrairieUtil.ClearChildrenFrom(portalRoot);
		GameObject BoothRoot = PrairieUtil.GetBoothRoot();
		PrairieUtil.ClearChildrenFrom(BoothRoot);
		
		GameObject layoutRoot = PrairieUtil.GetLayoutRoot();

		for (int j = 0; j < 4; j++)
		{
			// experiment with finding the closest plant to the desired portal location, then replacing that plant with a portal
			Vector3 newPortal = PrairieUtil.GetLayoutGen().Clearings[j];
			Vector3 newPortalM = new Vector3(PrairieUtil.FeetToMeters(newPortal.x), 0.0f, PrairieUtil.FeetToMeters(newPortal.z));
			GameObject locPlant = FindClosestObject(layoutRoot, newPortalM);
			Vector3 plantLoc = locPlant.transform.position;
			GameObject.DestroyImmediate(locPlant);

			GameObject newObj = CreateObjFromPrefab(portalPrefab);
			newObj.transform.SetParent(portalRoot.transform, false);
			Portal p = newObj.GetComponentInChildren<Portal>();
			p.PortalId = $"Portal{j}";
			//newObj.transform.position = new Vector3(PrairieUtil.FeetToMeters(newPortal.x), 0.0f, PrairieUtil.FeetToMeters(newPortal.z));
			newObj.transform.position = plantLoc;

			float rotAngle = 90 + (180 * Mathf.Atan2(newPortal.x, newPortal.z) / Mathf.PI);
			newObj.transform.Rotate (0, rotAngle, 0);
		} 
		for (int j = 0; j < 2; j++)
		{
			Vector3 newBooth = PrairieUtil.GetLayoutGen().Clearings[j+4];
			GameObject newObj = CreateObjFromPrefab(boothPrefab);
			Booth b = newObj.GetComponentInChildren<Booth>();
			b.BoothId = $"Booth{j}";
			newObj.transform.SetParent(BoothRoot.transform, false);
			newObj.transform.position = new Vector3(PrairieUtil.FeetToMeters(newBooth.x), 0.0f, PrairieUtil.FeetToMeters(newBooth.z));
		}
		return true;
	}

	protected GameObject FindClosestObject(GameObject rootObj, Vector3 pos)
    {
		int count = rootObj.transform.childCount;
		float minDist = 10000;
		GameObject nearestObj = null;

		for (int i = 0; i < count; i++)
        {
			float dist = Vector3.Distance(pos, rootObj.transform.GetChild(i).gameObject.transform.position);
			if (dist < minDist)
            {
				minDist = dist;
				nearestObj = rootObj.transform.GetChild(i).gameObject;
			}
		}
		return nearestObj;
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