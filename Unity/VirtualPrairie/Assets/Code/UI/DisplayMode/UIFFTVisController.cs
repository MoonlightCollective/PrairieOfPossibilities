using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIFFTVisController : MonoBehaviour
{
	public int BinStartDex = 0;
	public int BinDexSkip = 1;
	public float BinValMult = 1.0f;
	public float ScaleMin = 0.0f;
	public float ScaleMax = 1.0f;

	public float DecayRate = 1.0f;

	List<Image> _images;
	FmodMusicPlayer _musicPlayer;
	
	void Awake()
	{
		_images = new List<Image>(GetComponentsInChildren<Image>());
		_images.RemoveAll(image => (image.gameObject == gameObject));
	}

	void Start()
	{
		_musicPlayer = GameObject.FindObjectOfType<FmodMusicPlayer>();

	}
    // Update is called once per frame
    void Update()
    {
		if (_musicPlayer == null || _musicPlayer.FftBinCount < 1)
		{
			return;
		}

		for(int i = 0; i < _images.Count; i++)
		{
			int binDex = BinStartDex + (i * BinDexSkip);
			float newScale = 0f;
			if (binDex < _musicPlayer.FftBins.Length)
			{
				newScale = Mathf.Clamp(_musicPlayer.FftBins[binDex] * BinValMult, ScaleMin, ScaleMax);
			}
			Vector3 newScaleVect = _images[i].transform.localScale;
			if (newScale > newScaleVect.y)
				newScaleVect.y = newScale;
			else
				newScaleVect.y = Mathf.MoveTowards(newScaleVect.y,newScale,Time.deltaTime * DecayRate);
			
			_images[i].transform.localScale = newScaleVect;
		}
    }
}
