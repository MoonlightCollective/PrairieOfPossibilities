using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIMasterController : MonoBehaviour
{
	public UIHudController HudController;
	public UILayoutSettingsController LayoutSettingsController;
	public UIWiringController WiringController;
	public UIEventPanel EventPanel;
	public GameObject SceneLoader;

	public bool WiringActive  => WiringController.gameObject.activeInHierarchy;
	public bool HudActive  => HudController.gameObject.activeInHierarchy;
	public bool LayoutSettingsActive  => LayoutSettingsController.gameObject.activeInHierarchy;
	public bool SceneLoaderActive => SceneLoader.gameObject.activeInHierarchy;

	void Start()
	{
		HudController.gameObject.SetActive(true);
		WiringController.gameObject.SetActive(false);
		LayoutSettingsController.gameObject.SetActive(false);
		SceneLoader.SetActive(false);
	}

    void Update()
    {
		if (Input.GetKeyDown(KeyCode.Tab))
		{
			toggleHud();
		}
		if (!PlantSelectionManager.Instance.IsWiring() && Input.GetKeyDown(KeyCode.L))
		{
			toggleLayoutUI();
		}
		if (Input.GetKeyDown(KeyCode.E))
		{
			toggleEventUI();
		}
		if (Input.GetKeyDown(KeyCode.O))
		{
			toggleSceneLoader();
		}
    }
	
	public void ForceDisableLayoutUI()
	{
		LayoutSettingsController.gameObject.SetActive(false);
	}

	void toggleLayoutUI()
	{
		if (LayoutSettingsController == null)
			return;
		
		if (LayoutSettingsController.gameObject.activeInHierarchy)
		{
			LayoutSettingsController.gameObject.SetActive(false);
		}
		else
		{
			HudController.gameObject.SetActive(false);
			if (PlantSelectionManager.Instance.IsWiring())
			{
				PlantSelectionManager.Instance.ForceDisable();
			}
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

	void toggleEventUI()
	{
		EventPanel.ToggleEventUI();
	}

	void toggleWiringController()
	{
		if (WiringController == null)
			return;
		
		if (WiringController.gameObject.activeInHierarchy)
			WiringController.gameObject.SetActive(false);
		else
			WiringController.gameObject.SetActive(true);
	}

	void toggleSceneLoader()
	{
		SceneLoader.SetActive(!SceneLoaderActive);
	}

	public void NotifyCancelSceneLoad()
	{
		SceneLoader.SetActive(false);
	}

	public void NotifyQuit()
	{
		Debug.Log("Quit Button");

		FmodMusicPlayer fmp = GameObject.FindObjectOfType<FmodMusicPlayer>();
		if (fmp != null)
			fmp.StopMusic();

		Application.Quit(0);
		#if UNITY_EDITOR
			UnityEditor.EditorApplication.isPlaying = false;
		#endif
	}
}
