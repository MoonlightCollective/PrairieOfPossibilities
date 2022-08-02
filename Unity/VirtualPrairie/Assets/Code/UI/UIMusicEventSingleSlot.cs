using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class UIMusicEventSingleSlot : MonoBehaviour
{
	public Color FlashColor = Color.white;
	public Color InvisibleColor = Color.black;
	public float FadeTime = .5f;
	public bool IsActive => _flashTimer > 0f;

	TextMeshProUGUI _text;
	float _flashTimer = 0f;
	
	void Awake()
	{
		_text = GetComponent<TextMeshProUGUI>();
		_text.color = InvisibleColor;
	}

	public void Flash(string eventStr)
	{
		_text.text = eventStr;
		_text.color = FlashColor;
		_flashTimer = FadeTime;
	}

	void Update()
	{
		if (_flashTimer > 0)
		{
			_flashTimer -= Time.unscaledDeltaTime;
			if (_flashTimer < 0)
			{
				_flashTimer = 0f;
			}
			float fadeAlpha = Mathf.Clamp01(1.0f - (_flashTimer/FadeTime));
			Color newColor = Color.Lerp(FlashColor,InvisibleColor,fadeAlpha);
			_text.color = newColor;
		}
	}
}
