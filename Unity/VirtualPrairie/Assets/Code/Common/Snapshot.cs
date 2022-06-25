using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using NaughtyAttributes;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using UnityEditor;
using UnityEngine;

[System.Serializable]
public enum ESnapshotType
{
	Float,
	Int,
	Bool,
	Enum,
	Vector3,
}

[System.Serializable]
public class SnapshotData
{
	public List<SnapshotEntry> Entries = new List<SnapshotEntry>();
}

[System.Serializable]
public class SnapshotEntry
{
	public string Name;
	public int ComponentInstanceID;
	public string FieldName;
	public ESnapshotType FieldType;

	[ShowIf("FieldType",ESnapshotType.Float)]
	[AllowNesting]
	public float FloatVal = -1f;
	[ShowIf("FieldType",ESnapshotType.Int)]
	[AllowNesting]
	public int IntVal = 0;
	[ShowIf("FieldType",ESnapshotType.Bool)]
	[AllowNesting]
	public bool BoolVal = false;

	[ShowIf("FieldType",ESnapshotType.Vector3)]
	public Vector3 VectorVal;

	public bool ObjectRef = false;
	[ShowIf("ObjectRef")]
	public string ObjRefFieldName = "";

	public SnapshotEntry()
	{

	}

	// base constructor
	public SnapshotEntry(string fieldName,string componentName, int componentId)
	{
		FieldName = fieldName;
		Name = $"{componentName}.{fieldName} ({componentId})";
		ComponentInstanceID = componentId;
	}

	// float constructor
	public SnapshotEntry(string fieldName,string componentName, int componentId, float floatVal) : this(fieldName,componentName,componentId)
	{
		FieldType = ESnapshotType.Float;
		FloatVal = floatVal;
	}

	// bool constructor
	public SnapshotEntry(string fieldName,string componentName, int componentId, bool boolVal) : this(fieldName,componentName,componentId)
	{
		FieldType = ESnapshotType.Bool;
		BoolVal = boolVal;
	}

	// int constructor
	public SnapshotEntry(string fieldName,string componentName, int componentId, int intVal) : this(fieldName,componentName,componentId)
	{
		FieldType = ESnapshotType.Int;
		IntVal = intVal;
	}

	// Vector3 constructor
	public SnapshotEntry(string fieldName,string componentName, int componentId, Vector3 vectorVal) : this(fieldName,componentName,componentId)
	{
		FieldType = ESnapshotType.Vector3;
		VectorVal = vectorVal;
	}

	// enum constructor
	public SnapshotEntry(string fieldName,string componentName, int componentId, Enum baseEnum, int enumVal) : this(fieldName,componentName,componentId)
	{
		FieldType = ESnapshotType.Enum;
		IntVal = enumVal;
	}

	public void setObjectRef(string objectRefName)
	{
		ObjectRef = true;
		ObjRefFieldName = objectRefName;
	}
}

public class VectorConverter : JsonConverter
{
    public override bool CanConvert(Type objectType)
    {
        return objectType == typeof(Vector3);
    }

    public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
    {
        var obj = JToken.Load(reader);
        if (obj.Type == JTokenType.Array)
        {
            var arr = (JArray)obj;
            if (arr.Count == 3 && arr.All(token => token.Type == JTokenType.Float))
            {
                return new Vector3(arr[0].Value<float>(), arr[1].Value<float>(), arr[2].Value<float>());
            }
        }
        return null;
    }

    public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
    {
        var vector = (Vector3)value;
        writer.WriteStartArray();
        writer.WriteValue(vector.x);
        writer.WriteValue(vector.y);
        writer.WriteValue(vector.z);
        writer.WriteEndArray();
    }
}

public class Snapshot : MonoBehaviour
{
	[ShowNonSerializedField]
	private int InstID = -1;
	
	[ShowNonSerializedField]
	private string LastSnapshotTime = "-";
	[ShowNonSerializedField]
	private string LastRestoreTime = "-";

	public List<SnapshotEntry> _snapshotEntries = new List<SnapshotEntry>();

	[Button("Snapshot")]
	public void TakeSnapshot()
	{
		InstID = gameObject.GetInstanceID();
		SnapshotData data = new SnapshotData();
		updateEntries();
		data.Entries = _snapshotEntries;
		string jsonStr = JsonConvert.SerializeObject(data,Formatting.Indented, new VectorConverter());
		File.WriteAllText(snapshotFileName(),jsonStr);
		Debug.Log("Wrote snapsthot to: " + snapshotFileName());
		LastSnapshotTime = nowStr;
	}

	string nowStr => DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();

	string snapshotFileName()
	{
		int goInstId = gameObject.GetInstanceID();
		string fileName = $"Snapshot_{goInstId}";
		return Path.Join(Application.persistentDataPath,fileName);
	}

