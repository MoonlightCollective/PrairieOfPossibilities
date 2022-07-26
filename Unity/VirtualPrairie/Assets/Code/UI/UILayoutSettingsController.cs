using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using TMPro;
using OxOD;

public class UILayoutSettingsController : MonoBehaviour
{
	[Header("Base")]
	public FileDialog FileSelectDialog;

	protected FixtureLayoutGen _layoutGenObj;
	public FixtureLayoutGen LayoutGenObj => _layoutGenObj;

	[Header("Props UI")]
	public TMP_Dropdown PropsDropdown; 
	public UILabelSlider PropsOffsetSlider;
	protected FixturePropLayout _propsLayoutObj;

	protected EPropLayoutStyle _propLayoutStyle = EPropLayoutStyle.OuterPortals;

	[Header("Mode")]
	public TMP_Dropdown LayoutDropdown;

	[Header("Rings UI")]
	public GameObject RingsLayoutRoot;
	public UILabelSlider RingsFixtureCountSlider;
	public UILabelSlider RingsSpacingSlider;
	public UILabelSlider RingsCenterRadiusSlider;
	public UILabelSlider RingsAisleCountSlider;
	public UILabelSlider RingsAisleWidthSlider;
	public UILabelSlider RingsAisleCurveSlider;

	[Header("Grid UI")]
	public GameObject RowsLayoutRoot;
	public UILabelSlider RowsFixtureCountSlider;
	public UILabelSlider RowsSpacingSlider;
	public UILabelSlider RowsRowCountSlider;
	public UILabelSlider RowsRowSpacingSlider;

	[Header("Suflower UI")]
	public GameObject SunflowerLayoutRoot;
	public UILabelSlider SunflowerFixtureCountSlider;
	public UILabelSlider SunflowerSpacingSlider;
	public UILabelSlider SunflowerSpacingExpSlider;
	public UILabelSlider SunflowerCenterRadiusSlider;
	public UILabelSlider SunflowerClearingOffsetSlider;
	public UILabelSlider SunflowerClearingSizeSlider;

	public String FixtureImportPath = "%MyDocuments%";
	public String FixtureExportPath = "%MyDocuments%";

	bool _didFirstUpdate = false;

	public void Awake()
	{
		_propsLayoutObj = PrairieGlobals.Instance.PropLayoutRoot;
		_layoutGenObj = PrairieGlobals.Instance.LayoutGen;

		LayoutRebuilder.ForceRebuildLayoutImmediate(GetComponent<RectTransform>());
		LayoutDropdown.onValueChanged.AddListener(DropdownChanged);
		PropsDropdown.onValueChanged.AddListener(PropDropdownChanged);

		FixtureExportPath = PlayerPrefs.GetString("FixtureExportPath");
		FixtureImportPath = PlayerPrefs.GetString("FixtureImportPath");

		Slider[] sliders = GetComponentsInChildren<Slider>();
		foreach (var s in sliders)
		{
			s.onValueChanged.AddListener(SliderChanged);
		}
	
		PropsOffsetSlider.Slider.onValueChanged.AddListener(PropSliderChanged);
		if (PlayerPrefs.HasKey("FixtureImportPath"))
			FixtureImportPath = PlayerPrefs.GetString("FixtureImportPath");
	}

	void Start()
	{
		updateUIFromSettings();
		SunflowerLayoutRoot.SetActive(true);
		// PropDropdownChanged(0);
		DropdownChanged(0);
		//DoGenLayout();			// do initial generation of plants as per UI
	}

	public void DropdownChanged(int val)
	{
		switch (LayoutDropdown.options[val].text)
		{
			case "Rings":
			default:
				_layoutGenObj.Algorithm = EFixtureLayoutAlgorithm.Rings;
				break;
			case "Grid":
				_layoutGenObj.Algorithm = EFixtureLayoutAlgorithm.Grid;
				break;
			case "Sunflower":
				_layoutGenObj.Algorithm = EFixtureLayoutAlgorithm.Sunflower;
				break;
		}
		updateUIFromSettings();
	}

