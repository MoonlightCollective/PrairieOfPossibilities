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
	public UIMasterController MasterUI;

	[Header("Measure mode")]
	public GameObject MeasureUI;
	public TextMeshProUGUI MeasurementText;
	public LineRenderer MeasureLine;

	[Header("Wiring mode")]
	public UIWiringController WiringUI;
	public TMP_InputField WiringPathIdInput;
	public TMP_InputField WiringArtNetHostInput;
	public TMP_InputField WiringUniverseInput;
	public TMP_InputField WiringChannelStartInput;
	public TextMeshProUGUI WiringMeasurementText;
	public TextMeshProUGUI WiringCountText;
	public CameraStop WiringCameraStop;
	public PrairieWalkCam WalkCam;
	public TextMeshProUGUI TotalPathCountText;
	public TextMeshProUGUI TotalPathLengthText;

	public bool IsWiring()
	{
		return (_stateMachine.CurrentState == EPlantSelectionManagerState.Wiring);
	}

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

	public void NotifyApplyWireClick()
	{
		Debug.Log("APPLY");

		if (_stateMachine.CurrentState != EPlantSelectionManagerState.Wiring)
			return;
		
		if (_workingPath == null || _workingPath.Fixtures.Count < 2)
			return;


		// Apply meta-data from edit boxes.
		_workingPath.ArtnetHost = WiringArtNetHostInput.text;
		_workingPath.PathId = WiringPathIdInput.text;
		int outVal = -1;
		
		int.TryParse(WiringUniverseInput.text,out outVal);
		_workingPath.Universe = outVal;

		outVal = -1;
		int.TryParse(WiringChannelStartInput.text, out outVal);
		_workingPath.ChannelStart = outVal;

		// if we aren't already in the path manager, add us to the master list of paths
		if (!WiredPathManager.Instance.PathExists(_workingPath))
		{
			WiredPathManager.Instance.AddPath(_workingPath);
		}
		_workingPath.SetVisibility(WiredPath.EPathVisState.Visible);

		// regardless, now that we apply the info, deselect the path and start a new path.
		startNewWire();
	}
	
	public void NotifyExportWirePathCsvClick()
	{
#if UNITY_EDITOR
		string saveFilePath = UnityEditor.EditorUtility.SaveFilePanel("Save Layout",MasterUI.LayoutSettingsController.FixtureExportPath,"","csv");
		if (saveFilePath.Length  != 0)
		{			
			MasterUI.LayoutSettingsController.LayoutGenObj.Exporter.ExportPathDataCSV(saveFilePath);
		}
#else
		Debug.LogError("CSV export only works from within the editor right now");
#endif

	}

	public void NotifyExportClick()
	{
		MasterUI.LayoutSettingsController.OnExportButton();
	}

	public void NotifyImportClick()
	{
		MasterUI.LayoutSettingsController.OnImportButton();
	}

	public void NotifyClearAll()
	{
		WiredPathManager.Instance.ClearAllPaths();
		refreshWiring();
	}

	public void NotifyRereshWiring()
	{
		WiringEnter();
	}

	public void NotifyDeleteWireClick()
	{
		if (_stateMachine.CurrentState != EPlantSelectionManagerState.Wiring)
			return;

		_workingPath.RemoveAllChildren();
		_workingPath.ClearPath();
		_pathManager.DeletePath(_workingPath);
		updatePathTotalsText();
	}

	public void ForceDisable()
	{
		_stateMachine.GotoState(EPlantSelectionManagerState.Disabled);
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
		if (PrairieUtil.AnyInputActive()) // no input processing if we are typing.
			return;

		if (Input.GetKeyDown(KeyCode.M))
		{
			_stateMachine.GotoState(EPlantSelectionManagerState.Measure);
		}
		else if (Input.GetKeyDown(KeyCode.P))
		{
			MasterUI.ForceDisableLayoutUI();
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
		if (PrairieUtil.AnyInputActive()) // no input processing if we are typing.
			return;

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
		if (Input.GetKeyDown(KeyCode.P))
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
	WiredPathManager _pathManager;
	protected void WiringEnter() 
	{
		_pathManager = WiredPathManager.Instance; // cache it - we'll use it a lot.
		_measureList.Clear();
		WiringUI.gameObject.SetActive(true);
		MeasureUI.gameObject.SetActive(false);
		WiredPathManager.Instance.ShowAllPaths();
		if (WalkCam != null && WiringCameraStop != null)
		{
			WalkCam.TeleportToStop(WiringCameraStop);
		}
		refreshWiring();
		updatePathTotalsText();
		startNewWire();
	}

	protected void refreshWiring()
	{
		WiredPathManager.Instance.ShowAllPaths();
		GameObject layoutRoot = PrairieUtil.GetLayoutRoot();
		foreach (Transform child in layoutRoot.transform)
		{
			WiredFixtureBase wfb = child.GetComponent<WiredFixtureBase>();
			if (wfb != null)
			{
				wfb.NotifyEnterWiringMode();
			}
		}
		updatePathTotalsText();
	}

	protected void startNewWire()
	{
		Debug.Log("startNewWire");
		if (_workingPath != null)
		{
			_workingPath.SetVisibility(WiredPath.EPathVisState.Visible);

			if (!_pathManager.PathExists(_workingPath))
			{
				// doesn't already exist, use current path as a scratch path.
				// but clear it out.
				_workingPath.ClearPath();
				return;
			}
		}
		_workingPath = WiredPathManager.NewPathInstance();
		_workingPath.PathId = WiredPathManager.Instance.NextPathName();
		_workingPath.SetVisibility(WiredPath.EPathVisState.Active);
		updatePathTotalsText();
	}

	protected void WiringExit()
	{
		GameObject layoutRoot = PrairieUtil.GetLayoutRoot();
		foreach (Transform child in layoutRoot.transform)
		{
			WiredFixtureBase wfb = child.GetComponent<WiredFixtureBase>();
			if (wfb != null)
			{
				wfb.NotifyExitWiringMode();
			}
		}
		WiredPathManager.Instance.HideAllPaths();
	}

	protected void WiringUpdate()
	{
		if (PrairieUtil.AnyInputActive()) // no input processing if we are typing.
			return;

		if (Input.GetKeyDown(KeyCode.P))
		{
			_stateMachine.GotoState(EPlantSelectionManagerState.Disabled);
			return;
		}
		if (Input.GetKeyDown(KeyCode.Backspace))
		{
			if (_workingPath != null)
			{
				_workingPath.RemoveLastFixture();
			}
			updateActivePathInfoVis();
		}
		if (Input.GetKeyDown(KeyCode.KeypadEnter) || Input.GetKeyDown(KeyCode.Return))
		{
			NotifyApplyWireClick();
		}
		if (Input.GetKeyDown(KeyCode.Escape))
		{
			startNewWire();
		}
	
	}

	protected void updatePathTotalsText()
	{
		// figure out total measurement
		float totalPathLength = 0;
		foreach (var path in _pathManager.Paths)
		{
			totalPathLength += path.GetPathLengthMeters();
		}
		TotalPathLengthText.text = totalPathLength.ToString("F2") + " m";

		TotalPathCountText.text = _pathManager.Paths.Count.ToString() + " Runs";
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
			return (StateTableValue)false; /// not a wired fixture type at all

		if (wiredFixture.IsWired)
		{
			Debug.Log("Fixtured clicked IS wired");

			// already wired? switch our active path to that one.
			if (_workingPath != null)
			{
				if (!_pathManager.PathExists(_workingPath))
				{
					Debug.Log("Clear current path, since we never applied it");
					_workingPath.ClearPath();
				}
				else
				{
					_workingPath.SetVisibility(WiredPath.EPathVisState.Visible);
				}
			}

			_workingPath = wiredFixture.ParentPath;
			_workingPath.SetVisibility(WiredPath.EPathVisState.Active);
			updateActivePathInfoVis();
		}
		else
		{
			Debug.Log("Fixture clicked is NOT wired");
			if (_workingPath == null)
			{
				Debug.Log("creating a new path");
				_workingPath = WiredPathManager.NewPathInstance();
				_workingPath.PathId = _pathManager.NextPathName();
				_workingPath.SetVisibility(WiredPath.EPathVisState.Visible);
			}
			_workingPath.AddFixture(wiredFixture);
			updateActivePathInfoVis();
		}

		return (StateTableValue)true;
	}
	
	void updateActivePathInfoVis()
	{
		WiringArtNetHostInput.text = _workingPath.ArtnetHost;
		WiringPathIdInput.text = _workingPath.PathId;
		WiringChannelStartInput.text = _workingPath.ChannelStart.ToString();
		WiringUniverseInput.text = _workingPath.Universe.ToString();
		float measurement = _workingPath.GetPathLengthMeters();
		float measurementFt = PrairieUtil.MetersToFeet(measurement);
		string measureStr = measurement.ToString("F2") + "m " + measurementFt.ToString("F2") + "ft";
		WiringMeasurementText.text = measureStr;
		WiringCountText.text = _workingPath.Fixtures.Count.ToString();
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
