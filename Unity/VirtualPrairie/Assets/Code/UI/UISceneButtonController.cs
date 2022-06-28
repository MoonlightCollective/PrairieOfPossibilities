using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class UISceneButtonController : MonoBehaviour
{
	UISceneListController _parentController;
	Button _button;
	string _sceneName;
	public void InitFromSceneList(UISceneListController parentController, string sceneName)
	{
		_parentController = parentController;
		_button = GetComponentInChildren<Button>();
		_sceneName = sceneName;
		_button.onClick.AddListener(() => NotifyClick());
		var tmp = GetComponentInChildren<TextMeshProUGUI>();
		tmp.text = sceneName;
	}

	void NotifyClick()
	{
		_parentController.NotifySceneClick(_sceneName);
	}

}
