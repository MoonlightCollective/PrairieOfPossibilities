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
	public int ChannelStart = -1;
	public string PathId = "None";
	
	protected List<PrairieTag> _fixtureTags = new List<PrairieTag>();
	public IEnumerable<PrairieTag> FixtureTags => _fixtureTags;

	// material init has to happen before we can set any colors on our stems.
	private bool _initializedMaterials = false;

	// variables for the debug rainbow
	private float _debugSwirlAlpha = 0;
	private float _colorOffset = 0.0f;

	protected PlantSelectionHandler _selectionHandler;

	// this is safe to call multiple times.   it will only find and load the child objects once
	public void FindChildren()
	{
		// Debug.Log("FindChildren");
		// have we already found the children?
		if (StemColors != null && StemColors.Count > 1)
		{
			applyDefaultTags();
			return;
		}

		if (StemColors == null)
			StemColors = new List<StemColorManager>();

		// nope, go find and load them.
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

		applyDefaultTags();
	}

	protected void applyDefaultTags()
	{
		foreach (var scm in StemColors)
		{
			if (scm.gameObject.name.Contains("Center"))
			{
				scm.AddTag("Inner");
			}
			else
			{
				scm.AddTag("Outer");
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


	public override void Awake()
	{
		base.Awake();
		
		FindChildren();
		
		if (!_initializedMaterials)
			initMaterials();

		_selectionHandler = GetComponentInChildren<PlantSelectionHandler>();
		if (_selectionHandler != null)
		{
			_selectionHandler.EnableHavePathVis(ParentPath != null);
			_selectionHandler.DisableFirstInPathVis();
		}
	}
	
	public void Start()
	{
		if (PlantSelectionManager.Instance.IsWiring())
			NotifyEnterWiringMode();
		else
			NotifyExitWiringMode();
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
				c = Color.HSVToRGB(Mathf.Repeat(offset + _colorOffset + _debugSwirlAlpha,1.0f), 1.0f, 1.0f,true);
				s.SetColor(c);
				offset += .02f;
			}
		}
	}

	public override void WireToPath(WiredPath path, int index = -1, int ChannelStartOverride = -1)
	{
		base.WireToPath(path, index);
		if (index == 0 && _selectionHandler != null)// might be null if we imported in the editor
			_selectionHandler.EnableFirstInPathVis();
		// update the dmx settings
		// make sure all the children are loaded
		FindChildren();
		// what channel does this fixture start at?  is there a channel override?
		if (ChannelStartOverride > 0)
		{
			ChannelStart = ChannelStartOverride;
			Debug.Log($"PlantColorManager.WireToPath fixture has ChannelStartOverride({ChannelStartOverride}), using it.");
		}
		// otherwise use the path start channel
		else 
		{
			ChannelStart = path.ChannelStart + (index*PrairieDmxController.ChannelsPerFixture);
			// did we overrun?
			if (ChannelStart > PrairieDmxController.MaxChannelStartPerUniverse)
			{
				// just handle a simple single universe overrun, assume a wire path is a single universe and will fit all fixtures
				ChannelStart -= PrairieDmxController.MaxChannelsPerUniverse;
				Debug.Log($"PlantColorManager.WireToPath handled path overrun, path.PathId({path.PathId}), index({index}), using ChannelStart({ChannelStart})");
			}
		}
		PathId = path.PathId;

		gameObject.name = $"Plant({this.PlantId})H({path.ArtnetHost})U({path.Universe})ChannelStart({ChannelStart})";
		// no go through the stems and set their details
		int stemChannelStart = ChannelStart;
		foreach (var stem in StemColors)
		{
			stem.Host = path.ArtnetHost;
			stem.Universe = path.Universe;
			stem.Generator = path.Generator;
			stem.ChannelStart = stemChannelStart;
			// jump to the next set of channels
			stemChannelStart += PrairieDmxController.ChannelsPerPoint;
		}
	}

	public override void RemoveFromPath()
	{
		base.RemoveFromPath();
		_selectionHandler?.DisableFirstInPathVis();
	}

	public override void NotifyEnterWiringMode()
	{
		base.NotifyEnterWiringMode();
		_selectionHandler?.EnableHavePathVis(ParentPath != null);
		if (ParentPath != null && _pathIndex == 0)
		{
			_selectionHandler.EnableFirstInPathVis();
		}
		else
		{
			_selectionHandler.DisableFirstInPathVis();
		}
	}

	public override void NotifyExitWiringMode()
	{
		base.NotifyExitWiringMode();
		_selectionHandler.DisableFirstInPathVis();
		_selectionHandler.DisableHavePathVis();
	}

	public void updateFirstInPathState()
	{
		if (IsWired && PathIndex == 0)
			_selectionHandler.EnableFirstInPathVis();
	}

	public override void SetWireVisState(WiredPath.EPathVisState vis)
	{
		if (_selectionHandler == null)
			return;
		
		if (PlantSelectionManager.Instance.IsWiring())
		{
			_selectionHandler.EnableHavePathVis(ParentPath != null);
		}
		else
		{
			_selectionHandler.DisableHavePathVis();
		}

		// Debug.Log("Set wire vis state:" + vis);
		switch (vis)
		{
			case WiredPath.EPathVisState.Hidden:
				_selectionHandler.DisableFirstInPathVis();
				_selectionHandler.ForceDeselect();
				break;
			case WiredPath.EPathVisState.Active:
				_selectionHandler.ForceSelect();
				updateFirstInPathState();
				break;
			case WiredPath.EPathVisState.Visible:
				_selectionHandler.ForceDeselect();
				updateFirstInPathState();
				break;
		}
	}

	public override string FixtureType => "PlantFixture";
	public override int FixtureId => PlantId;
	public override List<StemColorManager> FixtureStems()
	{
		return StemColors;
	}

	//===============
	// Tag management
	//===============
	public void AddFixtureTag(string newTag)
	{
		if (!HasFixtureTag(newTag))
		{
			_fixtureTags.Add(new PrairieTag{Name = newTag});
		}
		foreach (var scm in StemColors)
		{
			if (!scm.HasTag(newTag))
			{
				scm.AddTag(newTag);
			}
		}
	}

	public void AddFixtureTags(List<string> newTags)
	{
		foreach (var newTag in newTags)
		{
			AddFixtureTag(newTag);
		}
	}

	public bool HasFixtureTag(string tagName)
	{
		foreach (var ft in _fixtureTags)
		{
			if (ft.Name == tagName)
				return true;
		}
		return false;
	}

	public void RemoveFixtureTag(string tag)
	{
		if (HasFixtureTag(tag))
		{
			_fixtureTags.RemoveAll(tagObj=>tagObj.Name==tag);
		}
		foreach (var scm in StemColors)
		{
			if (scm.HasTag(tag))
			{
				scm.RemoveTag(tag);
			}
		}
	}
}
