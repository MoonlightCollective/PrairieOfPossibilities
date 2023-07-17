using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Assets.Code.StateTable;
using FMODUnity;
using FMOD.Studio;
using Newtonsoft.Json;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.Networking;
using System.Runtime.InteropServices;

public class EmotionBlock
{
    public string Emotion;
    public int LastClipPlayed = -1;
    public List<StoryClip> StoryClips;
}

public class StoryClipClassifier
{
    public string label;
    public float score;
}
public class StoryClip 
{
    public string FullName;
    public string masterAudioFile;
    public string audioFragmentFile;
    public string segmentLength;
    public float st_mtime;
    public string text;
    public StoryClipClassifier[] classifier;
}

public class StoryClipPlayer  : MonoBehaviour
{
	public string StoryClipsAudioPath = "/ContainerData/stage3";
    public int MostRecentClipsToPlay = 10;
    public float volume=0.5f;

    private List<EmotionBlock> emotionBlocks = new List<EmotionBlock>();
    private int lastEmotionPlayed = -1;
    private int lastUpdateTickCount = 0;
    const int UPDATE_INTERVAL = 1000 * 60; // every minute
    

    private class sortByDate : IComparer<StoryClip>  {
        int IComparer<StoryClip>.Compare(StoryClip f1, StoryClip f2)  {
            return f1.st_mtime.CompareTo(f2.st_mtime);
        }
    }

    // Start is called before the first frame update
    void Start()
    {
    }

    private void UpdateStoryClips()
    {
        Debug.Log($"StoryClipPlayer.UpdateStoryClips: loading fresh the story clips");

        FileSystemInfo[] storyClipInfos;
        if (!Directory.Exists(this.StoryClipsAudioPath))
        {
            Debug.LogWarning($"StoryClipPlayer.Start: the path {this.StoryClipsAudioPath} doesnt exist");
            return;
        }

        // get all the files in the directory (restrict the the json metadata files)
        DirectoryInfo dir = new DirectoryInfo(this.StoryClipsAudioPath);
        storyClipInfos = dir.GetFileSystemInfos("*.json");

        Debug.Log($"found {storyClipInfos.Length} files in the storyclip folder");

        var newBlocks = new List<EmotionBlock>();
        int clipCount = 0;

        // load up the JSON objects
        foreach (var info in storyClipInfos)
        {
            string jsonStr = File.ReadAllText(info.FullName);
            if (string.IsNullOrEmpty(jsonStr))
            {
                Debug.LogError($"No metadata found for story clip:{info.FullName}");
                return;
            }

            var data = JsonConvert.DeserializeObject<StoryClip>(jsonStr);
            // trim the .json file to get the wav file
            data.FullName = info.FullName.Substring(0, info.FullName.Length-5);
            var block = newBlocks.FirstOrDefault(b => b.Emotion.Equals(data.classifier[0].label));
            if (block == null)
            {
                block = new EmotionBlock();
                block.Emotion = data.classifier[0].label;
                block.StoryClips = new List<StoryClip>();
                newBlocks.Add(block);
            }
            block.StoryClips.Add(data);
            clipCount += 1;
        }

        // sort the objects by time
        IComparer<StoryClip> byDateComparer = new sortByDate();
        foreach (var block in newBlocks)
        {
            block.StoryClips.Sort(byDateComparer);
        }

        Debug.Log($"StoryClipPlayer.UpdateStoryClips: loaded {clipCount} clips across {newBlocks.Count} emotions");
        this.emotionBlocks = newBlocks;
    }

	void Update()
	{
        if (Environment.TickCount > this.lastUpdateTickCount + UPDATE_INTERVAL)
        {
            this.UpdateStoryClips();
            this.lastUpdateTickCount = Environment.TickCount;
        }
		if (Input.GetKeyDown(KeyCode.S))
		{
			PlayStoryClip();
		}
	}

    private StoryClip GetNextStory()
    {
        if (this.emotionBlocks == null || this.emotionBlocks.Count == 0)
        {
            Debug.LogWarning($"StoryClipPlayer.GetNextStory: no story to return");
            return null;
        }

        this.lastEmotionPlayed += 1;

        // did we overflow the list?
        if (this.lastEmotionPlayed >= this.emotionBlocks.Count)
        {
            this.lastEmotionPlayed = 0;
        }

        // grab a metadata file
        if (this.emotionBlocks[this.lastEmotionPlayed].StoryClips == null || 
            this.emotionBlocks[this.lastEmotionPlayed].StoryClips.Count == 0)
        {
            Debug.LogWarning($"StoryClipPlayer.GetNextStory: no story to return in emotion {this.emotionBlocks[this.lastEmotionPlayed].Emotion} ");
            return null;
        }

        // did we overflow the list?
        this.emotionBlocks[this.lastEmotionPlayed].LastClipPlayed += 1;
        if (this.emotionBlocks[this.lastEmotionPlayed].LastClipPlayed >= this.emotionBlocks[this.lastEmotionPlayed].StoryClips.Count)
        {
            this.emotionBlocks[this.lastEmotionPlayed].LastClipPlayed = 0;
        }

        return this.emotionBlocks[this.lastEmotionPlayed].StoryClips[this.emotionBlocks[this.lastEmotionPlayed].LastClipPlayed];
    }

    public void PlayStoryClip()
    {
       // play the next clip
        var storyClip = this.GetNextStory();
        if (storyClip == null)
        {
            Debug.LogWarning($"StoryClipPlayer.PlayStoryClip: no story to play");
        }

        Debug.Log($"StoryClipPlayer.PlayStoryClip: playing story clip {storyClip.classifier[0].label}, {storyClip.FullName}");

        FMOD.ChannelGroup channelGroup;
        var res = FMODUnity.RuntimeManager.CoreSystem.getMasterChannelGroup(out channelGroup);
        FMOD.Sound sound1;
       
        Debug.Log($"createSound({storyClip.FullName})");
        res = FMODUnity.RuntimeManager.CoreSystem.createSound(storyClip.FullName, FMOD.MODE.DEFAULT, out sound1);
        FMOD.Channel channel1;
        Debug.Log($"playSound())");
        res = FMODUnity.RuntimeManager.CoreSystem.playSound(sound1, channelGroup, false, out channel1);    
    }	
}