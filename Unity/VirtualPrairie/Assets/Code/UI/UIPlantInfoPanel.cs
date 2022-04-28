using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class UIPlantInfoPanel : MonoBehaviour
{
	public TextMeshProUGUI PlantNameText;
	public TextMeshProUGUI PlantLocText;

	public void UpdateFromPlant(PlantSelectionHandler selectHandler)
	{
		PlantNameText.text = selectHandler.transform.parent.gameObject.name;
		Vector3 pos = selectHandler.transform.parent.transform.position;
		PlantLocText.text = pos.ToString();
	}

	public void Update()
	{
		transform.LookAt(Camera.main.transform);
	}
}
