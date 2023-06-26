using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PrairieGlobals : MonoBehaviour
{
	private static PrairieGlobals s_instance;

	public static PrairieGlobals Instance
	{
		get 
		{
			if (s_instance == null)
				s_instance = GameObject.FindObjectOfType<PrairieGlobals>();
			
			return s_instance;
		}
	}

	private SceneLoader _sceneLoader = null;
	public SceneLoader SceneLoader
    {
		get
        {
			if (_sceneLoader == null)
            {
				_sceneLoader = GameObject.FindObjectOfType<SceneLoader>();
				if (_sceneLoader == null)
                {
					Debug.LogError("Unable to find global scene loader");
                }
            }
			return _sceneLoader;
        }
    }

	private FmodMusicPlayer _fmp = null;
	public FmodMusicPlayer MusicPlayer
	{
		get {
			if (_fmp == null)
			{
				_fmp = GameObject.FindObjectOfType<FmodMusicPlayer>();
				if (_fmp == null)
				{
					Debug.LogError("Unable to find global music player");
				}
			}
			return _fmp;
		}
	}


	private PrairieMusicManager _musicManager = null;
	public PrairieMusicManager MusicManager
	{
		get 
		{
			if (_musicManager == null)
			{
				_musicManager = GameObject.FindObjectOfType<PrairieMusicManager>();
			}
			return _musicManager;
		}
	}

	private FixturePropLayout _propLayout = null;
	public FixturePropLayout PropLayoutRoot
	{
		get
		{
			if (_propLayout == null)
			{
				_propLayout = GameObject.FindObjectOfType<FixturePropLayout>();
			}
			return _propLayout;
		}
	}

	private FixtureLayoutGen _layoutGenObj = null;
	public FixtureLayoutGen LayoutGen
	{
		get
		{
			if (_layoutGenObj == null)
			{
				_layoutGenObj = GameObject.FindObjectOfType<FixtureLayoutGen>();
			}
			return _layoutGenObj;
		}
	}

	private WiredPathManager _wiredPathMgr = null;
	public WiredPathManager WiredPathManager
	{
		get
		{
			if (_wiredPathMgr == null)
			{
				_wiredPathMgr = GameObject.FindObjectOfType<WiredPathManager>();
			}
			return _wiredPathMgr;
		}
	}

	private PlantSelectionManager _plantSelectionManager;
	public PlantSelectionManager PlantSelectionManager
	{
		get
		{
			if (_plantSelectionManager == null)
			{
				_plantSelectionManager = GameObject.FindObjectOfType<PlantSelectionManager>();
			}

			return _plantSelectionManager;
		}
	}

	private PrairieWalkCam _walkCam;
	public PrairieWalkCam WalkCam
	{
		get
		{
			if (_walkCam == null)
				_walkCam = GameObject.FindObjectOfType<PrairieWalkCam>();
			
			return _walkCam;
		}
	}

	private Transform _cameraStopRoot = null;
	public Transform CameraStopRoot
	{
		get 
		{
			if (_cameraStopRoot == null)
				_cameraStopRoot = GameObject.Find("CameraStops").transform;
			
			return _cameraStopRoot;
		}
	}

	public void Awake()
	{
		s_instance = this;
	}

	const int kNumArms = 36;
	public int NumArms => kNumArms;

	const int kNumRings = 10;
	public int NumRings = kNumRings;
	
	// Start is called before the first frame update
	void Start()
	{
		
	}

	// Update is called once per frame
	void Update()
	{
		
	}
}
