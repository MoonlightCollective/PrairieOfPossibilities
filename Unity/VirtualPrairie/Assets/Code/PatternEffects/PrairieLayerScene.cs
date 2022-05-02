using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PrairieLayerScene : MonoBehaviour
{
	public List<PrairiePatternLayer> _layers = new List<PrairiePatternLayer>();

    // Update is called once per frame
    void Update()
    {
		foreach (var layer in _layers)
		{
			if (layer.enabled)
			{
				layer.Run(Time.deltaTime,PrairieUtil.Points);
			}
		}
    }
}
