using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIWireEventHandler : MonoBehaviour
{
    protected WiredPathManager _wiredPathMgr;
	protected PlantSelectionManager _plantSelectMgr;

	void Awake()
	{
		_wiredPathMgr = PrairieGlobals.Instance.WiredPathManager;
		_plantSelectMgr = PrairieGlobals.Instance.PlantSelectionManager;
	}

	// these just pass events into the corresponding global objects, allowing the wiring within the UI to avoid references
	// outside its own prefab.
	public void NotifyNewLayout()
	{
		_wiredPathMgr.NotifyNewLayout();
	}
	
	public void NotifyClearAll()
	{
		_plantSelectMgr.NotifyClearAll();
	}

	public void ShowAllPaths()
	{
		_wiredPathMgr.ShowAllPaths();
	}

	public void HideAllPaths()
	{
		_wiredPathMgr.HideAllPaths();
	}

	public void NotifyApplyWireClick()
	{
		_plantSelectMgr.NotifyApplyWireClick();
	}

	public void NotifyExportWirePathCsvClick()
	{
		_plantSelectMgr.NotifyExportWirePathCsvClick();
	}

	public void NotifyExportClick()
	{
		_plantSelectMgr.NotifyExportClick();
	}

	public void NotifyImportClick()
	{
		_plantSelectMgr.NotifyImportClick();
	}

	public void NotifyDeleteWireClick()
	{
		_plantSelectMgr.NotifyDeleteWireClick();
	}

	public void NotifyFixtureImport()
	{
		_plantSelectMgr.NotifyFixtureImport();
	}

	// Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
