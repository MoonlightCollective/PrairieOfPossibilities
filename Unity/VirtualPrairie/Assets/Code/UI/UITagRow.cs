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
	public Button SelectAllButton;
	
	protected UITagPanel _parentPanel;
	protected PrairieTag _tag;
	public string TagName => _tag.Name;

	public void InitForTag(PrairieTag newTag,UITagPanel parentPanel, int initialCount = 0)
	{
		TagLabel.text = newTag.Name;
		CountLabel.text = initialCount.ToString();
		AddButton.onClick.AddListener(()=>NotifyAddClick());
		RemoveButton.onClick.AddListener(()=>NotifyRemoveClick());
		SelectAllButton.onClick.AddListener(()=>NotifySelectAllClick());
		
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

	public void NotifySelectAllClick()
	{
		_parentPanel.NotifySelectAllFromTag(_tag);
	}

	public void UpdateStateFromSelection(int count, int totalSelectList)
	{
		// Debug.Log("UpdateFromSelectList:" + count + "/" + totalSelectList);
		AddButton.interactable = (count < totalSelectList) && (totalSelectList > 0);
		RemoveButton.interactable = count > 0;
		CountLabel.text = count.ToString();
		SelectAllButton.interactable = true;
	}

}
