using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class PrairiePattern : MonoBehaviour
{
    // a render buffer to write into
    public List<Color> colors = new List<Color>();
    public abstract void Run(float deltaMs);

    public void Start()
    {
        colors.Clear();
        // build a render buffer for every point
        foreach (var point in PrairieUtil.Points)
        {
            colors.Add(new Color());
        }
    }

    void Update()
    {
        // call the pattern to update the render buffer
        Run(Time.deltaTime * 1000f);

        // go update the scene graph
        int pointIndex = 0;
        foreach (var point in PrairieUtil.Points)
        {
            point.SetColor(colors[pointIndex++], GlobalPlantSettings.Instance.GlowIntensity, GlobalPlantSettings.Instance.StemAlpha);
        }
    }
}
