using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
public class UITagPanel : MonoBehaviour
{
	public TMP_InputField NewTagInput;
	public Button NewTagButton;
	public Button DeleteUnsedTagsButton;

	public Transform TagRowParent;
	public GameObject TagRowPrefab;

	public TextMeshProUGUI TagSelectCountText;
	public Button ClearSelectionButton;
	
	List<UITagRow> _tagRows = new List<UITagRow>();

	static UITagPanel s_instance;
	public static UITagPanel Instance => s_instance;

	void Awake()
	{
		Debug.Log("Tag Panel AWAKE");
		s_instance = this;
	}
    void Start()
    {
		buildButtonsFromTags();
		NewTagButton.onClick.AddListener(()=>NotifyAddNewTag());
		ClearSelectionButton.onClick.AddListener(()=>NotifyClearSelection());
		DeleteUnsedTagsButton.onClick.AddListener(()=>NotifyRemoveUnusedTags());
    }

	void NotifyClearSelection()
	{
		PlantSelectionManager.Instance.NotifyClearTagSelect();
	}

	void NotifyAddNewTag()
	{
		if (!string.IsNullOrEmpty(NewTagInput.text))
		{
			PrairieTagManager.Instance.AddTag(NewTagInput.text);
		}
		buildButtonsFromTags();
	}

	void NotifyRemoveUnusedTags()
	{
		PrairieTagManager.Instance.NotifyNewLayout();
		UITagPanel.Instance.NotifyClearSelection();
	}

	public void UpdateFromSelectionList(List<PlantSelectionHandler> selectList)
	{
		TagSelectCountText.text = $"{selectList.Count} selected";
		PrairieTagManager tagManager = PrairieTagManager.Instance;

		foreach (var row in _tagRows)
		{
			string tag = row.TagName;
			int count = 0;
			foreach (var psh in selectList)
			{
				if (psh.ParentPlant.HasFixtureTag(tag))
					count++;
			}
			row.UpdateStateFromSelection(count,selectList.Count);
		}
	}

	void buildButtonsFromTags()
	{
		_tagRows.Clear();

		foreach (Transform child in TagRowParent)
		{
			GameObject.Destroy(child.gameObject);
		}

		TagRowParent.DetachChildren();

		foreach (var t in PrairieTagManager.Instance.Tags)
		{
			createRowForTag(t);
		}
	}

	void createRowForTag(PrairieTag newTag)
	{
		UITagRow newRow = GameObject.Instantiate(TagRowPrefab).GetComponent<UITagRow>();
		newRow.transform.SetParent(TagRowParent,false);
		newRow.InitForTag(newTag,this, 0);
		newRow.UpdateStateFromSelection(0,0);
		_tagRows.Add(newRow);
	}

	public void NotifyApplyTagToSelection(PrairieTag tag)
	{
		PlantSelectionManager.Instance.ApplyTagToSelection(tag);
	}

	public void NotifyRemoveTagFromSelection(PrairieTag tag)
	{
		PlantSelectionManager.Instance.RemvoeTagFromSelection(tag);
	}

	public void NotifyTagListChanged()
	{
		buildButtonsFromTags();
	}

	public void NotifySelectAllFromTag(PrairieTag tag)
	{
		PlantSelectionManager.Instance.NotifySelectAllFromtag(tag);
	}
}
