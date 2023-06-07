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
		_localThetaNorm = _realStem.LocalThetaNorm;
		_localRadius = _realStem.LocalRadius;

		Tags = new List<PrairieTag>(_realStem.Tags);
	}

	public override bool HasArmTagID(EArmTagType type, int id)
	{
		//	return _realStem.HasArmTagID(type,id);
		int armID = (int)(_globalAzimuth / 10.0f) + 1;
		return (id == armID);
	}

	public override bool HasTag(string tagName, bool fuzzyMatch = false)
	{
		return _realStem.HasTag(tagName, fuzzyMatch);
	}

	public override int PrimaryArmTagId(EArmTagType type)
	{
        // return _realStem.PrimaryArmTagId(type);
        int armID = (int)(_globalAzimuth / 10.0f) + 1;
		return armID;
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

public enum EArmTagType 
{
	ArmCW,
	ArmCCW,
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
	protected HashSet<string> _hashTags = new HashSet<string>();
	
	protected Dictionary<EArmTagType,HashSet<int>>_armTags = new Dictionary<EArmTagType, HashSet<int>>();
	protected Dictionary<EArmTagType,int> _primaryArmTags = new Dictionary<EArmTagType, int>();
	public int RingId = -1;

	int _mainPropId = -1;
	int _glowPropId = -1;
	int _glowIntensityPropId = -1;
	int _groundGlowPropId = -1;
	
	// 
	// SetColor - set colors in the instanced materials for all mesh renderers associated with me.
	// 
	public virtual void SetColor(Color newColor)
	{
		_curColor = newColor;
	}

	public virtual void ApplyColorToMats()
	{
		if (GlobalPlantSettings.Instance.VisualsSkipThisFrame)
			return;
		
		float glow = GlobalPlantSettings.Instance.GlowIntensity;
		float stemAlpha = GlobalPlantSettings.Instance.StemAlpha;
		float Brightness = GlobalPlantSettings.Instance.Brightness;
		Color glowColor = new Color(_curColor.r * glow, _curColor.g * glow, _curColor.b * glow, stemAlpha);
		Color mainColor = new Color(_curColor.r * Brightness, _curColor.g * Brightness, _curColor.b * Brightness, stemAlpha);
		foreach (var mat in Materials)
		{
			mat.SetColor(_mainPropId, mainColor);
			// mat.SetColor(_glowPropId, glowColor);
			// mat.SetFloat(_glowIntensityPropId, glow);
			// mat.SetColor("MainColor", mainColor);
			// mat.SetColor("GlowColor", glowColor);
			// mat.SetFloat("GlowIntensity",glow);
		}
		foreach (var gp in _groundGlowMats)
		{
			// gp.SetColor("_GlowColor",new Color(mainColor.r,mainColor.g,mainColor.b,GlobalPlantSettings.Instance.GroundGlowAlpha));
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
		foreach (EArmTagType tagType in Enum.GetValues(typeof(EArmTagType)))
		{
			_armTags[tagType] = new HashSet<int>();
			_primaryArmTags[tagType] = -1;
			// Debug.Log("init Arm type:" + tagType);
		}
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
			transform.hasChanged = false;
		}
	}
	

	public virtual void ForceUpdateCachedVals()
	{
		updateCachedVals();
	}

	protected virtual void updateCachedVals()
	{
		// Debug.Log("ucv");
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

		// Vector2 localPos = transform.localPosition * -100.0f;
		_xzVect = new Vector2(transform.position.x,transform.position.z);
		_globalDistFromOrigin = transform.position.magnitude;
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
		if (Materials.Count > 0)
		{
			_mainPropId = Shader.PropertyToID("MainColor");
			_glowPropId = Shader.PropertyToID("GlowColor");
			_glowIntensityPropId = Shader.PropertyToID("GlowIntensity");
			_groundGlowPropId = Shader.PropertyToID("_GlowColor");
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

	public virtual bool HasTag(string tagName, bool fuzzyMatch = false)
	{
		if (fuzzyMatch)
		{
			// THIS IS SLOW - Only Use during INIT sequence or AUTHORING.
			foreach (var t in Tags)
			{
				if (t.Name.Contains(tagName))
					return true;
			}
			return false;
		}

		return _hashTags.Contains(tagName);
	}

	public virtual bool HasArmTagID(EArmTagType type, int id)
	{
        // return _armTags[type].Contains(id);
        int armID = (int)(_globalAzimuth / 10.0f) + 1;
		return armID == id;
    }

    public virtual int PrimaryArmTagId(EArmTagType type)
	{
        // return _primaryArmTags[type];
        int armID = (int)(_globalAzimuth / 10.0f) + 1;
        return armID;

    }

    // public bool HasArmTagId(int tagId, bool CW)

    public void AddTag(PrairieTag newTag)
	{
		if (!HasTag(newTag.Name))
		{
			Tags.Add(newTag);
			_hashTags.Add(newTag.Name);
		}

		if (newTag.Name.Contains("Arm"))
		{
			addArmTag(newTag.Name);
		}

		if (newTag.Name.Contains("Ring"))
		{
			addRingTag(newTag.Name);
		}
	}

	EArmTagType armTypeFromTagName(string tagName)
	{
		if (tagName.Contains("CCW"))
		{
			return EArmTagType.ArmCCW;
		}
		else
		{
			return EArmTagType.ArmCW;
		}
	}

	void addArmTag(string tagName)
	{
		var startDex = tagName.IndexOf("Arm");
		var armIdStr = tagName.Substring(startDex+3,tagName.Length-(3+startDex));
		int id = -1;
		if (Int32.TryParse(armIdStr,out id))
		{
			EArmTagType tagType = armTypeFromTagName(tagName);
			_armTags[tagType].Add(id);
			_primaryArmTags[tagType] = id;
			// Debug.Log($"Applied arm tag type:{tagType}, id:{id}");
		}
	}

	void addRingTag(string tagName)
	{
		Debug.Log($"Adding ring tag {tagName}");
		var startDex = tagName.IndexOf("Ring");
		var ringIdStr = tagName.Substring(startDex+4,tagName.Length-(4+startDex));
		int id = -1;
		if (Int32.TryParse(ringIdStr,out id))
		{
			this.RingId = id;
		}
	}

	public void AddTag(string newTagName)
	{
		if (!HasTag(newTagName))
		{
			Tags.Add(new PrairieTag(newTagName));
			_hashTags.Add(newTagName);
		}
		
		if (newTagName.Contains("Arm"))
		{
			addArmTag(newTagName);
		}

		if (newTagName.Contains("Ring"))
		{
			addRingTag(newTagName);
		}
	}

	public void RemoveTag(string tagName)
	{
		if (HasTag(tagName))
		{
			Tags.RemoveAll(tagObj=>tagObj.Name==tagName);
			_hashTags.Remove(tagName);
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