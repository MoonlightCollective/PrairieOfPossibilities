using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
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
    const int UPDATE_INTERVAL = 1000 * 30; // every 30s

    private FMOD.Channel storyChannel;
    private System.Random rnd = new System.Random();
    

    private class sortByDate : IComparer<StoryClip>  {
        int IComparer<StoryClip>.Compare(StoryClip f1, StoryClip f2)  {
            return f1.st_mtime.CompareTo(f2.st_mtime);
        }
    }

    // Start is called before the first frame update
    void Start()
    {
        UpdateStoryClips();
    }

    private void UpdateStoryClips()
    {
        UnityEngine.Debug.LogWarning($"StoryClipPlayer.UpdateStoryClips: loading fresh the story clips");

        FileSystemInfo[] storyClipInfos;
        if (!Directory.Exists(this.StoryClipsAudioPath))
        {
            UnityEngine.Debug.LogWarning($"StoryClipPlayer.Start: the path {this.StoryClipsAudioPath} doesnt exist");
            return;
        }

        // get all the files in the directory (restrict the the json metadata files)
        DirectoryInfo dir = new DirectoryInfo(this.StoryClipsAudioPath);
        storyClipInfos = dir.GetFileSystemInfos("*.json");

        UnityEngine.Debug.LogWarning($"found {storyClipInfos.Length} files in the storyclip folder");

        var newBlocks = new List<EmotionBlock>();
        int clipCount = 0;

        // load up the JSON objects
        foreach (var info in storyClipInfos)
        {
            string jsonStr = File.ReadAllText(info.FullName);
            if (string.IsNullOrEmpty(jsonStr))
            {
                UnityEngine.Debug.LogWarning($"No metadata found for story clip:{info.FullName}");
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

        // grab everything not including tonight
        // what time is it now?
/*        var localNow = DateTimeOffset.Now;
        DateTimeOffset endDateTime;
        // is it before noon?
        if (localNow.Hour < 12)
        {
            // end at yesterday noon
            endDateTime = localNow.AddDays(-1);
            endDateTime = new DateTime(endDateTime.Year, endDateTime.Month, endDateTime.Day, 12, 0, 0, 0, DateKind.Local);
        }
        else
        {
            // end at today noon
            endDateTime = localNow;
            endDateTime = new DateTime(endDateTime.Year, endDateTime.Month, endDateTime.Day, 12, 0, 0, 0, DateKind.Local);
        }

        //DateTime (1970, 1, 1, 0, 0, 0, 0, 0, DateTimeKind.Utc);
        var endUnixTime = endDateTime.FromUnixTimeSeconds();
*/
        // sort the objects by time
        IComparer<StoryClip> byDateComparer = new sortByDate();
        foreach (var block in newBlocks)
        {
            block.StoryClips.Sort(byDateComparer);
        }

        UnityEngine.Debug.LogWarning($"StoryClipPlayer.UpdateStoryClips: loaded {clipCount} clips across {newBlocks.Count} emotions");
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
        if (Input.GetKeyDown(KeyCode.Z))
        {
            CallPhone();
        }
    }

    // ring a phone
    public void CallPhone()
    {
        // get a random number 
        var storyNum = UnityEngine.Random.Range(1,10);
        var phoneNum = UnityEngine.Random.Range(2000,2003);
        var callFileName = "/Users/moonlight/Documents/ContainerData/callPhone.call";
        // write the file out
        StreamWriter writer = new StreamWriter(callFileName, false);  // false == overwrite
        writer.WriteLine($"Channel: Local/{phoneNum}@from-internal");
        writer.WriteLine($"Application: Playback");
        writer.WriteLine($"Data:/var/lib/asterisk/sounds/recordings/archive/story_{storyNum}");
        writer.Close();

        // copy the call file to the pbx
        var cmdLine = $"-p \"raspberry\" scp {callFileName} root@192.168.0.219:/var/spool/asterisk/outgoing";

        UnityEngine.Debug.Log($"Process.Start(sshpass, {cmdLine})");
        Process.Start("/opt/homebrew/bin/sshpass", cmdLine);
    }

    private StoryClip GetNextStory()
    {
        if (this.emotionBlocks == null || this.emotionBlocks.Count == 0)
        {
            UnityEngine.Debug.LogWarning($"StoryClipPlayer.GetNextStory: no story to return");
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
            UnityEngine.Debug.LogWarning($"StoryClipPlayer.GetNextStory: no story to return in emotion {this.emotionBlocks[this.lastEmotionPlayed].Emotion} ");
            return null;
        }

        int clipToPlay = rnd.Next(0, this.emotionBlocks[this.lastEmotionPlayed].StoryClips.Count);
        return this.emotionBlocks[this.lastEmotionPlayed].StoryClips[clipToPlay];
    }

    public void PlayStoryClip()
    {
       // play the next clip
        var storyClip = this.GetNextStory();
        if (storyClip == null)
        {
            UnityEngine.Debug.LogWarning($"StoryClipPlayer.PlayStoryClip: no story to play");
            return;
        }

        // are we playing a story clip already ?
        bool isPlaying = false;
        this.storyChannel.isPlaying(out isPlaying);
        if (isPlaying)
        {
            UnityEngine.Debug.Log($"StoryClipPlayer.PlayStoryClip: a clip was already playing ; ignoring this request.");
            // this.storyChannel.stop();
            return;
        }

        UnityEngine.Debug.LogWarning($"StoryClipPlayer.PlayStoryClip: playing story clip {storyClip.classifier[0].label}, {storyClip.FullName}");

        FMOD.ChannelGroup channelGroup;
        FMOD.Sound sound1;

        var res = FMODUnity.RuntimeManager.CoreSystem.getMasterChannelGroup(out channelGroup);
       
        UnityEngine.Debug.Log($"createSound({storyClip.FullName})");
        res = FMODUnity.RuntimeManager.CoreSystem.createSound(storyClip.FullName, FMOD.MODE.DEFAULT, out sound1);

        UnityEngine.Debug.Log($"playSound())");
        res = FMODUnity.RuntimeManager.CoreSystem.playSound(sound1, channelGroup, false, out this.storyChannel);
    }	
}