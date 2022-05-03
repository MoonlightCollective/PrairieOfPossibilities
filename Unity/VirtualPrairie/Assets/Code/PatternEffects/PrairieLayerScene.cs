using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PrairieLayerScene : MonoBehaviour
{
	public float SceneAlpha = 1.0f;
	public bool SceneEnabled = true;

	public List<PrairiePatternLayer> _layers = new List<PrairiePatternLayer>();

    // Update is called once per frame
    void Update()
    {
		if (!SceneEnabled)
		{
			return;
		}

		foreach (var layer in _layers)
		{
			if (layer.PatternEnabled)
			{
				layer.Run(Time.deltaTime, SceneAlpha, PrairieUtil.Points);
			}
		}
    }
}
