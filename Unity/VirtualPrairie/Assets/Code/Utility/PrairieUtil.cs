using System.Collections;
using System.Collections.Generic;
using UnityEngine;

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
}
