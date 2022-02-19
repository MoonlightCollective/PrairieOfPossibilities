using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum EPropLayoutStyle
{
	Disabled,
	InnerPortals,
	OuterPortals,
}

public class FixturePropLayout : MonoBehaviour
{
	public void SetLayoutStyle(EPropLayoutStyle layoutStyle, float offset, FixtureLayoutGen layoutGen)
	{
		FixtureProp[] props = GetComponentsInChildren<FixtureProp>();
		foreach (var prop in props)		
		{
			if (prop.gameObject.name.Contains("Portal") || prop.gameObject.name.Contains("portal"))
			{
				switch(layoutStyle)
				{
					case EPropLayoutStyle.InnerPortals:
						prop.LayoutType = EPropLayoutType.InnerRing;
						break;
					case EPropLayoutStyle.OuterPortals:
						prop.LayoutType = EPropLayoutType.OuterRing;
						break;
				}
				prop.RadialOffset = offset;
			}
		}

		if (layoutStyle == EPropLayoutStyle.Disabled)
		{
			gameObject.SetActive(false);
		}
		else
		{
			gameObject.SetActive(true);
			NotifyNewLayout(layoutGen);
		}
	}

	public void NotifyNewLayout(FixtureLayoutGen layoutGen)
	{
		FixtureProp[] props = GetComponentsInChildren<FixtureProp>();
		foreach (var prop in props)		
		{
			prop.UpdatePositionFromLayout(layoutGen);
		}
	}
}
