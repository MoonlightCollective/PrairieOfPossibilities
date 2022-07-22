using System.Collections;
using System.Collections.Generic;
using Assets.Code.StateTable;
using TMPro;
using UnityEngine;

public class UITyperTextCycler : MonoBehaviour
{
	public TextAsset FullText;
	public int SectionLengthMin;
	public int SectionLengthMax;
	public string CursorStr = "|";

	public float PerCharTimeSec;
	public float PerSectionSec;

	string _fullTextStr;
	string _sectionStr;
	TextMeshProUGUI _text;

	protected enum EUITyperTextCyclerState
	{
		Init,
		Typing,
		Waiting
	}
	
	protected enum EUITyperTextCyclerAction
	{
		Enter,
		Update,
		Exit,
	}
	
	protected StateTable<EUITyperTextCyclerState,UITyperTextCycler,EUITyperTextCyclerAction> _stateMachine;
	
	protected void createStateMachine()
	{
		_stateMachine = new StateTable<EUITyperTextCyclerState,UITyperTextCycler,EUITyperTextCyclerAction>(this);
		_stateMachine.InitActionTable();
	}


	//===============
	// Unity Events
	//===============
	public void Awake()
	{
		findRequiredObjects();
		createStateMachine();
		_stateMachine.GotoState(EUITyperTextCyclerState.Init);
	}
	
	public void Update()
	{
		_stateMachine.DoStateAction(EUITyperTextCyclerAction.Update);
	}
	private void findRequiredObjects()
	{
		_text = GetComponentInChildren<TextMeshProUGUI>();
	}

	//=================
	// Init State
	//=================
	protected virtual void InitEnter()
	{
		_fullTextStr = FullText.ToString();
		Debug.Log("fullText:" + _fullTextStr);
	}
	protected virtual void InitUpdate()
	{
		_stateMachine.GotoState(EUITyperTextCyclerState.Typing);
	}


	//=================
	// Typing State
	//=================
	int _curSecLen;
	int _curSecStartDex;
	int _curSecEndDex;
	int _curSecTypeDex;
	float _typerTimer;
	string _curSecStr;

	protected virtual void TypingEnter()
	{
		_curSecLen = Random.Range(SectionLengthMin, SectionLengthMax);
		_curSecStartDex = Random.Range(0,_fullTextStr.Length-_curSecLen);
		_curSecEndDex = Mathf.Min(_curSecStartDex + _curSecLen, _curSecLen-1);
		_typerTimer = -1f;
		_curSecStr = "";
		_curSecTypeDex = 0;
	}
	protected virtual void TypingUpdate()
	{
		_typerTimer -= Time.deltaTime;
		if (_typerTimer < 0)
		{
			_typerTimer = PerCharTimeSec;
			_curSecTypeDex++;
			_curSecStr = _fullTextStr.Substring(_curSecStartDex,_curSecTypeDex);
			_text.text = _curSecStr + CursorStr;

			if (_curSecTypeDex >= _curSecLen)
			{
				_stateMachine.GotoState(EUITyperTextCyclerState.Waiting);
			}
		}
	}

	//=================
	// Waiting State
	//=================
	protected virtual void WaitingEnter()
	{
		_typerTimer = PerSectionSec;
	}

	protected virtual void WaitingUpdate()
	{
		_typerTimer -= Time.deltaTime;
		if (_typerTimer < 0)
		{
			_stateMachine.GotoState(EUITyperTextCyclerState.Typing);
		}
	}
}
