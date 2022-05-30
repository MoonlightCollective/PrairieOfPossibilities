using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RadialTransformMod : ParticleTransformMod
{
	public float TravelSpeed = 10.0f;
	Vector2 _travelDir = Vector2.zero;
	
	public override void ResetParticle(PrairieParticleBase particle) 
	{ 
		Vector2 localPosXZ = PrairieUtil.XZVector2(particle.transform.localPosition);
		if (localPosXZ.magnitude < 0.001)
		{
			_travelDir = Random.insideUnitCircle.normalized;
			// Debug.Log($"random dir: {_travelDir}");
		}
		else
		{
			_travelDir = localPosXZ.normalized;
		}
	}

	public override void UpdateTransform(PrairieParticleBase particle, float deltaTime, PrairieLayerGroup group)
	{
		transform.Translate(PrairieUtil.XZVector3(_travelDir * TravelSpeed * Time.deltaTime));
	}
}
