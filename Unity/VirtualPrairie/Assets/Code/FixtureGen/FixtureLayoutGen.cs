using System.Collections;
using UnityEngine;

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

	public void Awake()
	{
		_gridLayout = GetComponent<FixtureLayoutGrid>();
		_ringLayout = GetComponent<FixtureLayoutRings>();
		LoadLayoutSettings();
	}


	public void GenerateLayout(GameObject parentObj)
	{
		switch (Algorithm)
		{
			case EFixtureLayoutAlgorithm.Grid:
				_gridLayout = GetComponent<FixtureLayoutGrid>();
				_gridLayout.GenerateLayout(parentObj,FixturePrefab);
				break;
			case EFixtureLayoutAlgorithm.Rings:
				_ringLayout = GetComponent<FixtureLayoutRings>();
				_ringLayout.GenerateLayout(parentObj,FixturePrefab);
				break;
			default:

			break;
		}
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
}