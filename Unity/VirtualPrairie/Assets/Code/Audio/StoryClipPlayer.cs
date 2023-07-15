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
        public AudioSource audioSource;
    public float volume=0.5f;

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

        // load in audio source 
        audioSource = GetComponent<AudioSource>();
    }

	void Update()
	{
		if (Input.GetKeyDown(KeyCode.S))
		{
			PlayStoryClip();
		}
	}

    public void PlayStoryClip()
    {
       // play the next clip
        this.lastStoryPlayed += 1;
        Debug.Log($"StoryClipPlayer.PlayStoryClip: playing story clip {this.lastStoryPlayed}, {this.storyClipInfos[this.lastStoryPlayed].FullName}");

        FMOD.ChannelGroup channelGroup;
        var res = FMODUnity.RuntimeManager.CoreSystem.getMasterChannelGroup(out channelGroup);
        FMOD.Sound sound1;
       
        Debug.Log($"createSound({this.storyClipInfos[this.lastStoryPlayed].FullName})");
        res = FMODUnity.RuntimeManager.CoreSystem.createSound(this.storyClipInfos[this.lastStoryPlayed].FullName, FMOD.MODE.DEFAULT, out sound1);
        FMOD.Channel channel1;
        Debug.Log($"playSound())");
        res = FMODUnity.RuntimeManager.CoreSystem.playSound(sound1, channelGroup, false, out channel1);    
    }	
}