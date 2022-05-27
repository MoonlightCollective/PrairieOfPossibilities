using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class UnloadOnPlay : MonoBehaviour
{
	public void Start()
	{
		SceneManager.UnloadSceneAsync(gameObject.scene,UnloadSceneOptions.UnloadAllEmbeddedSceneObjects);
	}
}
