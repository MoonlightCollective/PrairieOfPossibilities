using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIMasterController : MonoBehaviour
{
	public UIHudController HudController;
	public UILayoutSettingsController LayoutSettingsController;

    
	void Start()
	{
		HudController.gameObject.SetActive(true);
		LayoutSettingsController.gameObject.SetActive(false);
	}

    void Update()
    {
		if (Input.GetKeyDown(KeyCode.Tab))
		{
			toggleHud();
		}
		if (Input.GetKeyDown(KeyCode.L))
		{
			toggleLayoutUI();
		}
    }
	
	void toggleLayoutUI()
	{
		if (LayoutSettingsController == null)
			return;
		
		if (LayoutSettingsController.gameObject.activeInHierarchy)
			LayoutSettingsController.gameObject.SetActive(false);
		else
		{
			HudController.gameObject.SetActive(false);
			LayoutSettingsController.gameObject.SetActive(true);
		}
	}

	void toggleHud()
	{
		if (HudController == null)
			return;

		if (HudController.gameObject.activeInHierarchy)
			HudController.gameObject.SetActive(false);
		else
			HudController.gameObject.SetActive(true);
	}
}
