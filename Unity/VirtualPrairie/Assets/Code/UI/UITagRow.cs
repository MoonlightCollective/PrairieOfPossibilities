using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class UITagRow : MonoBehaviour
{
	public TextMeshProUGUI TagLabel;
	public TextMeshProUGUI CountLabel;
	public Button AddButton;
	public Button RemoveButton;
	
	protected UITagPanel _parentPanel;
	protected PrairieTag _tag;
	public void InitForTag(PrairieTag newTag,UITagPanel parentPanel, int initialCount = 0)
	{
		TagLabel.text = newTag.Name;
		CountLabel.text = initialCount.ToString();
		AddButton.onClick.AddListener(()=>NotifyAddClick());
		RemoveButton.onClick.AddListener(()=>NotifyRemoveClick());
		_tag = newTag;
		_parentPanel = parentPanel;
	}

	public void NotifyAddClick()
	{
		_parentPanel.NotifyApplyTagToSelection(_tag);
	}

	public void NotifyRemoveClick()
	{
		_parentPanel.NotifyRemoveTagFromSelection(_tag);
	}

	public void UpdateStateFromSelection(bool selectionHasTag,int count = -1)
	{
		AddButton.interactable = !selectionHasTag;
		RemoveButton.interactable = selectionHasTag;
		if (count < 0)
		{
			if (selectionHasTag)
				count = 1;
			else 
				count = 0;
		}
		CountLabel.text = count.ToString();
	}

}
