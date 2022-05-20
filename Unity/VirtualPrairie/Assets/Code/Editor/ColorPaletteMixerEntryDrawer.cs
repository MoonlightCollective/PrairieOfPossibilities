using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using PygmyMonkey.ColorPalette.Utils;
using UnityEditor;
using PygmyMonkey.ColorPalette;

[CustomPropertyDrawer(typeof(ColorPaletteMixerEntry))]
public class ColorPaletteMixerEntryDrawer : PropertyDrawer
{
	public override float GetPropertyHeight(SerializedProperty property, GUIContent label)
	{
		float h = EditorGUIUtility.singleLineHeight * 2;
		return h;
	}

	public override void OnGUI(Rect position, SerializedProperty property, GUIContent label)
	{
		var paletteDexProp = property.FindPropertyRelative("PaletteDex");

		var pygmyInstance = ColorPaletteData.Singleton;
		int paletteDexActual = Mathf.Min(paletteDexProp.intValue,pygmyInstance.colorPaletteList.Count-1);
		ColorPalette selectedPalette = pygmyInstance.colorPaletteList[paletteDexActual];
		string selectedPaletteName = selectedPalette.name;
		int paletteCount = pygmyInstance.colorPaletteList.Count;
		string[] paletteNames = new string[paletteCount];
		for (int i = 0; i < paletteCount-1; i++)
		{
			paletteNames[i] = pygmyInstance.colorPaletteList[i].name;
		}

		EditorGUI.BeginProperty(position, label, property);
		paletteDexProp.intValue = EditorGUI.Popup(position, "Palette",paletteDexProp.intValue,paletteNames);
		EditorGUI.EndProperty();

		// now draw the preview.
		float totalRectWidth = position.width;
		float totalRectHeight = EditorGUIUtility.singleLineHeight / 2.0f;
		int numSwatches = pygmyInstance.colorPaletteList[paletteDexProp.intValue].colorInfoList.Count;
		float widthPerSwatch = totalRectWidth/(float)numSwatches;

		position.y += EditorGUIUtility.singleLineHeight + 4;

		for (int i = 0; i < numSwatches; i++)
		{
			Color c = pygmyInstance.colorPaletteList[paletteDexProp.intValue].colorInfoList[i].color;
			Rect r = new Rect(i*widthPerSwatch + (position.x), position.y, widthPerSwatch, totalRectHeight);
			EditorGUI.DrawRect(r,c);
		}
	}
}

[CustomPropertyDrawer(typeof(ColorPaletteMix))]
public class ColorPaletteMixEntryDrawer : PropertyDrawer
{
	public override float GetPropertyHeight(SerializedProperty property, GUIContent label)
	{
		float h = EditorGUIUtility.singleLineHeight;
		return h;
	}

	public override void OnGUI(Rect position, SerializedProperty property, GUIContent label)
	{
		float totalRectWidth = position.width;
		float totalRectHeight = EditorGUIUtility.singleLineHeight;

		SerializedProperty colorsProp = property.FindPropertyRelative("Colors");

		// position.y += EditorGUIUtility.singleLineHeight;



		Rect totalRect = new Rect(position.x,position.y, totalRectWidth,EditorGUIUtility.singleLineHeight);
		EditorGUI.LabelField(position,property.displayName);

		Rect previewRect = new Rect(totalRect.width * .3f, position.y + totalRectHeight/4f, totalRect.width * .7f, totalRectHeight);

		// Rect previewRect = totalRect;
		int numSwatches = ColorPaletteMix.kPrairieColorMixCount;
		float widthPerSwatch = previewRect.width/(float)numSwatches;
		
		EditorGUI.BeginProperty(position,null,colorsProp);
		for (int i = 0; i < numSwatches; i++)
		{
			Color c = colorsProp.GetArrayElementAtIndex(i).colorValue;
			c.a = 1.0f;
			Rect r = new Rect(i*widthPerSwatch + (previewRect.x), previewRect.y, widthPerSwatch, totalRectHeight/2.0f);
			EditorGUI.DrawRect(r,c);
		}
		EditorGUI.EndProperty();
		position.y += EditorGUIUtility.singleLineHeight;
	}
}
