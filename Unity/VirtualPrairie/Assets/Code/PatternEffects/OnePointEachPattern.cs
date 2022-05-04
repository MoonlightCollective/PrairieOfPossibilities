using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering.Universal;
using NaughtyAttributes;

public class OnePointEachPattern : PrairiePatternLayer
{
	[Expandable]
	public OnePointEachSettings OnePointEachSettings;

	float _delayTimer = -1f;
	int _index = -1;

    public override void Run(float deltaTime, PrairieLayerScene scene, List<StemColorManager> points) 
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
		Color blendColor = OnePointEachSettings.PointColor.Color(scene) * BlendSettings.LayerAlpha * scene.SceneSettings.SceneAlpha;
		points[_index].SetColor(ColorBlend.BlendColors(blendColor,points[_index].CurColor,BlendSettings.BlendMode));
    }
}
