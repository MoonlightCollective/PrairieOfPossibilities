using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraStop : MonoBehaviour
{
	public bool IsFlying = false;
	public bool IsOrtho = false;

	[Header("Dynamic Positions")]
	public Transform FollowObj;
	public Vector3 FollowOffset;

	public void Update()
	{
		if (FollowObj != null)
		{
			transform.position = FollowObj.transform.position + FollowOffset;
		}
	}
}
