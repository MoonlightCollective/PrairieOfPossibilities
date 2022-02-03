using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PrairieWalkCam : MonoBehaviour
{
	public float RotSpeed = 5.0f;
	public float MouseSensitivity = 1.0f;
	public float KeyLookSensitivity = 1.0f;
	public float WalkSpeed = 1.0f;
	public float HeadHeight = 1.65f;
	public float FloatSpeed = 3.0f;

	public float AccelRate = 1.0f;
	public float DecelRate = 0.3f;
	public bool isFlying = true;
	
	public GameObject CameraStopRoot;

	protected float _desiredSpeed;
	protected float _curSpeed;


	public  void Start()
	{
		transform.position = new Vector3(transform.position.x,HeadHeight,transform.position.z);
		_desiredSpeed = 0;
		_curSpeed = 0;
	}

	public void LateUpdate()
	{
		checkForTeleport();

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

		_desiredSpeed = (walkDirWorld * WalkSpeed).magnitude;
		if (_desiredSpeed > _curSpeed)
			_curSpeed = Mathf.MoveTowards(_curSpeed, _desiredSpeed, Time.deltaTime /  AccelRate);
		else
			_curSpeed = Mathf.MoveTowards(_curSpeed,_desiredSpeed, Time.deltaTime / DecelRate);

		float mult = 1;
		if (Input.GetKey(KeyCode.LeftShift) || Input.GetKey(KeyCode.RightShift))
		{
			mult = 2.5f;
		}

		Vector3 walkVel = walkDirWorld * _curSpeed * mult;
		transform.position += walkVel * Time.deltaTime;

		if (isFlying)
			setHeightFromFlight(mult);
		else
			setHeightFromWalk();
	}

	void setHeightFromFlight(float mult)
	{
		float flySpeed = Input.GetAxis("Fly") * FloatSpeed * mult;
		Vector3 flyVel = flySpeed * Vector3.up;
		transform.position += flyVel * Time.deltaTime;

		Vector3 castStart = transform.position;
		RaycastHit hit;
		float newY = transform.position.y;

		if (Physics.Raycast(castStart, Vector3.down, out hit, 40f, LayerMask.GetMask("Ground"), QueryTriggerInteraction.Ignore))
		{
			newY = Mathf.Max(HeadHeight + hit.point.y, transform.position.y);
		}
		else
		{
			newY = Mathf.Max(HeadHeight, transform.position.y);
			// transform.position = new Vector3(transform.position.x, HeadHeight, transform.position.z);
		}
		transform.position = new Vector3(transform.position.x, newY, transform.position.z);
	}

	void setHeightFromWalk()
	{
		Vector3 castStart = transform.position;
		RaycastHit hit;
		if (Physics.Raycast(castStart, Vector3.down, out hit, 40f, LayerMask.GetMask("Ground"), QueryTriggerInteraction.Ignore))
			transform.position = new Vector3(transform.position.x, hit.point.y + HeadHeight, transform.position.z);
		else
			transform.position = new Vector3(transform.position.x, HeadHeight, transform.position.z);
	}

	Vector2 getLookDirDeltaFromMouse()
	{
		Vector2 retDelta = Vector2.zero;
		if (Input.GetMouseButton(1))
		{
			retDelta.x = Input.GetAxis("Mouse X") * MouseSensitivity;
			retDelta.y = -Input.GetAxis("Mouse Y") * MouseSensitivity;
		}

		retDelta.x += Input.GetAxis("Look H") * KeyLookSensitivity;
		retDelta.y += Input.GetAxis("Look V") * KeyLookSensitivity;

		return retDelta;
	}

	void checkForTeleport()
	{
		if (Input.GetKeyDown(KeyCode.Alpha0))
			teleportTo(0);
		if (Input.GetKeyDown(KeyCode.Alpha1))
			teleportTo(1);
		if (Input.GetKeyDown(KeyCode.Alpha2))
			teleportTo(2);
		if (Input.GetKeyDown(KeyCode.Alpha3))
			teleportTo(3);
		if (Input.GetKeyDown(KeyCode.Alpha4))
			teleportTo(4);
		if (Input.GetKeyDown(KeyCode.Alpha5))
			teleportTo(5);
		if (Input.GetKeyDown(KeyCode.Alpha6))
			teleportTo(6);
	}

	void teleportTo(int dex)
	{
		Transform target = CameraStopRoot.transform.GetChild(dex);
		if (target != null)
		{
			transform.position = target.transform.position;
			transform.localRotation = target.transform.localRotation;
		}

	}

	Vector3 getWalkInputDir()
	{
		float lr = Input.GetAxis("Horizontal");
		float fb = Input.GetAxis("Vertical");
		return new Vector3(lr, 0, fb);
	}
}
