using System.Collections;
using UnityEngine;
using UnityEngine.Events;
public enum EFixtureLayoutAlgorithm
{
	Grid,
	Rings,
	Sunflower,
}

//
// FixtureLayoutGen - doesn't do the actual generation, but gives access to 
// 						layout algorithms. Called from either the editor UI
//						or the app/game itself.
//
public class FixtureLayoutGen : MonoBehaviour
{
	public EFixtureLayoutAlgorithm Algorithm;
	public GameObject FixturePrefab;
	
	protected FixtureLayoutGrid _gridLayout;
	public FixtureLayoutGrid GridLayout => _gridLayout;

	protected FixtureLayoutRings _ringLayout;
	public FixtureLayoutRings RingsLayout => _ringLayout;

	protected FixtureLayoutSunflower _sunflowerLayout;
	public FixtureLayoutSunflower SunflowerLayout => _sunflowerLayout;

	protected FixtureLayoutImport _importLayout;
	public FixtureLayoutImport ImportLayout => _importLayout;

	public UnityEvent<FixtureLayoutGen> OnNewLayout;


	protected float _minDistFromOrigin = 0f;
	public float MinDistFromOrigin => _minDistFromOrigin;
	protected float _maxDistFromOrigin = 0f;
	public float MaxDistFromOrigin => _maxDistFromOrigin;

	public void Awake()
	{
		_gridLayout = GetComponent<FixtureLayoutGrid>();
		_ringLayout = GetComponent<FixtureLayoutRings>();
		_sunflowerLayout = GetComponent<FixtureLayoutSunflower>();
		_importLayout = GetComponent<FixtureLayoutImport>();
		LoadLayoutSettings();
	}

	public void Start()
	{
		updateLayoutStats();
		OnNewLayout?.Invoke(this);
	}

	public void GenerateLayout(GameObject rootObj)
	{
		switch (Algorithm)
		{
			case EFixtureLayoutAlgorithm.Grid:
				_gridLayout = GetComponent<FixtureLayoutGrid>();
				_gridLayout.GenerateLayout(rootObj,FixturePrefab);
				break;
			case EFixtureLayoutAlgorithm.Rings:
				_ringLayout = GetComponent<FixtureLayoutRings>();
				_ringLayout.GenerateLayout(rootObj,FixturePrefab);
				break;
			case EFixtureLayoutAlgorithm.Sunflower:
				_sunflowerLayout = GetComponent<FixtureLayoutSunflower>();
				_sunflowerLayout.GenerateLayout(rootObj,FixturePrefab);
				break;
			default:
				break;
		}

		updateLayoutStats();
		OnNewLayout?.Invoke(this);
	}

	public void DoImportLayout(GameObject rootObj, string fileName, bool fromEditor = false)
	{
		if (fromEditor)
			_importLayout = GetComponentInChildren<FixtureLayoutImport>();

		_importLayout.JsonFilePath = fileName;
		_importLayout.GenerateLayout(rootObj,FixturePrefab);
		updateLayoutStats();
		OnNewLayout?.Invoke(this);
	}

	public void SaveLayoutSettings()
	{
		Debug.Log("SaveLayoutSettings");
		_gridLayout.SaveSettings();
		_ringLayout.SaveSettings();
	}

	public void LoadLayoutSettings()
	{
		Debug.Log("LoadLayoutSettings");
		_gridLayout = GetComponent<FixtureLayoutGrid>();
		_ringLayout = GetComponent<FixtureLayoutRings>();
		_sunflowerLayout = GetComponent<FixtureLayoutSunflower>();
		_gridLayout.LoadSettings();
		_ringLayout.LoadSettings();
		_sunflowerLayout?.LoadSettings();
	}

	void updateLayoutStats()
	{
		GameObject rootObj = PrairieUtil.GetLayoutRoot();
		_minDistFromOrigin = float.MaxValue;
		_maxDistFromOrigin = float.MinValue;

		if (rootObj != null)
		{
			foreach (Transform child in rootObj.transform)
			{
				float dist = Vector3.Distance(Vector3.zero,child.position);
				_minDistFromOrigin = Mathf.Min(_minDistFromOrigin,dist);
				_maxDistFromOrigin = Mathf.Max(_maxDistFromOrigin,dist);
			}
		}
	}
}