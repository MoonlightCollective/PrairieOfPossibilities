using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using FMODUnity;
using UnityEngine.UI;

public class FmodParamSetter : MonoBehaviour
{
	public bool IsGlobal = false;
	public Slider slider;
	public string ParamString;
	public StudioEventEmitter emitter;

	public void SliderUpdated()
	{
		if (!IsGlobal)
			emitter.SetParameter(ParamString, slider.value);
		else
			FMODUnity.RuntimeManager.StudioSystem.setParameterByName(ParamString,slider.value);
	}

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
		float val;
		FMODUnity.RuntimeManager.StudioSystem.getParameterByName(ParamString,out val);
        Debug.Log($"{ParamString}: {val}");
    }
}
