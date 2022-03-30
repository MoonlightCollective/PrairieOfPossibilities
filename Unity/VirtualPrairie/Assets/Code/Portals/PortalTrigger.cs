using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PortalTrigger : MonoBehaviour
{
	public PortalLogic.EPortalSensorID SensorID;
	PortalLogic _portal;
	void Awake()
    {
		_portal = GetComponentInParent<PortalLogic>();
    }

	public void OnTriggerEnter(Collider c)
	{
		if (c.gameObject.tag == "Player")
		{
			_portal.NotifySensorEnter(SensorID);
		}
		// Debug.Log($"{gameObject.name} - Collision enter: {c.gameObject.name}");
	}

	public void OnTriggerExit(Collider c)
	{
		if (c.gameObject.tag == "Player")
		{
			_portal.NotifySensorExit(SensorID);
		}
	}

}
