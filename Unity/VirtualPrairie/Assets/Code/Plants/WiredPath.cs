using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WiredPath : MonoBehaviour
{
	public string ArtnetHost = "127.0.0.1";
	public int Universe = -1;
	public int ChannelStart = 0;
	
	List<WiredFixtureBase> _fixtures = new List<WiredFixtureBase>();
	public List<WiredFixtureBase> Fixtures => _fixtures;

	public LineRenderer VisLineRender;

	public enum EPathVisState
	{
		Visible,
		Hidden
	}

	EPathVisState _visState = EPathVisState.Hidden;
	public bool IsVisible => (_visState == EPathVisState.Visible);

	public void ClearPath()
	{
		_fixtures.Clear();
	}

	public void SetVisibility(EPathVisState newVis)
	{
		_visState = newVis;
		updateVisuals();
	}

	public void AddFixture(WiredFixtureBase newFixture)
	{
		_fixtures.Add(newFixture);
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
			{
				if (_fixtures.Count < 2)
				{
					disableLineRender();
				}
				else
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
				break;
			}
		}

		foreach (var fixture in _fixtures)
		{
			fixture.SetWireVisState(_visState);
		}
	}

	void disableLineRender()
	{
		VisLineRender.gameObject.SetActive(false);
	}
}
