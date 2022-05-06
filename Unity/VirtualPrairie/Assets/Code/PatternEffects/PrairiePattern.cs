using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class PrairiePatternLayer : PrairieLayer
{
    public abstract void Run(float deltaTime,PrairieLayerGroup scene, List<StemColorManager> points);
}
