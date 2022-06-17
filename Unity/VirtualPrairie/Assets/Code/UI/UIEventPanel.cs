using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class UIEventPanel : MonoBehaviour
{
	public GameObject EventButtonFab;
	public Transform ButtonRoot;
	public VerticalLayoutGroup LayoutGroup;

	public void Start()
	{
		gameObject.SetActive(false);
	}
	
	public void ToggleEventUI()
	{
		if (gameObject.activeInHierarchy)
		{
			gameObject.SetActive(false);
		}
		else
		{
			rebuildUI();
			gameObject.SetActive(true);
		}
	}
    
	void rebuildUI()
	{
		foreach (Transform child in ButtonRoot)
		{
			GameObject.Destroy(child.gameObject);
		}
		ButtonRoot.DetachChildren();

		rebuildMqttEventButtons();

		LayoutRebuilder.ForceRebuildLayoutImmediate(LayoutGroup.GetComponent<RectTransform>());
	}

	void rebuildMqttEventButtons()
	{
		var mqqtTriggers = GameObject.FindObjectsOfType<MqttTrigger>();

		foreach (var mt in mqqtTriggers)
		{
			foreach (var trigEntry in mt.MessageMappings)
			{
				GameObject go = GameObject.Instantiate(EventButtonFab);
				var eb = go.GetComponentInChildren<UIEventButton>();
				eb.InitFromMqttTriggerEntry(trigEntry,mt);
				go.transform.SetParent(ButtonRoot.transform,false);
				Debug.Log("Create button for event:" + trigEntry.Message);
			}
		}
	}
}
