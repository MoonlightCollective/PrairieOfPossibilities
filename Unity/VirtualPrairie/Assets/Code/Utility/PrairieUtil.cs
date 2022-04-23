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
}
