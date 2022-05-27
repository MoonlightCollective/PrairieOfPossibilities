using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
public class LayoutAutoLoader : MonoBehaviour
{
	public bool AutoLoadAtStartup = true;
	public string LayoutJsonFile = "Layout.json";

    // Start is called before the first frame update
    void Start()
    {
		var layoutGen = GameObject.FindObjectOfType<FixtureLayoutGen>();
		string layoutPath = Path.Combine(Application.streamingAssetsPath,LayoutJsonFile);
		layoutGen.ImportLayout.ClearChildrenFrom(PrairieUtil.GetLayoutRoot());
		
		if (!File.Exists(layoutPath))
		{
			Debug.LogError($"Unable to find file: {layoutPath} - doesn't exist!");
			return;
		}

		layoutGen.DoImportLayout(PrairieUtil.GetLayoutRoot(),layoutPath,false);
    }
}
