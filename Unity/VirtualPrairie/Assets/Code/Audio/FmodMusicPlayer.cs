using System;
using System.Collections;
using System.Collections.Generic;
using Assets.Code.StateTable;
using FMODUnity;
using FMOD.Studio;
using UnityEngine;
using UnityEngine.Events;
using System.Runtime.InteropServices;

public abstract class PrairieMusicPlayer : MonoBehaviour
{
	// public event System.EventHandler PlaybackStarted;
	// public event System.EventHandler PlaybackFinished;

	public UnityEvent<int,int> OnBeatEvent;
	public UnityEvent<string> OnMarkerEvent;
	public UnityEvent<string> OnStartMusicEvent;
	public UnityEvent<string> OnStopMusicEvent;
	public UnityEvent OnSongCompleteEvent;

	public abstract void PlayMusic(EventReference musicEvent);
	public abstract void StopMusic();
	public abstract void PauseMusic();
	public abstract void ResumeMusic();

	public abstract bool ReadyForPlayback();
}	

public class FmodMusicPlayer : PrairieMusicPlayer
{
	EventReference _curEventRef;
	EventInstance _curEventInstance;

	private FMOD.Studio.EVENT_CALLBACK _musicCallback;
	private GCHandle _musicCallbackUserDataHandle;

	protected int _lastBar = -1;
	protected int _lastBeat = -1;
	protected float _lastTempo = 0f;
	protected int _timeSigBeatsPerBar = 4;
	public int BeatsPerBar => _timeSigBeatsPerBar;

	protected int _lastTimelinePosSec = 0;
	public int LastTimelinePos => _lastTimelinePosSec;
	
	protected FMOD.DSP _fft;
	protected int _fftWindowSize = 512;
	public float[] RawFFTValues; 
	
	public int FftBinCount;
	public float[] FftBins;

	bool _inCleanup = false;
	public enum EFmodMusicPlayerState
	{
		Stopped,
		Paused,
		Playing,
	}
	
	private enum EFmodMusicPlayerAction
	{
		[StateActionRequired(false)] Enter,
		[StateActionRequired(false)] Update,
		[StateActionRequired(false)] Exit,
		[StateActionRequired(false)] Play,
		[StateActionRequired(false)] Stop,
		[StateActionRequired(false)] Pause,
	}
	
	private StateTable<EFmodMusicPlayerState,FmodMusicPlayer,EFmodMusicPlayerAction> _stateMachine;
	
	private void createStateMachine()
	{
		_stateMachine = new StateTable<EFmodMusicPlayerState,FmodMusicPlayer,EFmodMusicPlayerAction>(this);
		_stateMachine.LogStatePrefix = "XXXX";
		_stateMachine.LogStateTransitions = true;
		_stateMachine.InitActionTable();
	}
	
	public override bool ReadyForPlayback()
	{
		return (_curEventInstance.isValid());
	}

	public override void PlayMusic(EventReference musicEvent)
	{
		_stateMachine.DoStateAction(EFmodMusicPlayerAction.Play,new StateTableValue{Value = musicEvent});
	}

	public override void ResumeMusic()
	{
		if (ReadyForPlayback())
			_stateMachine.DoStateAction(EFmodMusicPlayerAction.Play,new StateTableValue{Value = _curEventRef});
		else
			StopMusic();
	}

	public override void StopMusic()
	{
		_stateMachine.DoStateAction(EFmodMusicPlayerAction.Stop);
	}

	public override void PauseMusic()
	{
		_stateMachine.DoStateAction(EFmodMusicPlayerAction.Pause);
	}

	public bool IsPlaying()
	{
		if (_stateMachine == null)
			return false;
		
		return (_stateMachine.CurrentState == EFmodMusicPlayerState.Playing);
	}

