using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class SceneSettings
{
	public bool SceneEnabled = true;
	[Range(0,1)]
	public float SceneAlpha = 1.0f;
}

public class PrairieLayerScene : MonoBehaviour
{
	public SceneSettings SceneSettings;

	public List<PrairiePatternLayer> _layers = new List<PrairiePatternLayer>();

    // Update is called once per frame
    void Update()
    {
		if (!SceneSettings.SceneEnabled)
		{
			return;
		}

		foreach (var layer in _layers)
		{
			if (layer.PatternEnabled)
			{
				layer.Run(Time.deltaTime, SceneSettings.SceneAlpha, PrairieUtil.Points);
			}
		}
    }
}
