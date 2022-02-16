using UnityEngine;
using System.Collections;
using UnityEngine.UI;

namespace OxOD
{
    public class FileListElement : MonoBehaviour
    {
        public Image icon;
        public TMPro.TMP_Text elementName;
        public TMPro.TMP_Text size;

        public FileDialog instance;
        public bool isFile;
        public string data;

        void Start()
        {

        }
        
        void Update()
        {

        }

        public void OnClick()
        {
            if (!isFile)
                instance.OpenDir(data);
            else
                instance.SelectFile(data);
        }

        public void OnDoubleClick()
        {
            if (isFile)
                instance.SelectFile(data, true);
        }
    }
}