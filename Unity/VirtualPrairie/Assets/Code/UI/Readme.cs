using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Readme : MonoBehaviour
{
	[TextArea(4,10)]
	public string ReadmeString = "README";

	UIHudController _hud;
	void Awake()
	{
		_hud = GameObject.FindObjectOfType<UIHudController>();
	}
	void Start()
	{
		_hud.ReadmeText.text = ReadmeString;
	}
}
