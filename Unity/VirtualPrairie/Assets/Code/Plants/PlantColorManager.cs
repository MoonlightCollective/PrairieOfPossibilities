using System.Collections;
using System.Collections.Generic;
using UnityEngine;


//
// PlantColorManager = handles a full fixture of 7 lights - each light being a StemColorManager, which in turn may have multiple pieces of geometry to handle
//
public class PlantColorManager : WiredFixtureBase
{
	// you've got to set this up in Unity Editor.  
	public List<StemColorManager> StemColors = new List<StemColorManager>();
	public int PlantId = -1;
	public int PointRangeMin = -1;
	public int PointRangeMax = -1;
	public Material GlowMat;

	// material init has to happen before we can set any colors on our stems.
	private bool _initializedMaterials = false;

	// variables for the debug rainbow
	private float _debugSwirlAlpha = 0;
	private float _colorOffset = 0.0f;

	protected PlantSelectionHandler _selectionHandler;

	public void AssociatePointData(int localPointDex, string host, int universe, int globalPointDex)
	{
		if (StemColors == null || StemColors.Count < 1)
			findChildren();

		StemColors[localPointDex].Host = host;
		StemColors[localPointDex].Universe = universe;
		StemColors[localPointDex].LocalPointIndex = localPointDex;
		StemColors[localPointDex].GlobalPointIndex = globalPointDex;
		StemColors[localPointDex].gameObject.name = StemColors[localPointDex].gameObject.name + $"H{host}_U{universe}_gpd:{globalPointDex}";
		int minDex = 999;
		int maxDex = -1;

		foreach (var sc in StemColors)
		{
			if (sc.GlobalPointIndex < minDex)
				minDex = sc.GlobalPointIndex;

			if (sc.GlobalPointIndex > maxDex)
				maxDex = sc.GlobalPointIndex;
		}
		gameObject.name = $"Plant_{PlantId}_H{host}_U{universe}_PointRange_{minDex}-{maxDex}";
	}

	void findChildren()
	{
		foreach (Transform child in transform)
		{
			if (child.gameObject.name.Contains("Stalk"))
			{
				var scm = child.GetComponent<StemColorManager>();
				if (scm == null)
				{
					scm = child.gameObject.AddComponent<StemColorManager>();
				}

				scm.GlowMat = GlowMat;
				StemColors.Add(scm);
			}
		}
	}

	protected void initMaterials()
	{
		// _colorOffset = Random.Range(0,.05f);
		_colorOffset = Vector3.Distance(transform.position,Vector3.zero) / 100.0f;
		foreach (var stemCm in StemColors)
		{
			stemCm.InitMaterials();
		}
		
		_initializedMaterials = true;
	}


	public void Awake()
	{
		if (StemColors == null || StemColors.Count < 1)
			findChildren();
		
		if (!_initializedMaterials)
			initMaterials();

		_selectionHandler = GetComponentInChildren<PlantSelectionHandler>();
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


	public override void SetWireVisState(WiredPath.EPathVisState vis)
	{
		if (_selectionHandler == null)
			return;
		
		// Debug.Log("Set wire vis state:" + vis);
		switch (vis)
		{
			case WiredPath.EPathVisState.Hidden:
				_selectionHandler.ForceDeselect();
				break;
			case WiredPath.EPathVisState.Active:
				_selectionHandler.ForceSelect();
				break;
			case WiredPath.EPathVisState.Visible:
				_selectionHandler.ForceDeselect();
				break;
		}
	}

}
