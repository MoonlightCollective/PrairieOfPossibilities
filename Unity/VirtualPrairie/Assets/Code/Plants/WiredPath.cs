using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WiredPath : MonoBehaviour
{
	public string PathId = "Path";
	public string ArtnetHost = "127.0.0.1";
	public int Universe = 1;
	public int ChannelStart = 1;
	
	List<WiredFixtureBase> _fixtures = new List<WiredFixtureBase>();
	public List<WiredFixtureBase> Fixtures => _fixtures;

	public LineRenderer VisLineRender;

	public enum EPathVisState
	{
		Visible,
		Active,
		Hidden
	}

	EPathVisState _visState = EPathVisState.Hidden;
	public bool IsVisible => (_visState == EPathVisState.Visible);

	public void ClearPath()
	{
		disableLineRender();
		RemoveAllChildren();
		updateVisuals();
	}

	public void SetVisibility(EPathVisState newVis)
	{
		// Debug.Log($"{gameObject.name} SetVisibility:" + newVis);
		_visState = newVis;
		updateVisuals();
	}

	public void AddFixture(WiredFixtureBase newFixture)
	{
		_fixtures.Add(newFixture);
		newFixture.WireToPath(this,_fixtures.Count-1);
		updateVisuals();
	}

	public void RemoveLastFixture()
	{
		if (_fixtures.Count > 0)
		{
			int dex = _fixtures.Count-1;
			_fixtures[dex].RemoveFromPath();
			_fixtures.RemoveAt(dex);
		}
		updateVisuals();
	}

	public void updateVisuals()
	{
		switch (_visState)
		{
			case EPathVisState.Hidden:
				disableLineRender();
				break;
			case EPathVisState.Visible:
			case EPathVisState.Active:
			{
				if (_fixtures.Count < 2)
				{
					disableLineRender();
				}
				else
				{
					enableAndUpdateLine();
				}
				break;
			}
		}

		foreach (var fixture in _fixtures)
		{
			fixture.SetWireVisState(_visState);
		}
	}

	void enableAndUpdateLine()
	{
		Vector3[] newPositions = new Vector3[_fixtures.Count];
		for (int i = 0; i < newPositions.Length; i++)
		{
			newPositions[i] = _fixtures[i].GetPosition();
		}
		VisLineRender.positionCount = newPositions.Length;
		VisLineRender.SetPositions(newPositions);
		VisLineRender.gameObject.SetActive(true);
	}

	void disableLineRender()
	{
		VisLineRender.gameObject.SetActive(false);
	}

	public float GetPathLengthMeters()
	{
		float measurement = 0;
		if (_fixtures.Count > 1)
		{
			for (int i = 0; i < _fixtures.Count-1; i++)
			{
				measurement += Vector3.Distance(_fixtures[i].transform.position,_fixtures[i+1].transform.position);
			}
		}
		return measurement;
	}

	public void RemoveAllChildren()
	{
		foreach (var f in _fixtures)
		{
			f.RemoveFromPath();
		}

		_fixtures.Clear();
	}
}
