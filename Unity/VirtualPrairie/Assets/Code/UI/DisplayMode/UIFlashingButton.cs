using System.Collections;
using System.Collections.Generic;
using NaughtyAttributes;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

[System.Serializable]
public class FlashingButtonStateDef
{
	public string Name = "DefaultState";
	public Color BgImageColor = Color.white;
	public Color FillImageColor = Color.black;
	public Color TextColor = Color.white;
	public bool ReplaceText = false;
	[ShowIf("ReplaceText")]
	public string TextString;

	[Range(0.1f,5)]
	public float DurationMult = 1.0f;
}

public enum EFlashingButtonMode
{
	Static,
	FlashingRange,
	CycleAll,
	TriggerFlash,
	TriggerToggle,
}

public class UIFlashingButton : TriggerListener
{
	public Image BgImage;
	public Image FillImage;
	public TextMeshProUGUI Text;

	public List<FlashingButtonStateDef> StateDefs;
	public string InitialFlashState;

	public EFlashingButtonMode FlashMode;
	
	[HideIf("FlashMode",EFlashingButtonMode.Static)]
	public float CycleTime = 1.0f;

	[ShowIf("FlashMode",EFlashingButtonMode.FlashingRange)]
	[Range(0,10)]
	public int RangeStart = 0;
	[ShowIf("FlashMode",EFlashingButtonMode.FlashingRange)]
	[Range(0,10)]
	public int RangeEnd = 1;


	[ShowIf("FlashMode",EFlashingButtonMode.TriggerFlash|EFlashingButtonMode.TriggerToggle)]
	public string TriggerFlashState;

	protected float _timer; 
	protected int _flashStateDex = -1;

	void Start()
	{
		_timer = CycleTime;
		switchToFlashState(InitialFlashState);
	}

	void Update()
	{
		switch (FlashMode)
		{
			case EFlashingButtonMode.Static:
			case EFlashingButtonMode.TriggerToggle:
				return;
			case EFlashingButtonMode.FlashingRange:
				updateFlashingRange();
				break;
			case EFlashingButtonMode.CycleAll:
				updateFlashingAll();
				break;
			case EFlashingButtonMode.TriggerFlash:
				updateTriggerFlash();
				break;
		}
	}

	public override void NotifyTriggered(PrairieTriggerParams tParams)
	{
		switch (FlashMode)
		{
			case EFlashingButtonMode.TriggerFlash:
				switchToFlashState(TriggerFlashState);
				break;
			case EFlashingButtonMode.TriggerToggle:
			{
				if (StateDefs[_flashStateDex].Name == InitialFlashState)
				{
					switchToFlashState(TriggerFlashState);
				}
				else
				{
					switchToFlashState(InitialFlashState);
				}
			}
			break;
		}
	}

	public void SwitchToFlashState(string newState)
	{
		switchToFlashState(newState);
	}

	void updateTriggerFlash()
	{
		if (_timer > 0)
			_timer -= Time.deltaTime;
		else
			return;
		
		if (_timer < 0)
		{
			switchToFlashState(InitialFlashState);
		}
	}

	void updateFlashingRange()
	{
		if (_timer > 0)
			_timer -= Time.deltaTime;

		if (_timer <= 0)
		{
			int newDex = _flashStateDex+1;
			if (newDex >= RangeEnd)
			{
				newDex = RangeStart;
			}
			switchToFlashState(newDex);
		}
	}

	void updateFlashingAll()
	{
		if (_timer > 0)
			_timer -= Time.deltaTime;
		
		if (_timer <= 0)
		{
			int newDex = _flashStateDex+1;
			if (newDex >= StateDefs.Count)
			{
				newDex = 0;
			}
			switchToFlashState(newDex);
		}
	}


	void switchToFlashState(string stateName)
	{
		for (int i = 0; i < StateDefs.Count; i++)
		{
			FlashingButtonStateDef s = StateDefs[i];
			if (s.Name == stateName)
			{
				switchToFlashState(i);
				return;
			}
		}

		if (StateDefs.Count > 0)
		{
			Debug.LogWarning($"{gameObject.name} - No state named:{stateName}, so setting to default state 0");
			switchToFlashState(0);
		}
	}

	void switchToFlashState(int newDex)
	{
		_flashStateDex = newDex;
		var def = StateDefs[_flashStateDex];
		
		BgImage.color = def.BgImageColor;
		FillImage.color = def.FillImageColor;
		if (def.ReplaceText)
		{
			Text.text = def.TextString;
		}

		Text.color = def.TextColor;
		_timer = CycleTime * def.DurationMult;
	}

}
