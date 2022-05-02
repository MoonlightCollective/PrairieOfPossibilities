using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering.Universal;

public class OnePointEachPattern : PrairiePatternLayer
{
    private int index = 0;

    public float delayInSeconds = 0f;
    private int lastBlinkTick = 0;

    public OnePointEachPattern() 
    {
    }

    public override void Run(float deltaMs, List<StemColorManager> points) 
    {
        // time to blink ?
        /*if (System.Environment.TickCount > this.lastBlinkTick + (int)(this.delayInSeconds * 1000f))
        {
            this.lastBlinkTick = System.Environment.TickCount;
            colors[this.index] = new Color(0,0,0); 
            this.index += 1;
            if (this.index >= PrairieUtil.Points.Count) 
            {
                this.index = 0;
            }
            // fire engine red
            colors[this.index] = new Color(0.83f,0.13f,0.18f);
        }*/
    }
}
