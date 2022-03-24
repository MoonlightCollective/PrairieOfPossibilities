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
	public GameObject PortalPrefab;
	public GameObject BoothPrefab;
	
	protected FixtureLayoutGrid _gridLayout;
	public FixtureLayoutGrid GridLayout => _gridLayout;

	protected FixtureLayoutRings _ringLayout;
	public FixtureLayoutRings RingsLayout => _ringLayout;

	protected FixtureLayoutSunflower _sunflowerLayout;
	public FixtureLayoutSunflower SunflowerLayout => _sunflowerLayout;

	protected FixtureLayoutImport _importLayout;
	public FixtureLayoutImport ImportLayout => _importLayout;

	protected PropLayout _propLayout;
	public PropLayout PropLayout => _propLayout;

	public UnityEvent<FixtureLayoutGen> OnNewLayout;


	protected float _minDistFromOrigin = 0f;
	public float MinDistFromOrigin => _minDistFromOrigin;
	protected float _maxDistFromOrigin = 0f;
	public float MaxDistFromOrigin => _maxDistFromOrigin;

	protected Vector3[] _clearings = new Vector3[6];
	public Vector3[] Clearings => _clearings;

	public void Awake()
	{
		_gridLayout = GetComponent<FixtureLayoutGrid>();
		_ringLayout = GetComponent<FixtureLayoutRings>();
		_sunflowerLayout = GetComponent<FixtureLayoutSunflower>();
		_importLayout = GetComponent<FixtureLayoutImport>();
		_propLayout = GetComponent<PropLayout>();
		LoadLayoutSettings();
	}

	public void Start()
	{
		// first create clearings for the 4 portals

		float clearing_distance = 80; // put portals 100' out
		float clearing_angle = 0;
		float angle_offset = Mathf.PI / 2; // 90 degrees

		_clearings[0] = new Vector3(clearing_distance * Mathf.Cos(clearing_angle), 0, clearing_distance * Mathf.Sin(clearing_angle));
		clearing_angle += angle_offset;

		_clearings[1] = new Vector3(clearing_distance * Mathf.Cos(clearing_angle), 0, clearing_distance * Mathf.Sin(clearing_angle));
		clearing_angle += angle_offset;

		_clearings[2] = new Vector3(clearing_distance * Mathf.Cos(clearing_angle), 0, clearing_distance * Mathf.Sin(clearing_angle));
		clearing_angle += angle_offset;

		_clearings[3] = new Vector3(clearing_distance * Mathf.Cos(clearing_angle), 0, clearing_distance * Mathf.Sin(clearing_angle));

		// now create clearings for phone booths

		clearing_distance = 50; // put phone booths at 60' out
		clearing_angle = Mathf.PI * 3 / 4; // 45 degrees

		_clearings[4] = new Vector3(clearing_distance * Mathf.Cos(clearing_angle), 0, clearing_distance * Mathf.Sin(clearing_angle));
		clearing_angle += Mathf.PI; // add 180 degrees

		_clearings[5] = new Vector3(clearing_distance * Mathf.Cos(clearing_angle), 0, clearing_distance * Mathf.Sin(clearing_angle));

		var root = PrairieUtil.GetLayoutRoot();
		GenerateLayout(root);

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

		// add portals and booths
		_propLayout.GenerateLayout(rootObj, PortalPrefab, BoothPrefab);

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