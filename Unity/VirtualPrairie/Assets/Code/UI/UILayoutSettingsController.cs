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

	bool _didFirstUpdate = false;

	public void Awake()
	{
		LayoutRebuilder.ForceRebuildLayoutImmediate(GetComponent<RectTransform>());
		LayoutDropdown.onValueChanged.AddListener(DropdownChanged);

		Slider[] sliders = GetComponentsInChildren<Slider>();
		foreach (var s in sliders)
		{
			s.onValueChanged.AddListener(SliderChanged);
		}

	}

	void Start()
	{
		updateUIFromSettings();
		RowsLayoutRoot.SetActive(true);
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
		}
		updateUIFromSettings();
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
		yield return StartCoroutine(FileSelectDialog.Save(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), ".lxf|.json", "Save File",null, true));

		if (FileSelectDialog.result != null)
		{
			Debug.Log($"Do export returned: {FileSelectDialog.result}");
		}
	}

	public IEnumerator doImportDialog()
	{
		yield return StartCoroutine(FileSelectDialog.Open(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), ".lxf|.txt|.json" , "Open Fixture File",null, -1, true));

		if (FileSelectDialog.result != null)
		{
			LayoutGenObj.DoImportLayout(PrairieUtil.GetLayoutRoot(),FileSelectDialog.result);
			Debug.Log($"Do export returned: {FileSelectDialog.result}");
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
				break;
			default:
				RingsLayoutRoot.SetActive(true);
				RowsLayoutRoot.SetActive(false);
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

		LayoutGenObj.SaveLayoutSettings();
	}

}
