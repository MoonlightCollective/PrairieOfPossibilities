using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class EnableMultiTrigger : TriggerListener
{
	public EEnableBehavior TriggerBehavior = EEnableBehavior.Toggle;

	[Tooltip("If not set, targets the object this component is on")]
	public GameObject MasterObject;
	
	[Tooltip("These objects will stay in sync with the active/inactive state of the Master Object")]
	public List<GameObject> SlaveObjects;

	[Header("Additional Events")]
	[Tooltip("Fire events when triggered, even if state didn't need to change (e.g. Fire ON event when I get an ON trigger, even if I was already enabled in the hierarchy)")]
	public bool AlwaysFireEvents = true;
	public UnityEvent OnTriggerOn;
	public UnityEvent OnTriggerOff;

	public void Awake()
	{
		Debug.Log("Multi-Awake:" + gameObject.name);
		syncSlaveObjects();
	}

	public void Update()
	{
		syncSlaveObjects();
	}

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		if (MasterObject == null)
			MasterObject = gameObject;

		bool fireOnEvent = false;
		bool fireOffEvent = false;

		switch (TriggerBehavior)
		{
			case EEnableBehavior.On:
				fireOnEvent = (AlwaysFireEvents || (!MasterObject.activeInHierarchy));
				MasterObject.SetActive(true);
				break;
			case EEnableBehavior.Off:
				fireOffEvent = (AlwaysFireEvents || (MasterObject.activeInHierarchy));
				MasterObject.SetActive(false);
				break;
			case EEnableBehavior.Toggle:
				MasterObject.SetActive(!MasterObject.activeInHierarchy);
				fireOnEvent = MasterObject.activeInHierarchy;
				fireOffEvent = !MasterObject.activeInHierarchy;
				break;
		}

		foreach (var slave in SlaveObjects)
		{
			slave.SetActive(MasterObject.activeInHierarchy);
		}

		if (fireOnEvent)
			OnTriggerOn?.Invoke();
	
		if (fireOffEvent)
			OnTriggerOff?.Invoke();
	}

	public void syncSlaveObjects()
	{
		foreach (var slave in SlaveObjects)
		{
			slave.SetActive(MasterObject.activeInHierarchy);
		}
	}

}
