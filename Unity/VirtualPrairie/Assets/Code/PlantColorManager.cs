using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[System.Serializable]
public class StemColorManager
{
	public List<Material> Materials = new List<Material>();
	public void SetColor(Color color, float GlowIntensity, float Alpha)
	{
		Color mainColor = new Color(color.r,color.g,color.b,Alpha);
		foreach (var mat in Materials)
		{
			mat.SetColor("MainColor",mainColor);
			mat.SetColor("GlowColor",color);
			mat.SetFloat("GlowIntensity",GlowIntensity);
		}
	}

	public void InitFromStem(Transform stemTrans)
	{
		var meshes = stemTrans.GetComponentsInChildren<MeshRenderer>();
		foreach (var mesh in meshes)
		{
			Materials.Add(mesh.material);
		}
	}
}

public class PlantColorManager : MonoBehaviour
{
	protected List<StemColorManager> StemColors = new List<StemColorManager>();
	float _colorOffset = 0.0f;

	public void Awake()
	{
		// _colorOffset = Random.RandomRange(0,1f);
		_colorOffset = transform.position.x;
		foreach (Transform child in transform)
		{
			if (child.gameObject.name.Contains("Stalk"))
			{
				var s = new StemColorManager();
				s.InitFromStem(child);
				StemColors.Add(s);
			}
		}
	}

	float _debugSwirlAlpha = 0;

	public void Start()
	{

	}
	
	public void Update()
	{
		var settings = GlobalPlantSettings.Instance;

		if (settings.DebugRainbow)
		{
			_debugSwirlAlpha += Time.deltaTime / settings.DebugRainbowCycleTime;
			while (_debugSwirlAlpha > 1.0f)
			{
				_debugSwirlAlpha -= 1f;
			}

			Color c = new Color();
			float offset = 0;

			foreach (var s in StemColors)
			{
				c = Color.HSVToRGB(Mathf.Repeat(offset + _colorOffset + _debugSwirlAlpha,1.0f), 1.0f, settings.Brightness,true);
				s.SetColor(c, settings.GlowIntensity, settings.StemAlpha);
				offset += .02f;
			}
		}
	}

}
