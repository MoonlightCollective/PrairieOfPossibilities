using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum EPropLayoutType
{
	InnerRingPortal,
	OuterRingPortal,
	InnerRingBooth,
	OuterRingBooth
}

public class FixtureProp : MonoBehaviour
{
	public EPropLayoutType LayoutType;
	public float RadialOffset = 0f;

	public void UpdatePositionFromLayout(FixtureLayoutGen gen)
	{
		Vector3 dir = transform.position.normalized;
		dir.y = 0f;
		float yPos = transform.position.y;
		switch (LayoutType)
		{
			case EPropLayoutType.InnerRingPortal:
				transform.position = (dir * (gen.MinDistFromOrigin + RadialOffset)) + new Vector3(0,yPos,0);
				break;
			case EPropLayoutType.OuterRingPortal:
				transform.position = (dir * (gen.MaxDistFromOrigin + RadialOffset)) + new Vector3(0,yPos,0);
				break;
			case EPropLayoutType.InnerRingBooth:
				transform.position = (dir * (gen.MinDistFromOrigin + (RadialOffset * 1.5f))) + new Vector3(0, yPos, 0);
				break;
			case EPropLayoutType.OuterRingBooth:
				transform.position = (dir * (gen.MaxDistFromOrigin + (RadialOffset * 1.5f))) + new Vector3(0, yPos, 0);
				break;
		}
	}
}
