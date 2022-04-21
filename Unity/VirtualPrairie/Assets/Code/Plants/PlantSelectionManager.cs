using System.Collections;
using System.Collections.Generic;
using Assets.Code.StateTable;
using TMPro;
using UnityEngine;

public class PlantSelectionManager : MonoBehaviour
{
	public static PlantSelectionManager Instance => s_instance;
	protected static PlantSelectionManager s_instance;

	[Header("Global settings")]
	public bool AlwaysShowMouseOver = false;

	[Header("Measure mode")]
	public GameObject MeasureUI;
	public TextMeshProUGUI MeasurementText;
	public LineRenderer MeasureLine;


	[Header("Wiring mode")]
	public UIWiringController WiringUI;

	public bool ShouldShowMouseOver()
	{
		return AlwaysShowMouseOver || (bool)_stateMachine.DoStateActionWithResult(EPlantSelectionManagerAction.ShouldShowMouseOver);
	}

	protected List<PlantSelectionHandler> _measureList = new List<PlantSelectionHandler>();
	protected List<PlantSelectionHandler> _wirePathList = new List<PlantSelectionHandler>();

	private enum EPlantSelectionManagerState
	{
		Disabled,
		Measure,
		Wiring,
	}
	
	private enum EPlantSelectionManagerAction
	{
		[StateActionRequired(false)] Enter,
		[StateActionRequired(false)] Update,
		[StateActionRequired(false)] Exit,
		[StateActionRequired(true)] PlantClicked,
		[StateActionRequired(false)] ShouldShowMouseOver,
	}
	
	private StateTable<EPlantSelectionManagerState,PlantSelectionManager,EPlantSelectionManagerAction> _stateMachine;
	
	private void createStateMachine()
	{
		_stateMachine = new StateTable<EPlantSelectionManagerState,PlantSelectionManager,EPlantSelectionManagerAction>(this);
		_stateMachine.InitActionTable();
	}
	

	//===============
	// Unity Events
	//===============
	public void Awake()
	{
		s_instance = this;
		findRequiredObjects();
		createStateMachine();
		_stateMachine.GotoState(EPlantSelectionManagerState.Disabled);
	}
	
	public void Update()
	{
		_stateMachine.DoStateAction(EPlantSelectionManagerAction.Update);
	}
	protected void findRequiredObjects()
	{
	}

	public bool NotifyPlantClick(PlantSelectionHandler handler)
	{
		var result = _stateMachine.DoStateActionWithResult(EPlantSelectionManagerAction.PlantClicked,new StateTableValue {Value = handler});
		return (bool) result.Value;
	}

	//=================
	// Disabled State
	//=================
	protected void DisabledEnter() 
	{
		Debug.Log("WiringUI" + WiringUI.ToString());
		WiringUI.gameObject.SetActive(false);
		MeasureUI.gameObject.SetActive(false);
		MeasureLine.gameObject.SetActive(false);
	}

	protected void DisabledUpdate()
	{
		if (Input.GetKeyDown(KeyCode.M))
		{
			_stateMachine.GotoState(EPlantSelectionManagerState.Measure);
		}
		else if (Input.GetKeyDown(KeyCode.W))
		{
			_stateMachine.GotoState(EPlantSelectionManagerState.Wiring);
		}
	}
	protected void DisabledExit() { }
	protected StateTableValue DisabledPlantClicked(StateTableValue v)
	{
		PlantSelectionHandler handler = (PlantSelectionHandler)v.Value;
		return new StateTableValue{Value = handler.Selected};
	}

	protected StateTableValue DisabledShouldShowMouseOver()
	{
		return new StateTableValue{ Value = false };
	}

	//=================
	// Measure State
	//=================
	protected void MeasureEnter() 
	{
		_measureList.Clear();
		WiringUI.gameObject.SetActive(false);
		MeasureUI.gameObject.SetActive(true);	
		updateMeasureText();
		updateMeasureLine();
	}
	protected void MeasureUpdate()
	{
		if (Input.GetKeyDown(KeyCode.M))
		{
			_stateMachine.GotoState(EPlantSelectionManagerState.Disabled);
		}
		if (Input.GetKeyDown(KeyCode.Backspace))
		{
			deleteSelectionTail();
		}
		if (Input.GetKeyDown(KeyCode.Escape))
		{
			clearSelection();
		}
		if (Input.GetKeyDown(KeyCode.W))
		{
			_stateMachine.GotoState(EPlantSelectionManagerState.Wiring);
		}
	}

