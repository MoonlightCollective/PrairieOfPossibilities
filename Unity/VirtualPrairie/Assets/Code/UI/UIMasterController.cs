using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIMasterController : MonoBehaviour
{
	public UIHudController HudController;
	public UILayoutSettingsController LayoutSettingsController;
	public UIWiringController WiringController;
	public UIEventPanel EventPanel;
	public UITagPanel TagPanel;
	public GameObject SceneLoader;
	public UIDisplayModeController DisplayModeController;

	public bool WiringActive  => WiringController.gameObject.activeInHierarchy;
	public bool HudActive  => HudController.gameObject.activeInHierarchy;
	public bool LayoutSettingsActive  => LayoutSettingsController.gameObject.activeInHierarchy;
	public bool SceneLoaderActive => SceneLoader.gameObject.activeInHierarchy;
	public bool TaggingActive => TagPanel.gameObject.activeInHierarchy;
	public bool EventPanelActive => EventPanel.gameObject.activeInHierarchy;
	public bool DisplayModeActive => DisplayModeController.gameObject.activeInHierarchy;

	UIFpsCounter _fps;

	void Awake()
	{
		HudController.gameObject.SetActive(true);
		WiringController.gameObject.SetActive(false);
		LayoutSettingsController.gameObject.SetActive(false);
		SceneLoader.SetActive(false);
		TagPanel.gameObject.SetActive(false);
		DisplayModeController.Deactivate();
		_fps = GetComponentInChildren<UIFpsCounter>();
		_fps.gameObject.SetActive(false);
	}

	void Update()
	{
		if (Input.GetKeyDown(KeyCode.Tab))
		{
			toggleHud();
		}
		if (!PlantSelectionManager.Instance.IsWiring() && Input.GetKeyDown(KeyCode.L) && !PrairieUtil.AnyInputActive())
		{
			toggleLayoutUI();
		}
		if (Input.GetKeyDown(KeyCode.E) && !PrairieUtil.AnyInputActive())
		{
			toggleEventUI();
		}
		if (Input.GetKeyDown(KeyCode.O) && !PrairieUtil.AnyInputActive())
		{
			toggleSceneLoader();
		}
		if (Input.GetKeyDown(KeyCode.T) && !PrairieUtil.AnyInputActive())
		{
			toggleTagUI();
		}
		if (Input.GetKeyDown(KeyCode.F))
		{
			toggleFPS();
		}
		if (Input.GetKeyDown(KeyCode.D) && 
			(Input.GetKey(KeyCode.LeftControl) || Input.GetKey(KeyCode.RightControl)) &&
			(Input.GetKey(KeyCode.LeftShift) || Input.GetKey(KeyCode.RightShift)))
		{
			toggleDisplayModeUI();
		}
	}
	
	public void ForceDisableLayoutUI()
	{
		LayoutSettingsController.gameObject.SetActive(false);
	}

	public void ForceDisplayMode()
	{
		if (!DisplayModeActive)
			toggleDisplayModeUI();
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

	void toggleDisplayModeUI()
	{
		if (!DisplayModeActive)
		{
			if (EventPanelActive)
				toggleEventUI();
			if (WiringActive)
				toggleWiringController();
			if (TaggingActive)
				toggleTagUI();
			if (HudActive)
				toggleHud();
			DisplayModeController.Activate();
		}
		else
		{
			DisplayModeController.Deactivate();
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
		if (!EventPanelActive && TaggingActive)
		{
			toggleTagUI();
		}
		
		EventPanel.ToggleEventUI();
	}

	void toggleTagUI()
	{
		if (!TaggingActive)
		{
			if (EventPanelActive)
				toggleEventUI();
			if (WiringActive)
				toggleWiringController();
			TagPanel.gameObject.SetActive(true);
		}
		else
		{
			TagPanel.gameObject.SetActive(false);
		}

		if (TaggingActive)
		{
			PlantSelectionManager.Instance.NotifyEnterTagging();
		}
		else
		{
			PlantSelectionManager.Instance.NotifyDisableSelection();
		}
	}

	void toggleFPS()
	{
		_fps.gameObject.SetActive(!_fps.gameObject.activeInHierarchy);
	}

	void toggleWiringController()
	{
		if (WiringController == null)
			return;
		
		if (WiringController.gameObject.activeInHierarchy)
			WiringController.gameObject.SetActive(false);
		else
		{
			if (TaggingActive)
				toggleTagUI();
			WiringController.gameObject.SetActive(true);
		}

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
