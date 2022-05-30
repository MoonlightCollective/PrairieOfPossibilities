using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class ParticleTransformMod : MonoBehaviour
{
	public abstract void ResetParticle(PrairieParticleBase particle);
	public abstract void UpdateTransform(PrairieParticleBase particle, float deltaTime, PrairieLayerGroup group);
}
