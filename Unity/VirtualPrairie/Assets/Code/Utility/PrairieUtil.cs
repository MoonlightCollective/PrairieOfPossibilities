using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;

public class PrairieUtil
{
	static string s_lastExportPath = "";
	static bool _debugEvents = false;

	public enum AxisEnum 
	{ 
		Y, 
		Z
	};

	public static float InchesToMeters(float inches)
	{
		return inches * .0254f;
	}
	
	public static float MetersToInches(float meters)
	{
		return meters * 39.3701f;
	}

	public static float FeetToMeters(float feet)
	{
		return .3048f * feet;
	}

	public static float MetersToFeet(float meters)
	{
		return 3.28084f * meters;
	}

	public static Vector3 MetersToFeet(Vector3 meters)
	{
		return 3.28084f * meters;
	}

	public static Vector3 FeetToMeters(Vector3 feet)
	{
		return .3048f * feet;
	}

	public static Vector3 MetersToInches(Vector3 meters)
	{
		return meters * 39.3701f;
	}

	public static string lastExportPath
	{
		get 
		{
			if (string.IsNullOrEmpty(s_lastExportPath))
			{
				s_lastExportPath = PlayerPrefs.GetString("LastExportPath","");
			}
			return s_lastExportPath;
		}
	}

	public static bool AnyInputActive()
    {
		GameObject curSelection = EventSystem.current.currentSelectedGameObject;
		if (curSelection != null)
        {
			var tmpif = curSelection.GetComponent<TMP_InputField>();
			if (tmpif != null)
				return true;

            var inF = EventSystem.current.currentSelectedGameObject.GetComponent<UnityEngine.UI.InputField>();
            if (inF != null)
                return true;

        }
        return false;
    }

	public static GameObject GetLayoutRoot()
	{
		return GetNamedRootObject("Layout");
	}

	public static GameObject GetPortalRoot()
	{
		return GetNamedRootObject("Portals");
	}

	public static GameObject GetBoothRoot()
	{
		return GetNamedRootObject("Booths");
	}

	public static GameObject GetNamedRootObject(string name)
	{
		#if UNITY_EDITOR
		if (!Application.isPlaying && UnityEditor.Selection.activeGameObject != null)
		{
			if (UnityEditor.Selection.activeGameObject.name == name)
			{
				return UnityEditor.Selection.activeGameObject;
			}
		}
		#endif

		// Create or find the parent object for our plants
		GameObject rootObjg = GameObject.Find(name);
		if (rootObjg == null)
		{
			// create new parent object if there is one.
			rootObjg = new GameObject(name);
			rootObjg.transform.position = Vector3.zero;
		}

		return rootObjg;
	}


	public static PrairieWalkCam GetCamera()
	{
		return (GameObject.FindObjectOfType<PrairieWalkCam>());
	}

	public static FixtureLayoutGen GetLayoutGen()
    {
		return (GameObject.FindObjectOfType<FixtureLayoutGen>());
    }

	public static PrairieDmxController GetPrairieDmxController()
	{
		return (GameObject.FindObjectOfType<PrairieDmxController>());
	}

	public static void ClearChildrenFrom(GameObject rootObj)
	{
		// Clear existing layout if there is one.
		int count = rootObj.transform.childCount;
		for (int i = count -1; i >= 0; i--)
		{
			GameObject.Destroy(rootObj.transform.GetChild(i).gameObject);
		}
		rootObj.transform.DetachChildren();
	}

	public static float wrapdistf(float v1, float v2, float modulus)
	{
		if (v1 < v2) {
			return Mathf.Min(v2 - v1, v1 + modulus - v2);
		} else {
			return Mathf.Min(v1 - v2, v2 + modulus - v1);
		}		
	}

	// LXStudio had a continous array of   that effects could use.   Simluate that here
	private static List<StemColorManager> s_points;
	public static List<StemColorManager> Points 
	{ 
		get
		{ 
			if (s_points == null)
			{
				// do this once
				Debug.Log($"PrairieUtil:Points populating the static list");
				s_points = new List<StemColorManager>();
				var root = PrairieUtil.GetLayoutRoot();
				int count = root.transform.childCount;
				for (int i=0; i < count; i++)
				{
					var fixture = root.transform.GetChild(i).gameObject;
					PlantColorManager pcm = fixture.GetComponent<PlantColorManager>();
					foreach (var stem in pcm.StemColors)
					{
						Points.Add(stem);
					}
				}
				Debug.Log($"PrairieUtil:added {Points.Count} points");
			}
			return s_points;
		}
		set
		{
			// only allow this to be used to reset it
			if (value == null)
			{
				if (s_points != null)
					s_points.Clear();
				s_points = value;
			}
		}
	}

	public static void EventDebug(string debugStr)
	{
		if (_debugEvents)
			Debug.Log($"Event: {debugStr}");
	}

	public static Vector2 PolarToCartesianRad(float r, float thetaRad)
	{
		return new Vector2(r * Mathf.Cos(thetaRad), r * Mathf.Sin(thetaRad));
	}

	public static Vector2 PolarToCartesianNorm(float r, float thetaNorm)
	{
		return PolarToCartesianRad(r, thetaNorm * 2f * Mathf.PI);
	}

	public static Vector2 PolarToCartesianDeg(float r, float thetaDeg)
	{
		return PolarToCartesianRad(r, thetaDeg * Mathf.Deg2Rad);
	}

	public static Vector3 XZVector3(Vector2 XYVect,float yVal = 0)
	{
		return new Vector3(XYVect.x,yVal,XYVect.y);
	}

	public static Vector3 XZVector2(Vector3 XYZVect)
	{
		return new Vector3(XYZVect.x,XYZVect.z);
	}
	
	public static void CartesianToPolar(Vector2 inXZVect, out float radius, out float theta)
	{
		float x = inXZVect.x;
		float z = inXZVect.y;
		CartesianToPolar(x,z,out radius, out theta);
	}

	public static void CartesianToPolarNorm(Vector2 inXZVect, out float radius, out float theta)
	{
		float x = inXZVect.x;
		float z = inXZVect.y;
		CartesianToPolarNorm(x,z,out radius, out theta);
	}

	public static void CartesianToPolar(float inX, float inZ, out float radius, out float theta)
	{
		radius = Mathf.Sqrt(inX * inX + inZ * inZ);
		theta = Mathf.Atan2(inZ,inX);
	}

	public static void CartesianToPolarNorm(float inX, float inZ, out float radius, out float theta)
	{
		radius = Mathf.Sqrt(inX * inX + inZ * inZ);
		theta = Mathf.Atan2(inZ,inX) / (2 * Mathf.PI);
	}

	public static bool CheckFieldsAgainstFilter(Dictionary<string,object> fields, List<TopicFilterEntry> filters)
	{
		if (filters == null || filters.Count < 1)
			return true;
		
		if (fields == null)
			return false;

		foreach (var filter in filters)
		{
			if (!fields.ContainsKey(filter.FieldName))
			{
				// reject - we don't have the field in our json payload.
				return false;
			}
			
			// we have the field, is it the right value?
			if ((string) fields[filter.FieldName] != filter.FieldValue)
			{
				// reject - wrong value!
				return false;
			}
		}

		// if we get here, nothing is telling us no.
		return true;		
	}
}
