using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using NaughtyAttributes;

public class ParticlePattern : PrairiePatternLayer
{
	[Space]
	[Expandable]
	public ColorizeBrightnessValue ColorizeSettings;

	[Required]
	[ValidateInput("ValidateParticlePrefab","Must be a particle prefab!")]
	public GameObject ParticlePrefab;

	[MinValue(1)]
	[MaxValue(100)]
	public int PoolSize = 10;

	public PrairieParticleSettings ParticleSettings;

	public bool SlowInitParticles = false;

	protected PrairieParticlePool _particlePool;
	protected Transform _particleRoot;

	// Start is called before the first frame update
	void Start()
    {
		_particlePool = new PrairieParticlePool();
		_particleRoot = new GameObject("Particles").transform;
		_particleRoot.SetParent(transform,false);
		_particleRoot.transform.localPosition = Vector3.zero;
		_particlePool.InitializePool(PoolSize,ParticlePrefab,_particleRoot,ParticleSettings);
    }

	public override void Run(float deltaTime, PrairieLayerGroup group, List<StemColorManager> points)
	{
		if (_particlePool == null)
			return;
		
		_particlePool.UpdateActiveParticles(deltaTime * TimeSettings.TimeMult,group);
		bool colorize = (ColorizeSettings != null);
		
		float layerAlpha = BlendSettings.LayerAlpha * group.GroupAlpha;


		foreach (var point in points)
		{
			if (!filterAllowPoint(point))
			{
				continue;
			}

			Color pointC = Color.black;
			pointC.a = 0f;

			foreach (var part in _particlePool.ActiveParticles)
			{
				Color c = part.ColorForPoint(point);
				if (colorize)
				{
					float b = c.r; // assume monochrome, use red channel as brightness
					c = ColorizeSettings.ColorForBrightness(c.r,group);
					c.a = b;
				}

				pointC = ColorBlend.BlendColors(c,pointC,ColorBlend.EBlendMode.AlphaBlend);
			}

			pointC.a *= layerAlpha;
			point.SetColor(ColorBlend.BlendColors(pointC,point.CurColor,BlendSettings.BlendMode));
		}
	}

	public virtual void EmitParticle()
	{
		var p = _particlePool.NewInstance(true);
		if (p == null)
		{
			Debug.LogWarning($"{gameObject.name} - particle pool too small {this.PoolSize} - couldn't emit particle");
			return;
		}
		
		if (SlowInitParticles)
		{
			p.InitParticle(ParticleSettings);
		}
		p.ResetParticle();
	}
}
