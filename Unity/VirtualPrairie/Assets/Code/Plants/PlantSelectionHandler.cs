using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class PlantSelectionHandler : MonoBehaviour, IPointerClickHandler, IPointerEnterHandler, IPointerExitHandler
{	
	public GameObject SelectedVis;
	public GameObject MouseOverVis;

	protected bool _selected = false;
	public bool Selected => _selected;

	protected bool _mouseOver = false;

	public void Start()
	{
		updateMouseVis();
		updateSelectVis();
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
