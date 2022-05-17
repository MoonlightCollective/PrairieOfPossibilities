using UnityEngine;
using UnityEditor;

[InitializeOnLoad]
public static class PlayStateNotifier
{
	
	static PlayStateNotifier()
	{
		EditorApplication.playModeStateChanged += ModeChanged;
	}

	static void ModeChanged(PlayModeStateChange playModeState)
	{
		if (playModeState == PlayModeStateChange.EnteredEditMode)
		{
			Debug.Log("Entered Edit mode.");
			var snapshots = GameObject.FindObjectsOfType<Snapshot>();
			foreach (var s in snapshots)
			{
				s.UpdateSnapshotSaveTimeFromFile();
			}
		}
		else if (playModeState == PlayModeStateChange.EnteredPlayMode)
		{
			Debug.Log("Entered Play Mode");
		}
	}
}