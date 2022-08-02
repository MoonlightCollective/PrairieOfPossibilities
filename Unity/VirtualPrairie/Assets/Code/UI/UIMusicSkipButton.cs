using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIMusicSkipButton : MonoBehaviour
{
	public int SkipAmount = 10;
	FmodMusicPlayer _fmp;
	PrairieMusicManager _pmm;
	Button _button;

	void Awake()
	{
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
		_button.interactable = _fmp.IsPlaying();
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
			_fmp.SkipBySeconds(SkipAmount);
		}
	}
}
