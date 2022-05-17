using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using NaughtyAttributes;
using Newtonsoft.Json;
using UnityEngine;


[System.Serializable]
public class SnapshotData
{
	public List<SnapshotEntry> Entries = new List<SnapshotEntry>();
}

[System.Serializable]
public class SnapshotEntry
{
	public int ComponentInstanceID;
	public string FieldName;
	public ESnapshotType FieldType;

	public Vector3 LocalTransformValues = Vector3.zero;
	public Vector3 RotationEulers = Vector3.zero;

	[ShowIf("FieldType",ESnapshotType.Float)]
	[AllowNesting]
	public float FloatVal;
	[ShowIf("FieldType",ESnapshotType.Int)]
	[AllowNesting]
	public int IntVal;
	[ShowIf("FieldType",ESnapshotType.Bool)]
	[AllowNesting]
	public bool BoolVal;

	public SnapshotEntry()
	{

	}

	public SnapshotEntry(string fieldName, int componentId)
	{
		FieldName = fieldName;
		ComponentInstanceID = componentId;
	}

	public SnapshotEntry(string fieldName, int componentId, float floatVal) : this(fieldName,componentId)
	{
		FieldType = ESnapshotType.Float;
		FloatVal = floatVal;
	}

	public SnapshotEntry(string fieldName, int componentId, bool boolVal) : this(fieldName,componentId)
	{
		FieldType = ESnapshotType.Bool;
		BoolVal = boolVal;
	}

	public SnapshotEntry(string fieldName, int componentId, int intVal) : this(fieldName,componentId)
	{
		FieldType = ESnapshotType.Int;
		IntVal = intVal;
	}
}

public enum ESnapshotType
{
	Float,
	Int,
	Bool,
}

public class Snapshot : MonoBehaviour
{
	public int InstID = -1;
	public List<SnapshotEntry> _snapshotEntries = new List<SnapshotEntry>();
    
	[Button("Snapshot")]
	public void TakeSnapshot()
	{
		InstID = gameObject.GetInstanceID();
		SnapshotData data = new SnapshotData();
		updateEntries();
		data.Entries = _snapshotEntries;
		string jsonStr = JsonConvert.SerializeObject(data,Formatting.Indented);
		File.WriteAllText(snapshotFileName(),jsonStr);
		Debug.Log("Wrote snapsthot to: " + snapshotFileName());
	}

	string snapshotFileName()
	{
		int goInstId = gameObject.GetInstanceID();
		string fileName = $"Snapshot_{goInstId}";
		return Path.Join(Application.persistentDataPath,fileName);
	}

	[Button("RestoreSnapshot")]
	public void RestoreSnapshot()
	{
		string jsonStr = File.ReadAllText(snapshotFileName());
		if (string.IsNullOrEmpty(jsonStr))
		{
			Debug.LogError($"No Snapshot Found for game object:{snapshotFileName()}");
			return;
		}

		SnapshotData data = JsonConvert.DeserializeObject<SnapshotData>(jsonStr);
		foreach (var entry in data.Entries)
		{
			// Debug.Log($"Try restoring:{entry.FieldName} on {entry.ComponentInstanceID}");
			var component = findComponentFromId(entry.ComponentInstanceID);
			if (component == null)
			{
				Debug.LogWarning("Didn't find matching component - skipping!");
				continue;
			}
			
			var field = component.GetType().GetField(entry.FieldName);
			if (field != null)
			{
				RestoreSnapshotEntry(entry,field,component);
			}
		}
	}

	[Button("ClearSnapshot")]
	void clearSnapshot()
	{
		_snapshotEntries.Clear();
	}

	MonoBehaviour findComponentFromId(int instID)
	{
		var components = GetComponents<MonoBehaviour>();
		foreach (var c in components)
		{
			if (c.GetInstanceID() == instID)
			{
				return c;
			}
		}
		return null;
	}

	// Start is called before the first frame update
	public delegate SnapshotEntry EntryFromFieldDelegate(FieldInfo fieldInfo, MonoBehaviour component);
	static Dictionary<Type,EntryFromFieldDelegate> s_buildDelegateDict = new Dictionary<Type, EntryFromFieldDelegate>();

    void Awake()
	{
		InstID = GetInstanceID();
		updateDelegateDict();
	}

	public static SnapshotEntry CreateSnapshotEntryInt(FieldInfo fieldInfo, MonoBehaviour component)
	{
		return new SnapshotEntry(fieldInfo.Name,component.GetInstanceID(),(int)fieldInfo.GetValue(component));
	}

	public static SnapshotEntry CreateSnapshotEntryFloat(FieldInfo fieldInfo, MonoBehaviour component)
	{
		return new SnapshotEntry(fieldInfo.Name,component.GetInstanceID(),(float)fieldInfo.GetValue(component));
	}

	public static SnapshotEntry CreateSnapshotEntryBool(FieldInfo fieldInfo, MonoBehaviour component)
	{
		return new SnapshotEntry(fieldInfo.Name,component.GetInstanceID(),(bool)fieldInfo.GetValue(component));
	}

	public static void RestoreSnapshotEntry(SnapshotEntry entry, FieldInfo fieldInfo, MonoBehaviour component)
	{
		switch (entry.FieldType)	
		{
			case ESnapshotType.Float:
				fieldInfo.SetValue(component,entry.FloatVal);
				break;
			case ESnapshotType.Bool:
				fieldInfo.SetValue(component,entry.BoolVal);
				break;
			case ESnapshotType.Int:
				fieldInfo.SetValue(component,entry.IntVal);
				break;
		}
	}

	void Start()
    {
		updateEntries();
    }

	void updateDelegateDict()
	{
		if (s_buildDelegateDict.Keys.Count < 1)
		{
			s_buildDelegateDict[typeof(int)] = (fi,c) => CreateSnapshotEntryInt(fi,c);
			s_buildDelegateDict[typeof(float)] = (fi, c) => CreateSnapshotEntryFloat(fi,c);
			s_buildDelegateDict[typeof(bool)] = (fi, c) => CreateSnapshotEntryBool(fi,c);
		}
	}

	void updateEntries()
	{
		updateDelegateDict();

		_snapshotEntries.Clear();

		var allComponents = this.GetComponents<MonoBehaviour>();
		int gameObjInstID = this.gameObject.GetInstanceID();
		foreach (var mb in allComponents)
		{
			int componentInstID = mb.GetInstanceID();
			
			var fields = mb.GetType().GetFields(BindingFlags.GetField | BindingFlags.Public | BindingFlags.Instance);
			foreach (var field in fields)
			{
				if (Attribute.IsDefined(field,typeof(SnapshotAttribute)))
				{
					if (!s_buildDelegateDict.ContainsKey(field.FieldType))
					{
						Debug.LogWarning($"Attmepted to snapshot a field of unsupported type: {field.FieldType.ToString()} {field.Name}");
					}
					else
					{
						Debug.Log($"Snapshot field:{field.FieldType.ToString()} {field.Name}");
						SnapshotEntry entry = (s_buildDelegateDict[field.FieldType](field,mb));
						_snapshotEntries.Add(entry);
					}
				}
			}
		}
	}

}
