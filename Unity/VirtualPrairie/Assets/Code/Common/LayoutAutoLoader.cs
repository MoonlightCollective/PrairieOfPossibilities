using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using NaughtyAttributes;
using UnityEngine.SceneManagement;

public class LayoutAutoLoader : MonoBehaviour
{
	public bool AutoLoadAtStartup = true;
	public string LayoutJsonFile = "Layout.json";

	public bool AutoPlayMusic = true;
	PrairieMusicManager _musicManager;

	public bool DoLoadSceneOnPlaylistEnd = true;
	[ShowIf("DoLoadSceneOnPlaylistEnd")]
	public string DestinationScene = "TargetScene";

	public bool AutoDisplayMode = true;
	UIMasterController _ui;


	// Start is called before the first frame update
    void Start()
    {
		_musicManager = GameObject.FindObjectOfType<PrairieMusicManager>();
		_ui = GameObject.FindObjectOfType<UIMasterController>();

		_musicManager.OnPlaylistCompleted.AddListener(()=>NotifyPlaylistEnd());

		if (!AutoLoadAtStartup)
		{
			return;
		}
		var layoutGen = GameObject.FindObjectOfType<FixtureLayoutGen>();
		string layoutPath = Path.Combine(Application.streamingAssetsPath,LayoutJsonFile);
		layoutGen.ImportLayout.ClearChildrenFrom(PrairieUtil.GetLayoutRoot());
		layoutGen.DoImportLayout(PrairieUtil.GetLayoutRoot(),layoutPath,false);

		if (AutoPlayMusic)
		{
			_musicManager.StartPlayback();
		}

		if (AutoDisplayMode)
		{
			_ui.ForceDisplayMode();	
		}
    }

    private void Update()
    {
		if (OVRInput.Get(OVRInput.Button.One) && !string.IsNullOrEmpty(DestinationScene))
		{
			// load next scene
			SceneLoader.LoadScene(DestinationScene);
		}
		if (OVRInput.Get(OVRInput.Button.Two) && !string.IsNullOrEmpty(DestinationScene))
		{
			// restart current scene
			SceneLoader.LoadScene(SceneManager.GetActiveScene().buildIndex);
		}
	}


	void NotifyPlaylistEnd()
	{
		if (DoLoadSceneOnPlaylistEnd && !string.IsNullOrEmpty(DestinationScene))
		{
			SceneLoader.LoadScene(DestinationScene);
		}
	}

}
