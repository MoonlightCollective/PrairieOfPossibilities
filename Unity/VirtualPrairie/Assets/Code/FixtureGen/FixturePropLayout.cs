using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum EPropLayoutStyle
{
	Disabled,
	InnerPortals,
	OuterPortals,
	ClearingPortals
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
						prop.LayoutType = EPropLayoutType.InnerRingPortal;
						break;
					case EPropLayoutStyle.OuterPortals:
						prop.LayoutType = EPropLayoutType.OuterRingPortal;
						break;
				}
				prop.RadialOffset = offset;
			}
			if (prop.gameObject.name.Contains("booth"))
			{
				switch (layoutStyle)
				{
					case EPropLayoutStyle.InnerPortals:
						prop.LayoutType = EPropLayoutType.InnerRingBooth;
						break;
					case EPropLayoutStyle.OuterPortals:
						prop.LayoutType = EPropLayoutType.OuterRingBooth;
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
