using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneLoader : MonoBehaviour
{

	public List<string> ScenePlaylist;
	protected static int currentScene = 0;

	public void LoadNextScene()
    {
		currentScene = currentScene + 1;
		if (currentScene >= ScenePlaylist.Count)
			currentScene = 0;
		LoadScene(ScenePlaylist[currentScene]);
    }

	public void LoadPreviousScene()
    {
		currentScene = currentScene - 1;
		if (currentScene < 0)
			currentScene = ScenePlaylist.Count - 1;
		LoadScene(ScenePlaylist[currentScene]);
	}

	public static void LoadScene(string newSceneName)
	{
		FmodMusicPlayer fmp = GameObject.FindObjectOfType<FmodMusicPlayer>();
		if (fmp != null)
			fmp.StopMusic();

		SceneManager.LoadScene(newSceneName,LoadSceneMode.Single);
	}

	public static void LoadScene(int sceneIndex)
	{
		FmodMusicPlayer fmp = GameObject.FindObjectOfType<FmodMusicPlayer>();
		if (fmp != null)
			fmp.StopMusic();

		SceneManager.LoadScene(sceneIndex, LoadSceneMode.Single);
	}
}
