using System.Collections;
using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering.Universal;

//
// StemColorManager represents a single DmxPoint that effects one or more light stems (fibers).
//  Handles DMX->color conversions, and making sure all appropriate materials are set.
//  Pulls from some global settings for things like glow intensity, etc.  This is basically
//  a single POINT of LXStudio, but rendered as a fiber.
//
public class StemColorManager : DmxColorPoint
{
	public List<Material> Materials = new List<Material>();
	public Material GlowMat;
	private List<Material> _groundGlowMats = new List<Material>();
	Color _curColor = Color.black;
	public Color CurColor => _curColor;

	private Transform _rootTransform;

	// 
	// SetColor - set colors in the instanced materials for all mesh renderers associated with me.
	// 
	public void SetColor(Color newColor)
	{
		_curColor = newColor;
	}

	public void ApplyColorToMats()
	{
		float glow = GlobalPlantSettings.Instance.GlowIntensity;
		float stemAlpha = GlobalPlantSettings.Instance.StemAlpha;

		Color glowColor = new Color(_curColor.r * glow, _curColor.g * glow, _curColor.b * glow, stemAlpha);
		Color mainColor = new Color(_curColor.r, _curColor.g, _curColor.b, stemAlpha);
		foreach (var mat in Materials)
		{
			mat.SetColor("MainColor", _curColor);
			mat.SetColor("GlowColor", glowColor);
			mat.SetFloat("GlowIntensity",glow);
		}
		foreach (var gp in _groundGlowMats)
		{
			gp.SetColor("_GlowColor",new Color(mainColor.r,mainColor.g,mainColor.b,GlobalPlantSettings.Instance.GroundGlowAlpha));
		}
	}


	public void ApplyColorToDmx()
	{
		// the controller is null if DMX is turned off
		if (this.Controller != null)
		{
			// tell the dmx controller about the color change
			this.Controller.SetDmxColor(_curColor, this.Host, this.Universe, this.LocalPointIndex);
		}
	}

	public void LateUpdate()
	{
		ApplyColorToMats();
		ApplyColorToDmx();
		SetColor(Color.black);
	}

	//
	// SetFromDmxColor - calls Set Color using the data packet passed in new Data (rgb)
	// 
	public override void SetFromDmxColor(byte[] newData)
	{
		var settings = GlobalPlantSettings.Instance;
		float alpha = settings.StemAlpha;
		float glow = settings.GlowIntensity;
		_curColor = new Color(newData[0]/255f, newData[1]/255f, newData[2]/255f);
		SetColor(_curColor);
	}

	public override void SetFromDmxColor(ArraySegment<byte> newData)
	{
		var settings = GlobalPlantSettings.Instance;
		float alpha = settings.StemAlpha;
		float glow = settings.GlowIntensity;
		int offset = newData.Offset;
		_curColor = new Color(newData.Array[offset]/255f, newData.Array[offset+1]/255f, newData.Array[offset+2]/255f);
		SetColor(_curColor);
	}

	//
	// InitMaterials() - this happens separately from the construction, because we only want 
	//  				 to do this at runtime.  Find all our materials.
	//
	public void InitMaterials()
	{
		var meshes = transform.GetComponentsInChildren<MeshRenderer>();
		foreach (var mesh in meshes)
		{
			Materials.Add(mesh.material);
		}

		foreach (Transform child in transform)
		{
			var dp = child.GetComponent<DecalProjector>();
			if (dp != null)
			{
				dp.material = new Material(GlowMat);
				_groundGlowMats.Add(dp.material);
			}
		}
	}

	public float azimuth
	{
		get
		{		
			return (float) ((2*Mathf.PI + Mathf.Atan2(this.gameObject.transform.position.z, this.gameObject.transform.position.x)) % (2*Mathf.PI));
		}
	}

	public float theta
	{
		get
		{
			return (float) ((2*Mathf.PI + Mathf.Atan2(this.gameObject.transform.position.z, this.gameObject.transform.position.x)) % (2*Mathf.PI));
		}
	}
}