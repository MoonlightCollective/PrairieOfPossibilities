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
    FmodMusicPlayer _fmp;
    SceneLoader _sceneLoader;

	public bool AutoLoadNextScene = true;

	public bool AutoDisplayMode = true;
	UIMasterController _ui;


	// Start is called before the first frame update
    void Start()
    {
		_musicManager = GameObject.FindObjectOfType<PrairieMusicManager>();
        _fmp = PrairieGlobals.Instance.MusicPlayer;
        _ui = GameObject.FindObjectOfType<UIMasterController>();
		_sceneLoader = PrairieGlobals.Instance.SceneLoader;
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
		if (OVRInput.Get(OVRInput.Button.One) || Input.GetKeyDown(KeyCode.Period))
		{
			// load next scene
			_sceneLoader.LoadNextScene();
		}
		if (OVRInput.Get(OVRInput.Button.Two) || Input.GetKeyDown(KeyCode.Comma))
		{
			// load previous scene
			_sceneLoader.LoadPreviousScene();
		}
		if (Input.GetKeyDown(KeyCode.Equals))
		{
			if (_fmp.IsPlaying())
			{
				_fmp.SkipBySeconds(10);
			}
		}
        if (Input.GetKeyDown(KeyCode.Minus))
        {
            if (_fmp.IsPlaying())
            {
                _fmp.SkipBySeconds(-10);
            }
        }
    }

    void NotifyPlaylistEnd()
	{
		if (AutoLoadNextScene)
		{
			_sceneLoader.LoadNextScene();
		}
	}
}
