using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIPlayPauseButton : MonoBehaviour
{

	public Sprite PlaySprite;
	public Sprite PauseSprite;

	FmodMusicPlayer _fmp;
	PrairieMusicManager _pmm;
	Image _buttonImage;
	Button _button;

	void Awake()
	{
		_buttonImage = GetComponent<Image>();
		_button = GetComponent<Button>();
	}
	
    // Start is called before the first frame update
    void Start()
    {
        _fmp = PrairieGlobals.Instance.MusicPlayer;
		_pmm = PrairieGlobals.Instance.MusicManager;
		_button.onClick.AddListener(()=>NotifyButtonPress());
		updateButtonFromMusicState();
    }

	void updateButtonFromMusicState()
	{
		if (_fmp.IsPlaying())
			_buttonImage.sprite = PauseSprite;
		else
			_buttonImage.sprite = PlaySprite;
	}

    // Update is called once per frame
    void Update()
    {
		updateButtonFromMusicState();
    }

	public void NotifyButtonPress()
	{
		if (_fmp.IsPlaying())
		{
			_pmm.PausePlayback();
		}
		else
		{
			_pmm.StartPlayback();
		}
	}
}
