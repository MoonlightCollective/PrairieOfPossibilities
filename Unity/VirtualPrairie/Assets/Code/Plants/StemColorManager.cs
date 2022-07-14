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

public class StemColorManagerProxy : StemColorManager
{
	protected StemColorManager _realStem;

	public override void Awake()
	{
		// normally updates cached values, but we aren't gonna do that until Init for a pro9xy.
	}

	public void Init(StemColorManager realStem)
	{
		_realStem = realStem;
		updateCachedVals();
	}

	protected override void updateCachedVals()
	{
		if (_realStem == null)
			return;

		_realStem.ForceUpdateCachedVals();
		
		transform.position = _realStem.transform.position;
		transform.localScale = _realStem.transform.localScale;
		transform.localRotation = _realStem.transform.localRotation;
		
		StemIndex = _realStem.StemIndex;
		_globalAzimuth = _realStem.GlobalAzimuth;
		_globalAzimuthNormalized = _realStem.GlobalAzimuthNormalized;
		_globalThetaNormalized = _realStem.GlobalThetaNormalized;
		_globalTheta = _realStem.GlobalTheta;
		_xzVect = _realStem.XZVect;
		_randomPointOffset = _realStem.RanomPointOffset;
		_parentFixture = _realStem.ParentFixture;
		_globalDistFromOrigin = _realStem.GlobalDistFromOrigin;
		_localTheta = _realStem.LocalTheta;
		_localRadius = _realStem.LocalRadius;
		Tags = new List<PrairieTag>(_realStem.Tags);
	}

	public override void ApplyColorToDmx()
	{
		// we don't really ever want to do this.
	}

	public override void ApplyColorToMats()
	{
		// we don't do anything here.
	}

	public override void SetColor(Color newColor)
	{
		// we have our own sense of color
		base.SetColor(newColor);
	}

	public override void LateUpdate()
	{
		// do NOTHING! Don't set DMX or anything. we just proxy the color.
		// updateCachedVals();
	}

	public override void SetFromDmxColor(ArraySegment<byte> newData)
	{
		/// nothing
	}
	public override void SetFromDmxColor(byte[] newData)
	{
		/// nothing.
	}

	public override void InitMaterials()
	{
		/// NOTHING!
	}

	
}


public class StemColorManager : DmxColorPoint
{
	public List<Material> Materials = new List<Material>();
	public Material GlowMat;
	private List<Material> _groundGlowMats = new List<Material>();
	Color _curColor = Color.black;
	public Color CurColor => _curColor;

	// set in the prefab!
	public int StemIndex = 0;

	private Transform _rootTransform;
	
	protected float _globalAzimuth = 0f;
	public float GlobalAzimuth => _globalAzimuth;
	protected float _globalAzimuthNormalized = 0f;
	public float GlobalAzimuthNormalized => _globalAzimuthNormalized;

	protected float _globalTheta = 0f;
	protected float _globalThetaNormalized = 0f;
	public float GlobalTheta => _globalThetaNormalized;
	public float GlobalThetaNormalized => _globalThetaNormalized;

	protected Vector2 _xzVect = Vector2.zero;
	public Vector2 XZVect => _xzVect;

	protected float _randomPointOffset = 1.0f;
	public float RanomPointOffset => _randomPointOffset;

	protected WiredFixtureBase _parentFixture;
	public WiredFixtureBase ParentFixture => _parentFixture;

	protected float _globalDistFromOrigin = 0f;
	public float GlobalDistFromOrigin => _globalDistFromOrigin;

	protected float _localTheta = 0f;
	public float LocalTheta => _localTheta;

	protected float _localThetaNorm = 0f;
	public float LocalThetaNorm => _localThetaNorm;

	protected float _localRadius = 0f;
	public float LocalRadius => _localRadius;

	public List<PrairieTag> Tags = new List<PrairieTag>();
	
	// 
	// SetColor - set colors in the instanced materials for all mesh renderers associated with me.
	// 
	public virtual void SetColor(Color newColor)
	{
		_curColor = newColor;
	}