	public void SkipBySeconds(int skipSeconds)
	{
		if (!_curEventInstance.isValid())
			return;

		EventDescription ed;
		_curEventInstance.getDescription(out ed);

		int lenMSec;
		ed.getLength(out lenMSec);

		int newPos = _lastTimelinePosSec +  (skipSeconds * 1000);
		if (newPos < 0)
			newPos = 0;

		if (newPos > lenMSec)
			newPos = lenMSec - 1000; // one second before end.


		_curEventInstance.setTimelinePosition(newPos);
	}

	//===============
	// Unity Events
	//===============
	public void Awake()
	{
		// FMODUnity.RuntimeManager.setf
		// var foo = FMODUnity.Settings.Instance.GetEditorSpeakerMode();
		// Debug.Log("SPEAKER MODE:" + foo);
		allocateFFTArray();
		createStateMachine();
		_stateMachine.GotoState(EFmodMusicPlayerState.Stopped);
	}
	
	public void Start()
	{
		connectToFFT();
	}

	public void Update()
	{
		_stateMachine.DoStateAction(EFmodMusicPlayerAction.Update);
	}

	void allocateFFTArray()
	{
		RawFFTValues = new float[_fftWindowSize];
		FftBins = new float[FftBinCount];
		clearFFTVals();

	}
	
	void connectToFFT()
	{
			// Create a DSP of DSP_TYPE.FFT
		if (FMODUnity.RuntimeManager.CoreSystem.createDSPByType(FMOD.DSP_TYPE.FFT, out _fft) == FMOD.RESULT.OK)
		{
			_fft.setParameterInt((int)FMOD.DSP_FFT.WINDOWTYPE, (int)FMOD.DSP_FFT_WINDOW.HANNING);
			_fft.setParameterInt((int)FMOD.DSP_FFT.WINDOWSIZE, _fftWindowSize * 2);
			FMODUnity.RuntimeManager.StudioSystem.flushCommands();

			// Get the master bus
			FMOD.Studio.Bus selectedBus = FMODUnity.RuntimeManager.GetBus("bus:/");
			if (selectedBus.hasHandle())
			{
				// Get the channel group
				FMOD.ChannelGroup channelGroup;
				if (selectedBus.getChannelGroup(out channelGroup) == FMOD.RESULT.OK)
				{
					// Add fft to the channel group
					if (channelGroup.addDSP(FMOD.CHANNELCONTROL_DSP_INDEX.HEAD, _fft) != FMOD.RESULT.OK)
					{
						Debug.LogWarningFormat("FMOD: Unable to add mFFT to the master channel group");
					}
				}
				else
				{
					Debug.LogWarningFormat("FMOD: Unable to get Channel Group from the selected bus");
				}
			}
			else
			{
				Debug.LogWarningFormat("FMOD: Unable to get the selected bus");
			}
		}
		else
		{
			Debug.LogWarningFormat("FMOD: Unable to create FMOD.DSP_TYPE.FFT");
		}


	}

	void clearFFTVals()
	{
		for(int i = 0; i < RawFFTValues.Length; i++)
		{
			RawFFTValues[i] = 0f;
		}
		
		for (int i = 0; i < FftBins.Length; i++)
		{
			FftBins[i] = 0f;
		}
	}
	
	void reset()
	{
		Debug.Log("fmp:RESET");
		_curEventInstance.clearHandle();
		_lastTimelinePosSec = 0;
	}

	protected EventInstance createNewFmodEventInstance(EventReference eventRef)
	{
		EventInstance inst = FMODUnity.RuntimeManager.CreateInstance(eventRef);
		return inst;
	}

	public void OnDestroy()
	{
		_inCleanup = true;
		if (_curEventInstance.isValid())
		{
			_curEventInstance.stop(FMOD.Studio.STOP_MODE.IMMEDIATE);
			_curEventInstance.release();
		}

		FMOD.Studio.Bus selectedBus = FMODUnity.RuntimeManager.GetBus("bus:/");
		if (selectedBus.hasHandle())
		{
			FMOD.ChannelGroup channelGroup;
			if (selectedBus.getChannelGroup(out channelGroup) == FMOD.RESULT.OK)
			{
				if(_fft.hasHandle())
				{
					channelGroup.removeDSP(_fft);
				}
			}
		}

	}