	public void PropDropdownChanged(int val)
	{
		switch (PropsDropdown.options[val].text)
		{
			case "None":
				_propLayoutStyle = EPropLayoutStyle.Disabled;
				break;
			case "Inner Portals":
				_propLayoutStyle = EPropLayoutStyle.InnerPortals;
				break;
			case "Outer Portals":
				_propLayoutStyle = EPropLayoutStyle.OuterPortals;
				break;
		}

		float offsetVal = PropsOffsetSlider.Slider.value;
		_propsLayoutObj.SetLayoutStyle(_propLayoutStyle,offsetVal, _layoutGenObj);
	}

	public void PropSliderChanged(float val)
	{
		float offsetVal = val;
		_propsLayoutObj.SetLayoutStyle(_propLayoutStyle,offsetVal, _layoutGenObj);
	}

	public void SliderChanged(float val)
	{
		updateSettingsFromUI();
	}


	//
	// File Import/Export
	//
	public void OnExportButton()
	{
#if UNITY_EDITOR
		string saveFilePath = UnityEditor.EditorUtility.SaveFilePanel("Save Layout",FixtureExportPath,"","json");
		if (saveFilePath.Length  != 0)
		{
			_layoutGenObj.SaveLayoutToFixture(PrairieUtil.GetLayoutRoot(),saveFilePath);
			FixtureExportPath = System.IO.Path.GetDirectoryName(saveFilePath);
			PlayerPrefs.SetString("FixtureExportPath",FixtureExportPath);
		}
#else
		StartCoroutine(doExportDialog());
#endif
	}


	// When user hits "import" button to import a fixture file.
	public void OnImportButton()
	{
#if UNITY_EDITOR
		string openFilePath = UnityEditor.EditorUtility.OpenFilePanel("Import Layout", FixtureExportPath,"json");
		if (openFilePath.Length != 0)
		{
			_layoutGenObj.DoImportLayout(PrairieUtil.GetLayoutRoot(), openFilePath, true);
			FixtureExportPath = System.IO.Path.GetDirectoryName(openFilePath);
			PlayerPrefs.SetString("FixtureExportPath",FixtureExportPath);
		}
#else
		StartCoroutine(doImportDialog());
#endif
	}

	


	public IEnumerator doExportDialog()
	{
		yield return StartCoroutine(FileSelectDialog.Save(FixtureExportPath, ".lxf|.json", "Save File",null, true));

		if (FileSelectDialog.result != null)
		{
			FixtureExportPath = System.IO.Path.GetDirectoryName(FileSelectDialog.result);
			PlayerPrefs.SetString("FixtureExportPath",FixtureExportPath);
			Debug.Log($"Do export returned: {FileSelectDialog.result}");
			_layoutGenObj.SaveLayoutToFixture(PrairieUtil.GetLayoutRoot(),FileSelectDialog.result);
		}
	}

	public IEnumerator doImportDialog()
	{
		yield return StartCoroutine(FileSelectDialog.Open(FixtureImportPath, ".lxf|.txt|.json" , "Open Fixture File",null, -1, true));

		if (FileSelectDialog.result != null)
		{
			FixtureImportPath = System.IO.Path.GetDirectoryName(FileSelectDialog.result);
			PlayerPrefs.SetString("FixtureImportPath",FixtureImportPath);
			_layoutGenObj.DoImportLayout(PrairieUtil.GetLayoutRoot(),FileSelectDialog.result);
			Debug.Log($"Do import returned path: {FileSelectDialog.result}");
		}
	}

	// When user hits "Generate" button for currently active mode of generation
	public void DoGenLayout()
	{
		var root = PrairieUtil.GetLayoutRoot();
		_layoutGenObj.GenerateLayout(root);
	}


	public void Update()
	{
		if (!_didFirstUpdate)
		{
			updateUIFromSettings();
			_didFirstUpdate = true;
		}
	}

