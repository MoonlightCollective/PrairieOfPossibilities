using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using FMODUnity;
using UnityEngine.UI;

public class FmodParamSetter : MonoBehaviour
{
	public StudioEventEmitter emitter;
	public Slider slider;
	public string ParamString;
	public void SliderUpdated()
	{
		emitter.SetParameter(ParamString, slider.value);
	}

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
