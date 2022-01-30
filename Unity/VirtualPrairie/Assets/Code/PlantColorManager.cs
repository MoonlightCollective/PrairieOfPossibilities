using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[System.Serializable]
public class StalkColorManager
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

	public void InitFromStalk(Transform stalkT)
	{
		var meshes = stalkT.GetComponentsInChildren<MeshRenderer>();
		foreach (var mesh in meshes)
		{
			Materials.Add(mesh.material);
		}
	}
}

public class PlantColorManager : MonoBehaviour
{
	[Header("Debug")]
	public bool DoDebugRainbow = true;
	public float DebugRainbowCycleTime = 1.0f;
	public float DebugBrightness = 1.0f;
	public Color DebugStaticColor = Color.red;

	[Header("Glow")]
	public float GlowIntensity = 1.0f;
	public float StalkAlpha = 1.0f;
	protected List<StalkColorManager> StalkColors = new List<StalkColorManager>();

	float _colorOffset = 0.0f;


	public void Awake()
	{
		_colorOffset = Random.RandomRange(0,1f);
		_colorOffset = transform.position.x;
		foreach (Transform child in transform)
		{
			if (child.gameObject.name.Contains("Stalk"))
			{
				var s = new StalkColorManager();
				s.InitFromStalk(child);
				StalkColors.Add(s);
			}
		}
	}

	float _debugSwirlAlpha = 0;

	public void Start()
	{

	}
	
	public void Update()
	{
		_debugSwirlAlpha += Time.deltaTime / DebugRainbowCycleTime;
		while (_debugSwirlAlpha > 1.0f)
		{
			_debugSwirlAlpha -= 1f;
		}

		DebugStaticColor = Color.HSVToRGB(_debugSwirlAlpha,1f,1.5f,true);

		float offset = 0;

		foreach (var s in StalkColors)
		{
			Color c = Color.HSVToRGB(Mathf.Repeat(offset + _colorOffset + _debugSwirlAlpha,1.0f), 1.0f, DebugBrightness,true);
			s.SetColor(c, GlowIntensity, StalkAlpha);
			offset += .02f;
		}
	}

}
