using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum EPropLayoutType
{
	InnerRing,
	OuterRing,
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
			case EPropLayoutType.InnerRing:
				transform.position = (dir * (gen.MinDistFromOrigin + RadialOffset)) + new Vector3(0,yPos,0);
				break;
			case EPropLayoutType.OuterRing:
				transform.position = (dir * (gen.MaxDistFromOrigin + RadialOffset)) + new Vector3(0,yPos,0);
				break;
		}
	}
}