	protected void MeasureExit()
	{
		clearSelection();
	}

	protected StateTableValue MeasurePlantClicked(StateTableValue v)
	{
		PlantSelectionHandler handler = (PlantSelectionHandler)v.Value;
		if (handler.Selected)
			return (StateTableValue)true;

		_measureList.Add(handler);
		updateMeasureText();
		updateMeasureLine();
		return (StateTableValue)true;
	}

	protected StateTableValue MeasureShouldShowMouseOver()
	{
		return new StateTableValue{ Value = true };
	}


	//=================
	// Wiring State
	//=================
	WiredPath _workingPath = null;
	protected void WiringEnter() 
	{
		_measureList.Clear();
		WiringUI.gameObject.SetActive(false);
		WiredPathManager.Instance.ShowAllPaths();
	}

	protected void WiringExit()
	{
		WiredPathManager.Instance.HideAllPaths();
	}

	protected void WiringUpdate()
	{
		if (Input.GetKeyDown(KeyCode.W) || Input.GetKeyDown(KeyCode.Escape))
		{
			_stateMachine.GotoState(EPlantSelectionManagerState.Disabled);
		}
		if (Input.GetKeyDown(KeyCode.Backspace))
		{
			if (_workingPath != null)
			{
				_workingPath.RemoveLastFixture();
			}
		}
	
	}

	protected StateTableValue WiringPlantClicked(StateTableValue v)
	{
		// if it's already selected, we just kind of ignore it.
		PlantSelectionHandler handler = (PlantSelectionHandler)v.Value;
		if (handler.Selected)
			return (StateTableValue)true;

		// if not, see if it's already wired.
		WiredFixtureBase wiredFixture = handler.GetComponentInParent<WiredFixtureBase>();
		if (wiredFixture == null)
			return (StateTableValue)false; /// not a wired fixture

		if (wiredFixture.IsWired)
		{
			// already wired? switch our active path to that one.
			_workingPath = wiredFixture.ParentPath;
			_workingPath.SetVisibility(WiredPath.EPathVisState.Visible);
			updateActivePathInfoVis();
		}
		else
		{
			if (_workingPath == null)
			{
				_workingPath = WiredPathManager.NewPathInstance();
				_workingPath.SetVisibility(WiredPath.EPathVisState.Visible);
			}
			_workingPath.AddFixture(wiredFixture);
			updateActivePathInfoVis();
		}

		return (StateTableValue)true;
	}
	
	void updateActivePathInfoVis()
	{

	}

	protected StateTableValue WiringShouldShowMouseOver()
	{
		return new StateTableValue{ Value = true };
	}


	//===============
	// Shared helper functions for selection management
	//===============
	protected void updateMeasureText()
	{
		float measurement = 0;
		if (_measureList.Count > 1)
		{
			for (int i = 0; i < _measureList.Count-1; i++)
			{
				measurement += Vector3.Distance(_measureList[i].transform.position,_measureList[i+1].transform.position);
			}
		}
		float measurementFeet = PrairieUtil.MetersToFeet(measurement);
		MeasurementText.text = measurement.ToString("F2") + "m " + measurementFeet.ToString("F2") + "ft  " + _measureList.Count.ToString() + " pts";
	}

	protected void updateMeasureLine()
	{
		if (_measureList.Count < 2)
		{
			MeasureLine.gameObject.SetActive(false);
			return;
		}

		MeasureLine.gameObject.SetActive(true);
		List<Vector3> positions = new List<Vector3>();
		foreach(var plant in _measureList)
		{
			positions.Add(plant.transform.position);
		}
		MeasureLine.positionCount = positions.Count;
		MeasureLine.SetPositions(positions.ToArray());
	}

	void clearSelection()
	{
		foreach (var handler in _measureList)
			handler.ForceDeselect();

		_measureList.Clear();
		updateMeasureText();
		updateMeasureLine();
	}

	void deleteSelectionTail()
	{
		_measureList[_measureList.Count-1].ForceDeselect();
		if (_measureList.Count > 1)
		{
			_measureList.RemoveAt(_measureList.Count-1);
		}
		updateMeasureLine();
		updateMeasureText();
	}

}
