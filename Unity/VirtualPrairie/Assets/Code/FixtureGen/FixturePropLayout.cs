using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FixturePropLayout : MonoBehaviour
{
	public void NotifyNewLayout(FixtureLayoutGen layoutGen)
	{
		FixtureProp[] props = GetComponentsInChildren<FixtureProp>();
		foreach (var prop in props)		
		{
			prop.UpdatePositionFromLayout(layoutGen);
		}
	}
}
