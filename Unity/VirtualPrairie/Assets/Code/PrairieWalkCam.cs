using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PrairieWalkCam : MonoBehaviour
{

	public float RotSpeed = 5.0f;
	public float MouseSensitivity = 1.0f;
	public float WalkSpeed = 1.0f;
	public float HeadHeight = 1.65f;

	public  void Start()
	{
		transform.position = new Vector3(transform.position.x,HeadHeight,transform.position.z);
	}

	public void LateUpdate()
	{
		if (Input.GetMouseButtonDown(1))
		{
			Cursor.lockState = CursorLockMode.Locked;
		}

		if (Input.GetMouseButtonUp(1))
		{
			Cursor.lockState = CursorLockMode.None;
			Cursor.visible = true;
		}

		Vector2 lookDirDelta = getLookDirDeltaFromMouse();

		Quaternion targetRot = Quaternion.Euler(transform.eulerAngles + new Vector3(lookDirDelta.y * RotSpeed * Time.deltaTime, lookDirDelta.x * RotSpeed * Time.deltaTime, 0f));
		transform.localRotation = targetRot;

		Vector3 walkDirLocal = getWalkInputDir();
		Vector3 walkDirWorld = Camera.main.transform.TransformDirection(walkDirLocal);

		walkDirWorld.y = 0.0f;
		walkDirWorld.Normalize();
		Vector3 walkVel = walkDirWorld * WalkSpeed;

		transform.position += walkVel * Time.deltaTime;
	}

	public Vector2 getLookDirDeltaFromMouse()
	{
		Vector2 retDelta = Vector2.zero;
		if (Input.GetMouseButton(1))
		{
			retDelta.x = Input.GetAxis("Mouse X") * MouseSensitivity;
			retDelta.y = -Input.GetAxis("Mouse Y") * MouseSensitivity;
		}
		return retDelta;
	}

	public Vector3 getWalkInputDir()
	{
		float lr = Input.GetAxis("Horizontal");
		float fb = Input.GetAxis("Vertical");
		return new Vector3(lr, 0, fb);
	}
}
