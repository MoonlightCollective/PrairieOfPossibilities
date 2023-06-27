using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneLoader : MonoBehaviour
{

	public List<string> ScenePlaylist;

	public void LoadNextScene()
    {
		string curScene = SceneManager.GetActiveScene().name;
		int iScene = ScenePlaylist.FindIndex(x => x.Equals (curScene,System.StringComparison.Ordinal));
		if (iScene < 0)
        {
			Debug.LogError("Can't find current scene in scene playlist");
			return;
        }

		iScene = iScene + 1;
		if (iScene >= ScenePlaylist.Count)
			iScene = 0;
		LoadScene(ScenePlaylist[iScene]);
    }

	public void LoadPreviousScene()
    {
		string curScene = SceneManager.GetActiveScene().name;
		int iScene = ScenePlaylist.FindIndex(x => x.Equals(curScene, System.StringComparison.Ordinal));
		if (iScene < 0)
		{
			Debug.LogError("Can't find current scene in scene playlist");
			return;
		}

		iScene = iScene - 1;
		if (iScene < 0)
			iScene = ScenePlaylist.Count - 1;
		LoadScene(ScenePlaylist[iScene]);
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
