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

	List<UITagRow> _tagRows = new List<UITagRow>();

    void Start()
    {
		buildButtonsFromTags();
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
		newRow.UpdateStateFromSelection(false,0);
	}

	public void NotifyApplyTagToSelection(PrairieTag tag)
	{

	}

	public void NotifyRemoveTagFromSelection(PrairieTag tag)
	{

	}

}
