using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PrairieWalkCam : MonoBehaviour
{
	[Header("WalkCam Properties")]
	public float RotSpeed = 5.0f;
	public float MouseSensitivity = 1.0f;
	public float KeyLookSensitivity = 1.0f;
	public float WalkSpeed = 1.0f;
	public float HeadHeight = 1.65f;
	public float FloatSpeed = 3.0f;

	public float AccelRate = 1.0f;
	public float DecelRate = 0.3f;
	public bool isFlying = true;
	
	[Header("OrthoCamera Properties")]
	public float OrthoMinSize = 1.0f;
	public float OrthoMaxSize = 100.0f;
	public float OrthoScrollMult = 1.0f;


	// [Header("Camera Stops")]
	// public GameObject CameraStopRoot;
	
	[HideInInspector]
	public List<CameraStop> CameraStops;
	
	Camera _camera;

	protected float _desiredSpeed;
	protected float _curSpeed;

	public void Awake()
	{
		_camera = GetComponent<Camera>();
	}

	public  void Start()
	{
		CameraStops = new List<CameraStop>(PrairieGlobals.Instance.CameraStopRoot.GetComponentsInChildren<CameraStop>());
		transform.position = new Vector3(transform.position.x,HeadHeight,transform.position.z);
		_desiredSpeed = 0;
		_curSpeed = 0;
	}

	public void LateUpdate()
	{
		checkForTeleport();
		checkForFlyingToggle();
		if (_camera.orthographic)
		{
			updateOrthoCam();
		}
		else
		{
			updatePerspCam();
		}
	}
	
	// bool _orthMouseDown = false;
	Vector3 _orthoDragOriginWorld;
	void updateOrthoCam()
	{
		if (Input.GetMouseButtonDown(1))
		{
			_orthoDragOriginWorld = _camera.ScreenToWorldPoint(new Vector3(Input.mousePosition.x,Input.mousePosition.y,-_camera.transform.position.z));
		}

		if (Input.GetMouseButton(1))
		{
			Vector3 newposWorld = _camera.ScreenToWorldPoint(new Vector3(Input.mousePosition.x,Input.mousePosition.y,-_camera.transform.position.z));
			Vector3 deltaWorld = _orthoDragOriginWorld - newposWorld;
			deltaWorld.y = 0f;
			// Debug.Log($"Translate by:{deltaWorld}");
			_camera.transform.Translate(deltaWorld,Space.World);
		}
		float scrollDelta = -OrthoScrollMult * Input.GetAxis("Mouse ScrollWheel");
		_camera.orthographicSize = Mathf.Clamp(_camera.orthographicSize + scrollDelta, OrthoMinSize, OrthoMaxSize);
	}

	void updatePerspCam()
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

		float mult = 1;
		if (Input.GetKey(KeyCode.LeftShift) || Input.GetKey(KeyCode.RightShift))
		{
			mult = 2.5f;
		}

		Quaternion targetRot = Quaternion.Euler(transform.eulerAngles + new Vector3(lookDirDelta.y * RotSpeed * mult * Time.deltaTime, lookDirDelta.x * RotSpeed * mult * Time.deltaTime, 0f));
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

		if (OVRInput.Get(OVRInput.Button.SecondaryThumbstickLeft))
			retDelta.x += -5.0f;
		if (OVRInput.Get(OVRInput.Button.SecondaryThumbstickRight))
			retDelta.x += 5.0f;
		if (OVRInput.Get(OVRInput.Button.SecondaryThumbstickUp))
			retDelta.y += -5.0f;
		if (OVRInput.Get(OVRInput.Button.SecondaryThumbstickDown))
			retDelta.y += 5.0f;

		return retDelta;
	}

	void checkForFlyingToggle()
	{
		if (Input.GetKeyDown(KeyCode.F))
		{
			isFlying = !isFlying;
		}
	}

	void checkForTeleport()
	{
		if (PlantSelectionManager.Instance.IsWiring())
			return;

		if (PrairieUtil.AnyInputActive())
			return;

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


	public void TeleportToStop(CameraStop stop)
	{
		doTeleportToStop(stop);
	}

	public void TeleportToStop(int stopDex)
	{
		teleportTo(stopDex);
	}

	void teleportTo(int dex)
	{
		if (dex >= CameraStops.Count)
			return;

		doTeleportToStop(CameraStops[dex]);
	}

	void doTeleportToStop(CameraStop cStop)
	{
		Transform target = cStop.transform;

		if (target != null)
		{
			transform.position = target.transform.position;
			transform.localRotation = target.transform.localRotation;
			isFlying = cStop.IsFlying;
			if (cStop.IsOrtho)
            {
				Camera.main.orthographic = true;
				Camera.main.orthographicSize = PrairieUtil.GetLayoutGen().MaxDistFromOrigin;
			}
			else
            {
				Camera.main.orthographic = false;
            }
		}
	}

	Vector3 getWalkInputDir()
	{
		float lr = Input.GetAxis("Horizontal");
		float fb = Input.GetAxis("Vertical");

		if (OVRInput.Get(OVRInput.Button.PrimaryThumbstickLeft))
			lr = -1.0f;
		if (OVRInput.Get(OVRInput.Button.PrimaryThumbstickRight))
			lr = 1.0f;
		if (OVRInput.Get(OVRInput.Button.PrimaryThumbstickUp))
			fb = 1.0f;
		if (OVRInput.Get(OVRInput.Button.PrimaryThumbstickDown))
			fb = -1.0f;

		return new Vector3(lr, 0, fb);
	}
}
