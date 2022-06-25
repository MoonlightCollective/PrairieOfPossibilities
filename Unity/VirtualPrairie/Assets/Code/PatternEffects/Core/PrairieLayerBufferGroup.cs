using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using PygmyMonkey.ColorPalette;
using UnityEngine;

public enum EBufferClearType
{
	ClearBlack,
	ClearColor,
	Decay,
}

public class PrairieLayerBufferGroup : PrairieLayerGroup
{
	public PrairieLayerGroup ParentGroup;	

	[Header("Blend Settings")]
	public LayerBlendSettings BlendSettings;
	
	[Header("Filter/Color")]
	public PatternPointFilterBase PointFilter;
	public ColorizeBrightnessValue ColorizeSettings;
	public bool ShadowParentColors = true;

	[Header("Buffer Behavior")]
	public EBufferClearType BufferClearType;
	
	[ShowIf("BufferClearType",EBufferClearType.ClearColor)]
	public Color ClearColor = Color.black;

	[ShowIf("BufferClearType",EBufferClearType.Decay)]
	public float DecayPerSec = 1.0f;


	public override ColorPaletteMix GroupColors => ShadowParentColors?ParentGroup.GroupColors:_paletteMixer.ActiveColors;

	public override float GroupAlpha => GroupSettings.GroupAlpha * ParentGroup.GroupAlpha;

	protected bool _bufferBuilt = false;
	List<StemColorManager> _bufferPoints = new List<StemColorManager>();

	Transform _bufferRoot = null;

	public override void Start()
	{
		base.Start();
		if (!_bufferBuilt)
			buildBuffer();
	}

	public override void Awake()
	{
		base.Awake();
		_paletteMixer = GetComponent<ColorPaletteMixer>();
	}

	//===============
	// Update - update all our patterns.
	//===============
	public override void Update()
	{
		if (!GroupSettings.Enabled)
		{
			return;
		}

		if (!_bufferBuilt || _bufferPoints.Count != PrairieUtil.Points.Count)
		{
			// if layout changed, rebuild proxy lights.
			buildBuffer();
		}


		// clear buffer based on clear settings (might not do a full clear)
		clearBuffer();

		// update our color palette
		updateGroupPalette();
		
		foreach (var layer in _layers)
		{
			if (layer.gameObject.activeInHierarchy)
			{
				layer.Run(Time.deltaTime * layer.TimeSettings.TimeMult, this, _bufferPoints);
			}
		}

		var mainPoints = PrairieUtil.Points;
		for(int i = 0; i < _bufferPoints.Count; i++)
		{
			if (PointFilter != null && !PointFilter.AllowPoint(_bufferPoints[i]))
			{
				continue;
			}
			
			Color srcColor = _bufferPoints[i].CurColor;
			if (ColorizeSettings != null && srcColor.a > 0)
			{
				float h,s,v;
				Color.RGBToHSV(srcColor,out h,out s, out v);
				srcColor = ColorizeSettings.ColorForBrightness(v*srcColor.a,this) * srcColor.a;
				srcColor.a = v*BlendSettings.LayerAlpha * GroupAlpha;
			}
			
			Color destColor = mainPoints[i].CurColor;

			mainPoints[i].SetColor(ColorBlend.BlendColors(srcColor,destColor,BlendSettings.BlendMode));
		}
	}
	
	//===============
	// Internal methods
	//===============

	protected void buildBuffer()
	{
		_bufferPoints.Clear();

		if (_bufferRoot != null)
		{
			foreach (Transform child in _bufferRoot)
			{
				GameObject.Destroy(child.gameObject);
			}
			_bufferRoot.DetachChildren();
		}
		else
		{
			_bufferRoot = new GameObject("BufferRoot").transform;
			_bufferRoot.SetParent(transform,false);
		}

		if (PrairieUtil.Points == null ||  PrairieUtil.Points.Count < 1)
			return;
		
		int count = PrairieUtil.Points.Count;
		foreach (var scm in PrairieUtil.Points)
		{
			StemColorManagerProxy proxy = new GameObject().AddComponent<StemColorManagerProxy>();
			proxy.Init(scm);
			proxy.transform.SetParent(_bufferRoot,false);
			_bufferPoints.Add(proxy);
		}

		_bufferBuilt = true;
	}

	void clearBuffer()
	{
		switch (BufferClearType)
		{
			case EBufferClearType.ClearBlack:
				clearToColor(Color.black);
				break;
			case EBufferClearType.ClearColor:
				clearToColor(ClearColor);
				break;
			case EBufferClearType.Decay:
				decayBuffer();
				break;
		}
	}

	void decayBuffer()
	{
		if (DecayPerSec == 0f)
		{
			// no clear.
			return; 
		}

		float subAmt = DecayPerSec * Time.deltaTime;
		Color subGrey = new Color(subAmt,subAmt,subAmt);
		foreach (var scm in _bufferPoints)
		{
			var newColor = scm.CurColor - subGrey;
			scm.SetColor(new Color(Mathf.Clamp01(newColor.r),Mathf.Clamp01(newColor.g),Mathf.Clamp01(newColor.b)));
		}
	}

	void clearToColor(Color clearColor)
	{
		foreach (var scm in _bufferPoints)
		{
			scm.SetColor(clearColor);
		}
	}

	// based on our settings, figure out which color palette we should be using.
	protected override void updateGroupPalette()
	{
		if (_paletteMixer == null)
		{
			Debug.LogError($"LayerGroup {gameObject.name} requires a color palette mixer!");
			ParentGroup.gameObject.AddComponent<ColorPaletteMixer>();
			_paletteMixer = ParentGroup.GetComponent<ColorPaletteMixer>();
		}
	}
}