using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;

public class PrairieUtil
{
	static string s_lastExportPath = "";
	
	public static float InchesToMeters(float inches)
	{
		return inches * .0254f;
	}

	public static float FeetToMeters(float feet)
	{
		return .3048f * feet;
	}

	public static float MetersToFeet(float meters)
	{
		return 3.28084f * meters;
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
		// Create or find the parent object for our plants
		GameObject layoutObj = GameObject.Find("Layout");
		if (layoutObj == null)
		{
			// create new parent object if there is one.
			layoutObj = new GameObject("Layout");
			layoutObj.transform.position = Vector3.zero;
		}

		return layoutObj;
	}

	public static PrairieWalkCam GetCamera()
	{
		return (GameObject.FindObjectOfType<PrairieWalkCam>());
	}

	public static FixtureLayoutGen GetLayoutGen()
    {
		return (GameObject.FindObjectOfType<FixtureLayoutGen>());
    }

	public static float wrapdistf(float v1, float v2, float modulus)
	{
		if (v1 < v2) {
			return Mathf.Min(v2 - v1, v1 + modulus - v2);
		} else {
			return Mathf.Min(v1 - v2, v2 + modulus - v1);
		}		
	}

	// LXStudio had a continous array of points that effects could use.   Simluate that here
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
}
