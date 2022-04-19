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
	public FixtureLayoutGen LayoutGenObj;

	public FileDialog FileSelectDialog;

	[Header("Props UI")]
	public TMP_Dropdown PropsDropdown; 
	public UILabelSlider PropsOffsetSlider;
	public FixturePropLayout PropsLayoutObj;
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
		LayoutRebuilder.ForceRebuildLayoutImmediate(GetComponent<RectTransform>());
		LayoutDropdown.onValueChanged.AddListener(DropdownChanged);
		PropsDropdown.onValueChanged.AddListener(PropDropdownChanged);


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
		PropDropdownChanged(0);
		DropdownChanged(0);
		//DoGenLayout();			// do initial generation of plants as per UI
	}

	public void DropdownChanged(int val)
	{
		switch (LayoutDropdown.options[val].text)
		{
			case "Rings":
			default:
				LayoutGenObj.Algorithm = EFixtureLayoutAlgorithm.Rings;
				break;
			case "Grid":
				LayoutGenObj.Algorithm = EFixtureLayoutAlgorithm.Grid;
				break;
			case "Sunflower":
				LayoutGenObj.Algorithm = EFixtureLayoutAlgorithm.Sunflower;
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
		PropsLayoutObj.SetLayoutStyle(_propLayoutStyle,offsetVal, LayoutGenObj);
	}

	public void PropSliderChanged(float val)
	{
		float offsetVal = val;
		PropsLayoutObj.SetLayoutStyle(_propLayoutStyle,offsetVal, LayoutGenObj);
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
		StartCoroutine(doExportDialog());
	}


	// When user hits "import" button to import a fixture file.
	public void OnImportButton()
	{
		StartCoroutine(doImportDialog());
	}


	public IEnumerator doExportDialog()
	{
		yield return StartCoroutine(FileSelectDialog.Save(FixtureExportPath, ".lxf|.json", "Save File",null, true));

		if (FileSelectDialog.result != null)
		{
			FixtureExportPath = System.IO.Path.GetDirectoryName(FileSelectDialog.result);
			PlayerPrefs.SetString("FixtureExportPath",FixtureExportPath);
			Debug.Log($"Do export returned: {FileSelectDialog.result}");
			LayoutGenObj.SaveLayoutToFixture(PrairieUtil.GetLayoutRoot(),FileSelectDialog.result);
		}
	}

	public IEnumerator doImportDialog()
	{
		yield return StartCoroutine(FileSelectDialog.Open(FixtureImportPath, ".lxf|.txt|.json" , "Open Fixture File",null, -1, true));

		if (FileSelectDialog.result != null)
		{
			FixtureImportPath = System.IO.Path.GetDirectoryName(FileSelectDialog.result);
			PlayerPrefs.SetString("FixtureImportPath",FixtureImportPath);
			LayoutGenObj.DoImportLayout(PrairieUtil.GetLayoutRoot(),FileSelectDialog.result);
			Debug.Log($"Do import returned path: {FileSelectDialog.result}");
		}
	}

	// When user hits "Generate" button for currently active mode of generation
	public void DoGenLayout()
	{
		var root = PrairieUtil.GetLayoutRoot();
		LayoutGenObj.GenerateLayout(root);
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
		LayoutGenObj.LoadLayoutSettings();
		switch (LayoutGenObj.Algorithm)
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

		FixtureLayoutRings flr = LayoutGenObj.RingsLayout;
		RingsFixtureCountSlider.Slider.SetValueWithoutNotify(flr.NumFixtures);
		RingsSpacingSlider.Slider.SetValueWithoutNotify(flr.BaseSpacingFt);
		RingsCenterRadiusSlider.Slider.SetValueWithoutNotify(flr.CenterRadiusFt);
		RingsAisleWidthSlider.Slider.SetValueWithoutNotify(flr.AisleWidthFt);
		RingsAisleCurveSlider.Slider.SetValueWithoutNotify(flr.AisleCurve);
		RingsAisleCountSlider.Slider.SetValueWithoutNotify(flr.NumAisles);

		FixtureLayoutGrid glr = LayoutGenObj.GridLayout;
		RowsFixtureCountSlider.Slider.SetValueWithoutNotify(glr.NumFixtures);
		RowsSpacingSlider.Slider.SetValueWithoutNotify(glr.BaseSpacingFt);
		RowsRowCountSlider.Slider.SetValueWithoutNotify(glr.NumRows);
		RowsRowSpacingSlider.Slider.SetValueWithoutNotify(glr.RowSpacingFt);

		FixtureLayoutSunflower fls = LayoutGenObj.SunflowerLayout;
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

		FixtureLayoutRings flr = LayoutGenObj.RingsLayout;
		flr.NumFixtures = (int) RingsFixtureCountSlider.Slider.value;
		flr.BaseSpacingFt = RingsSpacingSlider.Slider.value;
		flr.CenterRadiusFt = RingsCenterRadiusSlider.Slider.value;
		flr.AisleWidthFt = RingsAisleWidthSlider.Slider.value;
		flr.AisleCurve = RingsAisleCurveSlider.Slider.value;
		flr.NumAisles = (int) RingsAisleCountSlider.Slider.value;

		FixtureLayoutGrid glr = LayoutGenObj.GridLayout;
		glr.NumFixtures = (int) RowsFixtureCountSlider.Slider.value;
		glr.BaseSpacingFt = RowsSpacingSlider.Slider.value;
		glr.NumRows = (int)RowsRowCountSlider.Slider.value;
		glr.RowSpacingFt = RowsRowSpacingSlider.Slider.value;

		FixtureLayoutSunflower fls = LayoutGenObj.SunflowerLayout;
		fls.NumFixtures = (int) SunflowerFixtureCountSlider.Slider.value;
		fls.BaseSpacingFt = SunflowerSpacingSlider.Slider.value;
		fls.SpacingExp = (SunflowerSpacingExpSlider.Slider.value / 1000f) + 1.0f;
		fls.CenterRadiusFt = SunflowerCenterRadiusSlider.Slider.value;
		fls.ClearingOffset = SunflowerClearingOffsetSlider.Slider.value;
		fls.ClearingSize = SunflowerClearingSizeSlider.Slider.value;

		LayoutGenObj.SaveLayoutSettings();
	}
}
