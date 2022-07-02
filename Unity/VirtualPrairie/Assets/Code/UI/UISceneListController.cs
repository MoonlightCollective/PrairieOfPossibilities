using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.SceneManagement;

public class UISceneListController : MonoBehaviour
{
	public GameObject SceneButtonFab;
	public Transform ContentRoot;

    // Start is called before the first frame update
    void Start()
    {
		populateList();
    }

	public void NotifySceneClick(string sceneName)
	{
		FmodMusicPlayer fmp = GameObject.FindObjectOfType<FmodMusicPlayer>();
		if (fmp != null)
			fmp.StopMusic();

		SceneManager.LoadScene(sceneName,LoadSceneMode.Single);
	}

	void clearList()
	{
		foreach (Transform child in ContentRoot)
		{
			GameObject.Destroy(child.gameObject);
		}
		ContentRoot.DetachChildren();
	}

	void populateList()
	{
		clearList();
		for (int i = 0; i < SceneManager.sceneCountInBuildSettings; i++)
		{
			string scenePath = SceneUtility.GetScenePathByBuildIndex(i);
			string sceneName = Path.GetFileNameWithoutExtension(scenePath);
			var go = GameObject.Instantiate(SceneButtonFab);
			UISceneButtonController sbc = go.GetComponentInChildren<UISceneButtonController>();
			sbc.InitFromSceneList(this,sceneName);
			go.transform.SetParent(ContentRoot,false);
		}
	}
}
