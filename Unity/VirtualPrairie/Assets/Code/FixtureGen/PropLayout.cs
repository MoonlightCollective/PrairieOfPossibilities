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

		// float portals_distance = PrairieUtil.GetLayoutGen().MaxDistFromOrigin; // portal distance from center, in meters
		float portals_distance = PrairieUtil.FeetToMeters(105.0f); // portal distance from center, in meters

		float portals_angle = 0;
		float angle_offset = Mathf.PI / 2; // 90 degrees

		for (int j = 0; j < 4; j++)
		{
			Vector3 newPortal = new Vector3(portals_distance * Mathf.Cos(portals_angle), 0, portals_distance * Mathf.Sin(portals_angle));
			portals_angle += angle_offset;

			// REPLACED FOR 2023
			// experiment with finding the closest plant to the desired portal location, then replacing that plant with a portal
			// GameObject locPlant = FindClosestObject(layoutRoot, newPortalM);
			// Vector3 plantLoc = locPlant.transform.position;
			// GameObject.DestroyImmediate(locPlant);		// DON'T REMOVE ANYMORE

			GameObject newObj = CreateObjFromPrefab(portalPrefab);
			newObj.transform.SetParent(portalRoot.transform, false);
			Portal p = newObj.GetComponentInChildren<Portal>();
			p.PortalId = $"Portal{j}";
			newObj.transform.position = new Vector3(newPortal.x, 0.0f, newPortal.z);
			//newObj.transform.position = plantLoc;

			float rotAngle = 90 + (180 * Mathf.Atan2(newPortal.x, newPortal.z) / Mathf.PI);
			newObj.transform.Rotate (0, rotAngle, 0);
		}

		float booth_distance = PrairieUtil.FeetToMeters(130); // phone booth distance from center
		float booth_angle = Mathf.PI * 3 / 4; // 45 degrees

		for (int j = 0; j < 2; j++)
		{
			Vector3 newBooth = new Vector3(booth_distance * Mathf.Cos(booth_angle), 0, booth_distance * Mathf.Sin(booth_angle));
			GameObject newObj = CreateObjFromPrefab(boothPrefab);
			Booth b = newObj.GetComponentInChildren<Booth>();
			b.BoothId = $"Booth{j}";
			newObj.transform.SetParent(BoothRoot.transform, false);
			newObj.transform.position = new Vector3(newBooth.x, 0.0f, newBooth.z);
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