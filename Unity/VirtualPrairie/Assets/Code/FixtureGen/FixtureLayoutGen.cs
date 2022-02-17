using System.Collections;
using UnityEngine;
using UnityEngine.Events;
public enum EFixtureLayoutAlgorithm
{
	Grid,
	Rings,
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

	protected FixtureLayoutImport _importLayot;
	public FixtureLayoutImport ImportLayout => _importLayot;

	public UnityEvent<FixtureLayoutGen> OnNewLayout;


	protected float _minDistFromOrigin = 0f;
	public float MinDistFromOrigin => _minDistFromOrigin;
	protected float _maxDistFromOrigin = 0f;
	public float MaxDistFromOrigin => _maxDistFromOrigin;

	public void Awake()
	{
		_gridLayout = GetComponent<FixtureLayoutGrid>();
		_ringLayout = GetComponent<FixtureLayoutRings>();
		_importLayot = GetComponent<FixtureLayoutImport>();
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
			default:
			break;
		}

		updateLayoutStats();
		OnNewLayout?.Invoke(this);
	}

	public void DoImportLayout(GameObject rootObj, string fileName, bool fromEditor = false)
	{
		if (fromEditor)
			_importLayot = GetComponentInChildren<FixtureLayoutImport>();

		_importLayot.JsonFilePath = fileName;
		_importLayot.GenerateLayout(rootObj,FixturePrefab);
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
		_gridLayout.LoadSettings();
		_ringLayout.LoadSettings();
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