	public void UpdateSnapshotSaveTimeFromFile()
	{
		if (File.Exists(snapshotFileName()))
		{
			DateTime dt = File.GetLastWriteTime(snapshotFileName());
			LastSnapshotTime = dt.ToShortDateString() + " " + dt.ToShortTimeString();
		}
		else
		{
			LastRestoreTime = "<not found>";
		}
	}

	[Button("RestoreSnapshot")]
	public void RestoreSnapshot()
	{
		if (!File.Exists(snapshotFileName()))
		{
			Debug.LogWarning($"Couldn't find snapshot file: {snapshotFileName()}");
			return;
		}

		string jsonStr = File.ReadAllText(snapshotFileName());
		if (string.IsNullOrEmpty(jsonStr))
		{
			Debug.LogError($"No Snapshot Found for game object:{snapshotFileName()}");
			return;
		}

		SnapshotData data = JsonConvert.DeserializeObject<SnapshotData>(jsonStr,new VectorConverter());
		foreach (var entry in data.Entries)
		{
			Debug.Log($"Try restoring:{entry.FieldName} on {entry.ComponentInstanceID}");
			var component = findComponentFromId(entry.ComponentInstanceID);
			if (component == null)
			{
				Debug.LogWarning($"{entry.FieldName} - Didn't find matching component {entry.ComponentInstanceID} - skipping!");
				continue;
			}
			
			FieldInfo field = null;
			if (entry.ObjectRef)
			{
				var parentField = component.GetType().GetField(entry.ObjRefFieldName);
				if (parentField != null)
				{
					field = parentField.FieldType.GetField(entry.FieldName);
					var objVal = parentField.GetValue(component);
					RestoreSnapshotEntry(entry,field,component,objVal);
				}
			}
			else
			{
				field = component.GetType().GetField(entry.FieldName);
				RestoreSnapshotEntry(entry,field,component,null);
			}
		}
		EditorUtility.SetDirty(gameObject);
		foreach (var c in GetComponents<MonoBehaviour>())
		{
			EditorUtility.SetDirty(c);
		}
		LastRestoreTime = nowStr;
	}

