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
		rebuildMusicEventButtons();
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

	void rebuildMusicEventButtons()
	{
		var musicTriggers = GameObject.FindObjectsOfType<MusicMarkerTrigger>();
		foreach (var mt in musicTriggers)
		{
			GameObject go = GameObject.Instantiate(EventButtonFab);
			var eb = go.GetComponentInChildren<UIEventButton>();
			eb.initFromMusicTrigger(mt);
			go.transform.SetParent(ButtonRoot.transform,false);
		}

		var musicGates = GameObject.FindObjectsOfType<MusicMarkerGate>();
		foreach (var mg in musicGates)
		{
			GameObject go = GameObject.Instantiate(EventButtonFab);
			var eb = go.GetComponentInChildren<UIEventButton>();
			eb.initFromMusicGate(mg,true);
			go.transform.SetParent(ButtonRoot.transform,false);

			go = GameObject.Instantiate(EventButtonFab);
			eb = go.GetComponentInChildren<UIEventButton>();
			eb.initFromMusicGate(mg,false);
			go.transform.SetParent(ButtonRoot.transform,false);
		}
	}
}
