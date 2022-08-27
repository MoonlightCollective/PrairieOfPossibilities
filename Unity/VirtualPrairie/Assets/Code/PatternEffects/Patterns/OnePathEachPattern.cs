using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering.Universal;
using NaughtyAttributes;

public class OnePathEachPattern : PrairiePatternMonochromaticBase
{
	[Expandable]
	public OnePointEachSettings OnePointEachSettings;

	float _delayTimer = -1f;
	int _index = -1;

    public override void Run(float deltaTime, PrairieLayerGroup group, List<StemColorManager> points) 
    {
		_delayTimer -= deltaTime;
		if (_delayTimer <= 0 )
		{
            // move to the next path
    		_index++;
	        Debug.Log($"Lighting up Path {_index}");
			_delayTimer += OnePointEachSettings.DelayTimeSec;
			if (_index >= WiredPathManager.Instance.Paths.Count)
			{
				_index = 0;
			}
		}
		Color blendColor = OnePointEachSettings.PointColor.Color(group) * BlendSettings.LayerAlpha * group.GroupAlpha;
        // light up every fixture in this path
        foreach (var fixture in WiredPathManager.Instance.Paths[_index].Fixtures)
        {
            var fixtureIndex = fixture.FixtureId;
            for (var pointIndex = fixtureIndex * PrairieDmxController.PointsPerFixture; 
                    pointIndex < (fixtureIndex * PrairieDmxController.PointsPerFixture) + PrairieDmxController.PointsPerFixture; 
                    ++pointIndex) 
            {
                points[pointIndex].SetColor(ColorBlend.BlendColors(blendColor,points[pointIndex].CurColor,BlendSettings.BlendMode));
            }
        }
    }
}
