using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class PrairiePatternLayer : PrairieLayer
{
    public abstract void Run(float deltaTime, List<StemColorManager> points);

    void Update()
    {
		// if (Enabled)
		// {
			// Run(Time.deltaTime,PrairieUtil.Points);
		// }
    }
}
