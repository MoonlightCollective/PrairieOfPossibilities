using UnityEngine;
using System.Collections;
using TMPro;

public class UIFpsCounter: MonoBehaviour 
{
	TextMeshProUGUI _text;
	string label = "";
    float updateInterval = 0.2f;

    private double lastInterval;
    private int frames;
    private float fps;

	void Awake()
	{
		_text = GetComponent<TextMeshProUGUI>();
	}

    void Start()
    {
        lastInterval = Time.realtimeSinceStartup;
        frames = 0;
		fps = 0;
    }

    void Update()
    {
        ++frames;
        float timeNow = Time.realtimeSinceStartup;
        if (timeNow > lastInterval + updateInterval)
        {
            fps = (float)(frames / (timeNow - lastInterval));
            frames = 0;
            lastInterval = timeNow;
        }

        _text.text = fps.ToString("f2");
    }
}