using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering.Universal;


public class OnePointEachPattern : PrairiePatternLayer
{
	public OnePointEachSettings OnePointEachSettings;
	float _delayTimer = -1f;
	int _index = -1;

    public override void Run(float deltaTime, float parentAlpha, List<StemColorManager> points) 
    {
		_delayTimer -= deltaTime;
		if (_delayTimer <= 0 )
		{
			_index++;
			_delayTimer += OnePointEachSettings.DelayTimeSec;
			if (_index >= PrairieUtil.Points.Count)
			{
				_index = 0;
			}
		}
		Color blendColor = OnePointEachSettings.PointColor * LayerAlpha * parentAlpha;
		points[_index].SetColor(ColorBlend.BlendColors(blendColor,points[_index].CurColor,BlendMode));
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
