using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;

public class PlantSelectionHandler : MonoBehaviour, IPointerClickHandler, IPointerEnterHandler, IPointerExitHandler
{	
	public GameObject SelectedVis;
	public GameObject MouseOverVis;

	public List<TextMeshPro> PlantIdText;

	protected bool _selected = false;
	public bool Selected => _selected;

	protected bool _mouseOver = false;

	public void Start()
	{
		updateMouseVis();
		updateSelectVis();
		PlantColorManager pcm = GetComponentInParent<PlantColorManager>();
		foreach (var tmp in PlantIdText)
		{
			tmp.text = pcm.PlantId.ToString();
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
		_selected = false;
		updateSelectVis();
	}

	public void ForceSelect()
	{
		_selected = true;
		updateSelectVis();
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
