using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIDisplayFeedButtonMaster : MonoBehaviour
{
	List<UIFlashingButton> _feedButtons;
	
	void Awake()
	{
		_feedButtons = new List<UIFlashingButton>(GetComponentsInChildren<UIFlashingButton>());
	}

	void Start()
	{
		foreach (var fb in _feedButtons)
		{
			fb.SwitchToFlashState("Off");
		}
	}

	public void SwitchToFeed(int newDex)
	{
		for (int i = 0; i < _feedButtons.Count; i++)
		{
			if (newDex == i)
				_feedButtons[i].SwitchToFlashState("On");
			else
				_feedButtons[i].SwitchToFlashState("Off");
		}
	}
}