	void updateUIFromSettings()
	{
		_layoutGenObj.LoadLayoutSettings();
		switch (_layoutGenObj.Algorithm)
		{
			case EFixtureLayoutAlgorithm.Grid:
				RingsLayoutRoot.SetActive(false);
				RowsLayoutRoot.SetActive(true);
				SunflowerLayoutRoot.SetActive(false);
				break;
			case EFixtureLayoutAlgorithm.Sunflower:
				RingsLayoutRoot.SetActive(false);
				RowsLayoutRoot.SetActive(false);
				SunflowerLayoutRoot.SetActive(true);
				break;
			default:
				RingsLayoutRoot.SetActive(true);
				RowsLayoutRoot.SetActive(false);
				SunflowerLayoutRoot.SetActive(false);
			break;
		}

		FixtureLayoutRings flr = _layoutGenObj.RingsLayout;
		RingsFixtureCountSlider.Slider.SetValueWithoutNotify(flr.NumFixtures);
		RingsSpacingSlider.Slider.SetValueWithoutNotify(flr.BaseSpacingFt);
		RingsCenterRadiusSlider.Slider.SetValueWithoutNotify(flr.CenterRadiusFt);
		RingsAisleWidthSlider.Slider.SetValueWithoutNotify(flr.AisleWidthFt);
		RingsAisleCurveSlider.Slider.SetValueWithoutNotify(flr.AisleCurve);
		RingsAisleCountSlider.Slider.SetValueWithoutNotify(flr.NumAisles);

		FixtureLayoutGrid glr = _layoutGenObj.GridLayout;
		RowsFixtureCountSlider.Slider.SetValueWithoutNotify(glr.NumFixtures);
		RowsSpacingSlider.Slider.SetValueWithoutNotify(glr.BaseSpacingFt);
		RowsRowCountSlider.Slider.SetValueWithoutNotify(glr.NumRows);
		RowsRowSpacingSlider.Slider.SetValueWithoutNotify(glr.RowSpacingFt);

		FixtureLayoutSunflower fls = _layoutGenObj.SunflowerLayout;
		SunflowerFixtureCountSlider.Slider.SetValueWithoutNotify(fls.NumFixtures);
		SunflowerSpacingSlider.Slider.SetValueWithoutNotify(fls.BaseSpacingFt);
		SunflowerCenterRadiusSlider.Slider.SetValueWithoutNotify(fls.CenterRadiusFt);
		SunflowerSpacingExpSlider.Slider.SetValueWithoutNotify((fls.SpacingExp - 1.0f) * 1000f);
		SunflowerClearingOffsetSlider.Slider.SetValueWithoutNotify(fls.ClearingOffset);
		SunflowerClearingSizeSlider.Slider.SetValueWithoutNotify(fls.ClearingSize);

		UILabelSlider[] sliders = GetComponentsInChildren<UILabelSlider>();
		foreach (var s in sliders)
		{
			s.OnUpdateValue(s.Slider.value);
		}

		LayoutRebuilder.ForceRebuildLayoutImmediate(GetComponent<RectTransform>());
	}

	void updateSettingsFromUI()
	{

		FixtureLayoutRings flr = _layoutGenObj.RingsLayout;
		flr.NumFixtures = (int) RingsFixtureCountSlider.Slider.value;
		flr.BaseSpacingFt = RingsSpacingSlider.Slider.value;
		flr.CenterRadiusFt = RingsCenterRadiusSlider.Slider.value;
		flr.AisleWidthFt = RingsAisleWidthSlider.Slider.value;
		flr.AisleCurve = RingsAisleCurveSlider.Slider.value;
		flr.NumAisles = (int) RingsAisleCountSlider.Slider.value;

		FixtureLayoutGrid glr = _layoutGenObj.GridLayout;
		glr.NumFixtures = (int) RowsFixtureCountSlider.Slider.value;
		glr.BaseSpacingFt = RowsSpacingSlider.Slider.value;
		glr.NumRows = (int)RowsRowCountSlider.Slider.value;
		glr.RowSpacingFt = RowsRowSpacingSlider.Slider.value;

		FixtureLayoutSunflower fls = _layoutGenObj.SunflowerLayout;
		fls.NumFixtures = (int) SunflowerFixtureCountSlider.Slider.value;
		fls.BaseSpacingFt = SunflowerSpacingSlider.Slider.value;
		fls.SpacingExp = (SunflowerSpacingExpSlider.Slider.value / 1000f) + 1.0f;
		fls.CenterRadiusFt = SunflowerCenterRadiusSlider.Slider.value;
		fls.ClearingOffset = SunflowerClearingOffsetSlider.Slider.value;
		fls.ClearingSize = SunflowerClearingSizeSlider.Slider.value;

		_layoutGenObj.SaveLayoutSettings();
	}
}
