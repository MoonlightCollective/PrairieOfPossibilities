using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneLoader : MonoBehaviour
{
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
