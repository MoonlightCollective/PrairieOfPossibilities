using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;

public class PlantSelectionHandler : MonoBehaviour, IPointerClickHandler, IPointerEnterHandler, IPointerExitHandler
{	
	public GameObject SelectedVis;
	public GameObject MouseOverVis;
	public GameObject NoPathVis;
	public GameObject FirstInPathVis;

	public List<TextMeshPro> PlantIdText;

	protected bool _selected = false;
	public bool Selected => _selected;

	protected bool _mouseOver = false;
	
	protected PlantColorManager _parentPlant;
	public PlantColorManager ParentPlant => _parentPlant;

	public void Awake()
	{
		DisableFirstInPathVis();
		DisableHavePathVis();
		_parentPlant = GetComponentInParent<PlantColorManager>();
	}

	public void Start()
	{
		updateMouseVis();
		updateSelectVis();

		foreach (var tmp in PlantIdText)
		{
			tmp.text = _parentPlant.PlantId.ToString();
		}
	}

	public void OnPointerClick(PointerEventData eventData)
	{
		_selected = PlantSelectionManager.Instance.NotifyPlantClick(this);
		updateSelectVis();
	}

	public void OnPointerEnter(PointerEventData eventData)
	{
		_mouseOver = true;
		updateMouseVis();
	}

	public void OnPointerExit(PointerEventData eventData)
	{
		_mouseOver = false;
		updateMouseVis();
	}

	public void ForceDeselect()
	{
		// Debug.Log("ForceDeselect:" + gameObject.name);
		_selected = false;
		updateSelectVis();
	}

	public void ForceSelect()
	{
		_selected = true;
		updateSelectVis();
	}

	public void EnableHavePathVis(bool havePath)
	{
		if (NoPathVis != null)
		{
			NoPathVis.SetActive(!havePath);
		}
	}

	public void EnableFirstInPathVis()
	{
		if (FirstInPathVis != null)
			FirstInPathVis.SetActive(true);
	}

	public void DisableFirstInPathVis()
	{
		if (FirstInPathVis != null)
			FirstInPathVis.SetActive(false);
	}

	public void DisableHavePathVis()
	{
		NoPathVis.SetActive(false);
	}

	void updateSelectVis()
	{
		if (SelectedVis != null)
			SelectedVis.SetActive(_selected);
	}

	void updateMouseVis()
	{
		if (MouseOverVis==null)
			return;
		
		bool doShow = _mouseOver && PlantSelectionManager.Instance.ShouldShowMouseOver();

		MouseOverVis.SetActive(doShow);
		if (doShow)
		{
			var infoPanel = MouseOverVis.GetComponentInChildren<UIPlantInfoPanel>();
			if (infoPanel != null)
				infoPanel.UpdateFromPlant(this);
		}
	}

}
