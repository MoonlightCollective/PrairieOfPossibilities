using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class NextSceneLoadTrigger : TriggerListener
{
	public string NextSceneName;

	public void Awake()
	{

	}

	public void GotoNextScene()
	{
		doLoadNextScene();
	}

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		doLoadNextScene();
	}

	void doLoadNextScene()
	{
		if (string.IsNullOrEmpty(NextSceneName))
			return;
		
		if (SceneManager.GetSceneByName(NextSceneName) != null)
		{
			SceneLoader.LoadScene(NextSceneName);
		}
	}
}