	//===============
	// FMod callback handler
	//===============

	//Helper function for music callbacks - evets coming out of music
	[AOT.MonoPInvokeCallback(typeof(FMOD.Studio.EVENT_CALLBACK))]
	static FMOD.RESULT eventCallback(FMOD.Studio.EVENT_CALLBACK_TYPE type, IntPtr evInstancePtr, IntPtr parameterPtr)
	{
		FMOD.Studio.EventInstance instance = new FMOD.Studio.EventInstance(evInstancePtr);
		IntPtr evUserDataPtr;
		FmodMusicPlayer playerInstance = null;
		FMOD.RESULT result = instance.getUserData(out evUserDataPtr);
		if (result != FMOD.RESULT.OK)
		{
			Debug.LogError("fmp: Event callback user data error: " + result);
		}
		else if (evUserDataPtr != IntPtr.Zero)
		{
			// Get the object to store beat and marker details
			GCHandle userHandle = GCHandle.FromIntPtr(evUserDataPtr);
			playerInstance = (FmodMusicPlayer)userHandle.Target;
		}

		if (playerInstance._inCleanup)
		{
			return FMOD.RESULT.OK;
		}

		switch(type)
		{
			case FMOD.Studio.EVENT_CALLBACK_TYPE.TIMELINE_BEAT:
			{
				var beatParam = (FMOD.Studio.TIMELINE_BEAT_PROPERTIES)Marshal.PtrToStructure(parameterPtr, typeof(FMOD.Studio.TIMELINE_BEAT_PROPERTIES));
				playerInstance._lastBeat = beatParam.beat-1;
				playerInstance._lastBar = beatParam.bar -1;
				playerInstance._lastTempo = beatParam.tempo;
				playerInstance._timeSigBeatsPerBar = beatParam.timesignatureupper;
				if (playerInstance != null)
				{
					playerInstance.OnBeatEvent?.Invoke(playerInstance._lastBar,playerInstance._lastBeat);
				}
				break;
			}
			case FMOD.Studio.EVENT_CALLBACK_TYPE.TIMELINE_MARKER:
			{
				var timelineParam = (FMOD.Studio.TIMELINE_MARKER_PROPERTIES)Marshal.PtrToStructure(parameterPtr, typeof(FMOD.Studio.TIMELINE_MARKER_PROPERTIES));
				Debug.Log($"Event: {type.ToString()}");
				if (playerInstance != null)
				{
					string pName = timelineParam.name;
					Debug.Log($"---marker: {pName}");
					playerInstance.OnMarkerEvent?.Invoke(timelineParam.name);
				}
				break;
			}
			case FMOD.Studio.EVENT_CALLBACK_TYPE.START_EVENT_COMMAND:
			{
				Debug.Log("EventCommand:");
				EventDescription ed;
				FMOD.Studio.EventInstance inst = new FMOD.Studio.EventInstance(parameterPtr);
/*				Debug.Log($"instance:{inst.isValid()}");
				float vol;
				var r = inst.getVolume(out vol);
				Debug.Log($"vol: {FMOD.Error.String(r)} {vol}");
				r = inst.getDescription(out ed);
				Debug.Log($"desc: {FMOD.Error.String(r)}");
				string path = "";
				r = ed.getPath(out path);
				Debug.Log($"path: {FMOD.Error.String(r)}");
				Debug.Log("instance:" + path);*/
				break;
			}
			case FMOD.Studio.EVENT_CALLBACK_TYPE.SOUND_PLAYED:
			{
				var sound = new FMOD.Sound(parameterPtr); 
				int nameLen = 1024; 
				string sName;
				sound.getName(out sName, nameLen);
				Debug.Log("SoundStart:" + sName);
				break;
			}

			case FMOD.Studio.EVENT_CALLBACK_TYPE.DESTROYED:
			{
				playerInstance.StopMusic();
			}
			break;
			default:
				Debug.Log($"Event: {type.ToString()}");
				break;
		}

		return FMOD.RESULT.OK;
	}


