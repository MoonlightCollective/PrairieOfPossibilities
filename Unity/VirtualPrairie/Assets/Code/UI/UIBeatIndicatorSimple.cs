using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class UIBeatIndicatorSimple : MonoBehaviour
{
	protected Image _image;
	public Color ActiveColor = Color.green;
	public Color InactiveColor = Color.grey;
	public float FadeTime;

	[Header("Optional Dynamic Text")]
	public TextMeshProUGUI DynamicText;
	public Color TextActiveColor = Color.white;
	public Color TextInactiveColor = Color.clear;
	
	protected float _fadeTimer;
	
	void Awake()
	{
		_image = GetComponent<Image>();
		_fadeTimer = FadeTime;
	
		var fmp = PrairieGlobals.Instance.MusicPlayer;
		fmp.OnBeatEvent.AddListener((a,b)=>NotifyBeat());
		if (DynamicText != null)
		{
			fmp.OnMarkerEvent.AddListener((e)=>NotifyMarker(e));
		}
	}

	public void NotifyBeat()
	{
		_fadeTimer = 0.0f;
		_image.color = ActiveColor;
	}


	public void NotifyMarker(string markerName)
	{
		_fadeTimer = 0.0f;
		_image.color = ActiveColor;
		if (DynamicText != null)
		{
			DynamicText.text = markerName;
			DynamicText.color = TextActiveColor;
		}
	}

	// Update is called once per frame
	void Update()
	{
		if (_fadeTimer < FadeTime)
			_fadeTimer += Time.unscaledDeltaTime;
		
		float alpha = Mathf.Clamp01(_fadeTimer/FadeTime);
		_image.color = Color.Lerp(ActiveColor,InactiveColor,alpha);

		if (DynamicText != null)
		{
			DynamicText.color = Color.Lerp(TextActiveColor,TextInactiveColor,alpha);
		}
	}
}
