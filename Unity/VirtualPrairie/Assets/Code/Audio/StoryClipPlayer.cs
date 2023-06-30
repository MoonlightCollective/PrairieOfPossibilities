using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using Assets.Code.StateTable;
using FMODUnity;
using FMOD.Studio;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.Networking;
using System.Runtime.InteropServices;

public class StoryClipPlayer  : MonoBehaviour
{

	public string StoryClipsAudioPath = "/data/audiopipline/StoryClipsAudioPath";
    public int MostRecentClipsToPlay = 10;

    private FileSystemInfo[] storyClipInfos;
    private int lastStoryPlayed = -1;

    private class sortByDate : IComparer  {
        int IComparer.Compare( System.Object f1, System.Object f2 )  {
            return ((FileSystemInfo)f1).LastWriteTimeUtc.CompareTo(((FileSystemInfo)f2).LastWriteTimeUtc);
        }
    }

    // Start is called before the first frame update
    void Start()
    {
        if (!Directory.Exists(this.StoryClipsAudioPath))
        {
            Debug.LogWarning($"StoryClipPlayer.Start: the path {this.StoryClipsAudioPath} doesnt exist");
            return;
        }

        // get all the files in the directory
        DirectoryInfo dir = new DirectoryInfo(this.StoryClipsAudioPath);
        this.storyClipInfos = dir.GetFileSystemInfos();

        Debug.Log($"found {this.storyClipInfos.Length} files in the storyclip folder");

        // sort the fileinfos by time
        IComparer byDateComparer = new sortByDate();
        Array.Sort(this.storyClipInfos, byDateComparer);
    }

    // note: using IEnumerator as a retval makes this a coroutine (and can run async over multiple frames)
    public IEnumerator PlayStoryClip()
    {
        // play the next clip
        this.lastStoryPlayed += 1;
        Debug.Log($"StoryClipPlayer.PlayStoryClip: playing story clip {this.lastStoryPlayed}, {this.storyClipInfos[this.lastStoryPlayed].FullName}");

        AudioClip storyClip;

        // open the file
        using (UnityWebRequest www = UnityWebRequestMultimedia.GetAudioClip($"file://{this.storyClipInfos[this.lastStoryPlayed].FullName}", AudioType.WAV))
        {
            yield return www.SendWebRequest();
            Debug.Log($"www.result = {www.result}");
            if (www.result == UnityWebRequest.Result.ConnectionError)
            {
                Debug.Log(www.error);
                yield break;
            }

            storyClip = DownloadHandlerAudioClip.GetContent(www);
        }

        Debug.Log($"storyClip = {storyClip.name}, {storyClip.length}");
    }
	
}