	//=================
	// Stopped State
	//=================
	protected void StoppedEnter() 
	{
		clearFFTVals();

		if (_curEventInstance.isValid())
		{
			OnStopMusicEvent?.Invoke("Stop"); // add the stopped event path?
			_curEventInstance.stop(FMOD.Studio.STOP_MODE.ALLOWFADEOUT);
			_curEventInstance.release();
			reset();
		}
	}
	protected void StoppedUpdate()
	{
		
	}
	protected void StoppedExit() { }
	protected void StoppedPlay(StateTableValue v)
	{
		EventReference ev = (EventReference)v.Value;
		startPlayingEvent(ev);
	}

	void startPlayingEvent(EventReference ev)
	{
		string path = "";
		var desc = RuntimeManager.GetEventDescription(ev.Guid).getPath(out path);
		Debug.Log($"fmp: Trying to play:{path}");

		if (_curEventInstance.hasHandle())
		{
			Debug.Log("fmp: Releasing prev music handle");
			_curEventInstance.setUserData(IntPtr.Zero);
			_curEventInstance.release();
		}

		_curEventInstance = createNewFmodEventInstance(ev);
		if (_curEventInstance.hasHandle())
		{
			Debug.Log("fmp: have handle");

			_musicCallbackUserDataHandle = GCHandle.Alloc(this);
			_musicCallback = new FMOD.Studio.EVENT_CALLBACK(eventCallback);
			_curEventInstance.setUserData(GCHandle.ToIntPtr(_musicCallbackUserDataHandle));
			_curEventInstance.setCallback(_musicCallback,EVENT_CALLBACK_TYPE.ALL);
			
			// FMODUnity.RuntimeManager.CoreSystem.createDSPByType(FMOD.DSP_TYPE.FFT, out _fft);
			// _fft.setParameterInt((int)FMOD.DSP_FFT.WINDOWTYPE, (int)FMOD.DSP_FFT_WINDOW.HANNING);
			// _fft.setParameterInt((int)FMOD.DSP_FFT.WINDOWSIZE, _fftWindowSize * 2);
			//  FMODUnity.RuntimeManager.StudioSystem.flushCommands();

			// FMOD.ChannelGroup channelGroup;
			// FMODUnity.RuntimeManager.CoreSystem.getMasterChannelGroup(out channelGroup);
			// channelGroup.addDSP(FMOD.CHANNELCONTROL_DSP_INDEX.HEAD, _fft);

			OnStartMusicEvent?.Invoke(ev.ToString());
			_stateMachine.GotoState(EFmodMusicPlayerState.Playing);
		}
		else
		{
			Debug.LogError("Something went wrong - no instance handle for music event");
		}
	}

	//=================
	// Paused State
	//=================
	protected void PausedEnter() 
	{ 
		if (!_curEventInstance.isValid())
		{
			Debug.Log($"fmp: bad curEventInstance - ABORT");
			reset();
			_stateMachine.GotoState(EFmodMusicPlayerState.Stopped);
			return;
		}
		_curEventInstance.setPaused(true);
		_curEventInstance.getTimelinePosition(out _lastTimelinePosSec);
		// _curEventInstance.stop(FMOD.Studio.STOP_MODE.IMMEDIATE);
	}
	protected void PausedUpdate()
	{
	
	}
	protected void PausedExit() { }
	protected void PausedPlay(StateTableValue v)
	{
		Debug.Log("fmp: Paused Play");
		EventReference ev = (EventReference)v.Value;
		if (ev.IsNull && _curEventInstance.isValid())
		{
			Debug.Log("fmp: Paused resume with NULL handle");
			_stateMachine.GotoState(EFmodMusicPlayerState.Playing);
			return;
		}
		
		if (!_curEventRef.IsNull && (ev.Guid == _curEventRef.Guid))
		{
			if (_curEventInstance.isValid())
			{
				Debug.Log("fmp: Paused resume with same handle");
				_stateMachine.GotoState(EFmodMusicPlayerState.Playing);
				return;
			}
		}

		Debug.Log("fmp: Paused different handle - start from scratch");
		startPlayingEvent(ev);		
	}