	[Button("ClearSnapshot")]
	void clearSnapshot()
	{
		_snapshotEntries.Clear();
		if (File.Exists(snapshotFileName()))
		{
			File.Delete(snapshotFileName());
		}
		UpdateSnapshotSaveTimeFromFile();
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
	public delegate SnapshotEntry EntryFromFieldDelegate(FieldInfo fieldInfo, MonoBehaviour component,System.Object objVal = null);
	static Dictionary<Type,EntryFromFieldDelegate> s_buildDelegateDict = new Dictionary<Type, EntryFromFieldDelegate>();

    void Awake()
	{
		InstID = GetInstanceID();
		updateDelegateDict();
	}

	public static SnapshotEntry CreateSnapshotEntryInt(FieldInfo fieldInfo, MonoBehaviour component,System.Object objVal = null)
	{
		return new SnapshotEntry(fieldInfo.Name,component.GetType().ToString(), component.GetInstanceID(),(int)fieldInfo.GetValue(objVal==null?component:objVal));
	}

	public static SnapshotEntry CreateSnapshotEntryFloat(FieldInfo fieldInfo, MonoBehaviour component, System.Object objVal = null)
	{
		return new SnapshotEntry(fieldInfo.Name,component.GetType().ToString(), component.GetInstanceID(),(float)fieldInfo.GetValue(objVal==null?component:objVal));
	}

	public static SnapshotEntry CreateSnapshotEntryBool(FieldInfo fieldInfo, MonoBehaviour component,System.Object objVal = null)
	{
		return new SnapshotEntry(fieldInfo.Name,component.GetType().ToString(), component.GetInstanceID(),(bool)fieldInfo.GetValue(objVal==null?component:objVal));
	}

	public static SnapshotEntry CreateSnapshotEntryEnum(FieldInfo fieldInfo, MonoBehaviour component,System.Object objVal = null)
	{
		Type enumType = Enum.GetUnderlyingType(fieldInfo.FieldType);
		object fieldVal = (objVal==null)?(fieldInfo.GetValue(component)):(fieldInfo.GetValue(objVal));
		var val = Convert.ChangeType(fieldVal, enumType);
		int intVal = (int) val;
		var entry = new SnapshotEntry(fieldInfo.Name,component.GetType().ToString(),component.GetInstanceID(),intVal);
		entry.FieldType = ESnapshotType.Enum;
		return entry;
	}

	public static SnapshotEntry CreateSnapshotEntryVector3(FieldInfo fieldInfo, MonoBehaviour component,System.Object objVal = null)
	{
		return new SnapshotEntry(fieldInfo.Name,component.GetType().ToString(), component.GetInstanceID(), (Vector3)fieldInfo.GetValue(objVal==null?component:objVal));
	}


	public static void RestoreSnapshotEntry(SnapshotEntry entry, FieldInfo fieldInfo, MonoBehaviour component, System.Object objVal = null)
	{
		// Debug.Log($"Restore Entry:{fieldInfo.Name}");
		switch (entry.FieldType)
		{
			case ESnapshotType.Float:
				fieldInfo.SetValue(objVal==null?component:objVal,entry.FloatVal);
				break;
			case ESnapshotType.Bool:
				fieldInfo.SetValue(objVal==null?component:objVal,entry.BoolVal);
				break;
			case ESnapshotType.Int:
				fieldInfo.SetValue(objVal==null?component:objVal,entry.IntVal);
				break;
			case ESnapshotType.Enum:
				fieldInfo.SetValue(objVal==null?component:objVal,entry.IntVal);
				break;
			case ESnapshotType.Vector3:
				fieldInfo.SetValue(objVal==null?component:objVal,entry.VectorVal);
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
			s_buildDelegateDict[typeof(int)] = (fi,c,o) => CreateSnapshotEntryInt(fi,c,o);
			s_buildDelegateDict[typeof(float)] = (fi,c,o) => CreateSnapshotEntryFloat(fi,c,o);
			s_buildDelegateDict[typeof(bool)] = (fi,c,o) => CreateSnapshotEntryBool(fi,c,o);
			s_buildDelegateDict[typeof(Vector3)] = (fi,c,o) => CreateSnapshotEntryVector3(fi,c,o);
			// s_buildDelegateDict[typeof(System.Enum)] = (fi,c,o) => CreateSnapshotEntryEnum(fi,c,o);
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
			if (mb is Snapshot)
			{
				Debug.Log("Skipping Snapshot component");
				continue;
			}

			int componentInstID = mb.GetInstanceID();
			
			var fields = mb.GetType().GetFields(BindingFlags.GetField | BindingFlags.Public | BindingFlags.Instance);
			foreach (var field in fields)
			{
				if (Attribute.IsDefined(field,typeof(SnapshotAttribute)) || Attribute.IsDefined(field,typeof(SnapshotAllAttribute)))
				{
					if (field.FieldType.IsClass)
					{
						if (field.FieldType.IsSubclassOf(typeof(MonoBehaviour)))
						{
							Debug.LogWarning($"Found game object reference {field.Name} - skipping");
						}
						else
						{
							// Debug.Log($"Found snapshot object reference type:{field.Name}");
							buildSnapshotEntriesFromObject(field,mb);
						}
					}
					else if (field.FieldType.IsEnum)
					{
						// Debug.Log($"Enum field type {field.Name}");
						var newEntry = CreateSnapshotEntryEnum(field,mb);
						_snapshotEntries.Add(newEntry);	
					}
					else if (!s_buildDelegateDict.ContainsKey(field.FieldType))
					{
						Debug.LogWarning($"Attmepted to snapshot a field of unsupported type: {field.FieldType.ToString()} {field.Name}");
					}
					else
					{
						// Debug.Log($"Snapshot field:{field.FieldType.ToString()} {field.Name}");
						SnapshotEntry entry = (s_buildDelegateDict[field.FieldType](field,mb));
						_snapshotEntries.Add(entry);
					}
				}
			}
		}
	}

	void buildSnapshotEntriesFromObject(FieldInfo field,MonoBehaviour mb)
	{
		var fields = field.FieldType.GetFields(BindingFlags.GetField | BindingFlags.Public | BindingFlags.Instance);
		var fieldObj = field.GetValue(mb);
		bool snapshotAll = Attribute.IsDefined(field, typeof(SnapshotAllAttribute));
		foreach (var subField in fields)
		{
			if (Attribute.IsDefined(subField,typeof(SnapshotAttribute)) || snapshotAll)
			{
				if (subField.FieldType.IsEnum)
				{
					// Debug.Log($"Enum sub field type {field.Name}");
					var newEntry = CreateSnapshotEntryEnum(subField,mb,fieldObj);
					newEntry.ObjectRef = true;
					newEntry.ObjRefFieldName = field.Name;
					_snapshotEntries.Add(newEntry);
				}
				else if (!s_buildDelegateDict.ContainsKey(subField.FieldType))
				{
					Debug.LogWarning($"Attmepted to snapshot a field of unsupported type: {field.FieldType.ToString()} {field.Name}/{subField.Name}");
				}
				else
				{
					var entry = (s_buildDelegateDict[subField.FieldType](subField,mb,fieldObj));
					entry.ObjectRef = true;
					entry.ObjRefFieldName = field.Name;
					_snapshotEntries.Add(entry);
				}
			}
		}
	}


}