	public virtual void ApplyColorToMats()
	{
		float glow = GlobalPlantSettings.Instance.GlowIntensity;
		float stemAlpha = GlobalPlantSettings.Instance.StemAlpha;
		float Brightness = GlobalPlantSettings.Instance.Brightness;
		Color glowColor = new Color(_curColor.r * glow, _curColor.g * glow, _curColor.b * glow, stemAlpha);
		Color mainColor = new Color(_curColor.r * Brightness, _curColor.g * Brightness, _curColor.b * Brightness, stemAlpha);
		foreach (var mat in Materials)
		{
			mat.SetColor("MainColor", mainColor);
			mat.SetColor("GlowColor", glowColor);
			mat.SetFloat("GlowIntensity",glow);
		}
		foreach (var gp in _groundGlowMats)
		{
			gp.SetColor("_GlowColor",new Color(mainColor.r,mainColor.g,mainColor.b,GlobalPlantSettings.Instance.GroundGlowAlpha));
		}
	}


	public virtual void ApplyColorToDmx()
	{
		// the controller is null if DMX is turned off
		if (this.Controller != null && 
			this.Universe != -1 &&
		    this.ChannelStart != -1)
		{
			// tell the dmx controller about the color change
			this.Controller.SetDmxColor(_curColor, this.Host, this.Universe, this.ChannelStart);
		}
	}

	public virtual void Awake()
	{
		updateCachedVals();
	}

	public virtual void LateUpdate()
	{
		checkForTransformChange();
		ApplyColorToMats();
		ApplyColorToDmx();
		SetColor(Color.black);
	}

	protected virtual void checkForTransformChange()
	{
		if (transform.hasChanged)
		{
			updateCachedVals();
		}
	}
	

	public virtual void ForceUpdateCachedVals()
	{
		updateCachedVals();
	}

	protected virtual void updateCachedVals()
	{
		_parentFixture = GetComponentInParent<WiredFixtureBase>();
		_globalAzimuth = azimuth * Mathf.Rad2Deg;
		_globalAzimuthNormalized = _globalAzimuth / 360f;
		_globalTheta = theta * Mathf.Rad2Deg;
		_globalThetaNormalized = _globalTheta / 360f;
		
		if (StemIndex < 5)
		{
			_localRadius = 0.25f;
			_localThetaNorm = ((float)StemIndex / (float)5);
		}
		else
		{
			_localRadius = 0.02f;
			_localThetaNorm = (StemIndex == 5)?0:.5f;
		}

		Vector2 localPos = transform.localPosition * -100.0f;

		_globalDistFromOrigin = transform.position.magnitude;
		_xzVect = new Vector2(_parentFixture.transform.position.x + localPos.x, _parentFixture.transform.position.z + localPos.y);
		_randomPointOffset = UnityEngine.Random.Range(0,1);
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
	public virtual void InitMaterials()
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

	public bool HasTag(string tagName)
	{
		foreach (var t in Tags)
		{
			if (t.Name == tagName)
				return true;
		}
		return false;
	}

	public void AddTag(PrairieTag newTag)
	{
		if (!HasTag(newTag.Name))
		{
			Tags.Add(newTag);
		}
	}

	public void AddTag(string newTagName)
	{
		if (!HasTag(newTagName))
		{
			Tags.Add(new PrairieTag(newTagName));
		}
	}

	public void RemoveTag(string tagName)
	{
		if (HasTag(tagName))
		{
			Tags.RemoveAll(tagObj=>tagObj.Name==tagName);
		}
	}

	public virtual float AzimuthRelativeTo(Vector3 centerPoint, bool normalized = false)
	{
		Vector3 offsetPos = transform.position - centerPoint;
		float azRad = (float) ((2*Mathf.PI + Mathf.Atan2(offsetPos.z, offsetPos.x)) % (2*Mathf.PI));
		if (normalized)
		{
			return (azRad * Mathf.Rad2Deg)/360.0f;
		}
		return azRad;
	}

	public virtual float ThetaRelativeTo(Vector3 centerPoint, bool normalized = false)
	{
		Vector3 offsetPos = transform.position-centerPoint;
		float thetaRad = (float) ((2*Mathf.PI + Mathf.Atan2(offsetPos.y, offsetPos.x)) % (2*Mathf.PI));
		if (normalized)
		{
			return (thetaRad * Mathf.Rad2Deg)/360;
		}
		return thetaRad;
	}

	protected virtual float azimuth
	{
		get
		{		
			return (float) ((2*Mathf.PI + Mathf.Atan2(this.gameObject.transform.position.z, this.gameObject.transform.position.x)) % (2*Mathf.PI));
		}
	}

	protected virtual float theta
	{
		get
		{
			return (float) ((2*Mathf.PI + Mathf.Atan2(this.gameObject.transform.position.y, this.gameObject.transform.position.x)) % (2*Mathf.PI));
		}
	}
}