	protected void PausedStop()
	{
		_stateMachine.GotoState(EFmodMusicPlayerState.Stopped);
	}

	//=================
	// Playing State
	//=================
	protected void PlayingEnter() 
	{
		Debug.Log("fmp: playingEnter");
		if (!_curEventInstance.isValid())
		{
			Debug.LogWarning("Attempt to play invalid instance. Stopping");
			reset();
			_stateMachine.GotoState(EFmodMusicPlayerState.Stopped);
		}

		Debug.Log("fmp: playingEnter::start");
		bool isPaused;
		_curEventInstance.getPaused(out isPaused);
		if (isPaused)
		{
			_curEventInstance.setPaused(false);
		}
		else
		{
			_curEventInstance.start();
		}
		_inCleanup = false;
	}
	protected void PlayingUpdate()
	{
		PLAYBACK_STATE pbs = PLAYBACK_STATE.STOPPED;
		_curEventInstance.getPlaybackState(out pbs);
		if (pbs != PLAYBACK_STATE.PLAYING && pbs != PLAYBACK_STATE.STARTING)
		{
			_stateMachine.GotoState(EFmodMusicPlayerState.Stopped);
			OnSongCompleteEvent?.Invoke();
			return;			
		}

		_curEventInstance.getTimelinePosition(out _lastTimelinePosSec);

		IntPtr unmanagedData;
		uint length;
		_fft.getParameterData((int)FMOD.DSP_FFT.SPECTRUMDATA, out unmanagedData, out length);
		FMOD.DSP_PARAMETER_FFT fftData = (FMOD.DSP_PARAMETER_FFT)Marshal.PtrToStructure(unmanagedData, typeof(FMOD.DSP_PARAMETER_FFT));
		var spectrum = fftData.spectrum;

		if (fftData.numchannels > 0)
		{
			for (int i = 0; i < _fftWindowSize; i++)
			{
				RawFFTValues[i] = (lin2db(spectrum[0][i]) + 80f)/80f;
			}

			if (FftBinCount > 0)
			{
				int BinSize = RawFFTValues.Length / FftBinCount;
				for (int i = 0; i < FftBinCount; i++)
				{
					int offset = i + BinSize;
					float sum = 0f;
					int count = 0;
					for (int j = 0; j < BinSize; j++)
					{
						int dex = offset + j;
						if (dex < _fftWindowSize)
						{
							sum += RawFFTValues[dex];
							count++;
						}
					}
					FftBins[i] = sum / (float)count;
				}
			}
		}
		else
		{
			clearFFTVals();
		}
	}

	float lin2db(float linear)
	{
		return Mathf.Clamp(Mathf.Log10(linear) * 20.0f, -80.0f, 0.0f);
	}

	protected void PlayingExit() { }
	protected void PlayingPause()
	{
		_stateMachine.GotoState(EFmodMusicPlayerState.Paused);
	}

	protected void PlayingStop()
	{
		_stateMachine.GotoState(EFmodMusicPlayerState.Stopped);
	}

	protected void PlayingPlay(StateTableValue v)
	{
		EventReference ev = (EventReference)v.Value;
		
		if (ev.IsNull)
		{
			_stateMachine.GotoState(EFmodMusicPlayerState.Stopped);
			return;
		}
		
		if (!_curEventRef.IsNull && (ev.Guid == _curEventRef.Guid))
		{
			// already playing
			return;
		}
		else if (!ev.IsNull)
		{
			startPlayingEvent(ev);
		}

	}
}
