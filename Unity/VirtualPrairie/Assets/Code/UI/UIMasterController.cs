using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIMasterController : MonoBehaviour
{
	public UIHudController HudController;

    // Update is called once per frame
    void Update()
    {
		if (Input.GetKeyDown(KeyCode.Tab))
		{
			toggleHud();
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
