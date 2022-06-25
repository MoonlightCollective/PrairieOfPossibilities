using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using UnityEngine;

public class ColorizeParticlesToPalette : MonoBehaviour
{
	public PrairieLayerGroup PaletteSourceGroup;
	
	public enum EParticleColorizeMode
	{
		SingleColor,
		Gradient,
		RandomPair,
		ColorOverLifetime,
		ColorOverLifetimeWithAlphaRamp,
	}	
	
	public EParticleColorizeMode ColorMode = EParticleColorizeMode.SingleColor;
	
	public SmartColorSlot Color0;
	public SmartColorSlot Color1;

	public float Alpha0 = 1f;
	public float Alpha1 = 0f;

	ParticleSystem _particleSystem;

	public void Awake()
	{
		_particleSystem = GetComponentInChildren<ParticleSystem>();
	
	}
    // Update is called once per frame
    void Update()
    {
		if (_particleSystem == null)
			return;
		
		var mainMod = _particleSystem.main;
		var gradient = new ParticleSystem.MinMaxGradient();
		switch (ColorMode)
		{
			case EParticleColorizeMode.SingleColor:
				gradient.mode = ParticleSystemGradientMode.Color;
				gradient.color = Color0.Color(PaletteSourceGroup);
				mainMod.startColor = gradient;
				break;
			case EParticleColorizeMode.Gradient:
				gradient.mode = ParticleSystemGradientMode.Gradient;
				gradient.colorMin = Color0.Color(PaletteSourceGroup);
				gradient.colorMax = Color1.Color(PaletteSourceGroup);
				mainMod.startColor = gradient;
				break;
			case EParticleColorizeMode.RandomPair:
				gradient.mode = ParticleSystemGradientMode.TwoColors;
				gradient.colorMin = Color0.Color(PaletteSourceGroup);
				gradient.colorMax = Color1.Color(PaletteSourceGroup);
				mainMod.startColor = gradient;
				break;
			case EParticleColorizeMode.ColorOverLifetime:
			{
				Gradient grad = new Gradient();
				var col = _particleSystem.colorOverLifetime;
				grad.SetKeys( new GradientColorKey[] { new GradientColorKey(Color0.Color(PaletteSourceGroup),0f), new GradientColorKey(Color1.Color(PaletteSourceGroup),1f) },
							  col.color.gradient.alphaKeys );
				col.color = grad;
				gradient.mode = ParticleSystemGradientMode.Color;
				mainMod.startColor = Color.white;
				break;
			}
			case EParticleColorizeMode.ColorOverLifetimeWithAlphaRamp:
			{
				float startAlpha = Alpha0;
				float endAlpha = Alpha1;
				Gradient grad = new Gradient();
				grad.SetKeys( new GradientColorKey[] { new GradientColorKey(Color0.Color(PaletteSourceGroup),0f), new GradientColorKey(Color1.Color(PaletteSourceGroup),1f) },
							  new GradientAlphaKey[] { new GradientAlphaKey(startAlpha,0f), new GradientAlphaKey(endAlpha,1f)});
				var col = _particleSystem.colorOverLifetime;
				col.color = grad;
				gradient.mode = ParticleSystemGradientMode.Color;
				mainMod.startColor = Color.white;
				break;
			}
		}
    }
}
