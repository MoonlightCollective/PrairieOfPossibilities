using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PrairieParticlePool
{
	protected List<PrairieParticleBase> _freeParticles = new List<PrairieParticleBase>();
	protected List<PrairieParticleBase> _activeParticles = new List<PrairieParticleBase>();
	public IList<PrairieParticleBase> ActiveParticles => _activeParticles.AsReadOnly();

	public void InitializePool(int poolSize, GameObject particlePrefab, Transform parentRoot, PrairieParticleSettings settings)
	{
		_freeParticles.Clear();
		_activeParticles.Clear();

		if (particlePrefab.GetComponent<PrairieParticleBase>() == null)
		{
			Debug.LogError($"Tried to allocate particle pool, but prefab {particlePrefab.name} is not a Prairie Particle!");
			return;
		}
		
		for (int i = 0; i < poolSize; i++)
		{
			GameObject go = GameObject.Instantiate(particlePrefab,Vector3.zero,Quaternion.identity);
			var ppb = go.GetComponent<PrairieParticleBase>();
			ppb.gameObject.SetActive(false);
			ppb.transform.SetParent(parentRoot,false);
			ppb.transform.localPosition = Vector3.zero;
			ppb.InitParticle(settings);

			_freeParticles.Add(ppb);
		}
	}

	public PrairieParticleBase NewInstance(bool activateObject = true)
	{
		if (_freeParticles.Count < 1)
		{
			Debug.Log($"Particle pool is empty! {_activeParticles.Count} active particles");
			return null;
		}

		var ppb = _freeParticles[0];
		_freeParticles.RemoveAt(0);
		_activeParticles.Add(ppb);
		ppb.gameObject.SetActive(activateObject);
		return ppb;
	}

	public int UpdateActiveParticles(float deltaTime, PrairieLayerGroup group)
	{
		List <PrairieParticleBase> _finishedList = new List<PrairieParticleBase>();
		foreach (var p in _activeParticles)
		{
			p.UpdateParticle(deltaTime,group);
			if (!p.IsRunning)
				_finishedList.Add(p);
		}

		foreach (var p in _finishedList)
		{
			// Debug.Log("Freeing:" + p.name);
			FreeInstance(p);
		}
		
		return _activeParticles.Count;
	}


	public void FreeInstance(PrairieParticleBase part)
	{
		if (_activeParticles.Contains(part))
			_activeParticles.Remove(part);
		
		_freeParticles.Add(part);
		part.gameObject.SetActive(false);
	}
}
