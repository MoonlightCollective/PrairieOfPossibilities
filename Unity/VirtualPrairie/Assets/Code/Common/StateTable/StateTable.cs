#define SAFESTATES

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Reflection;
using Assets.Code.StateTable;
using UnityEditor;
using UnityEngine;
using Debug = UnityEngine.Debug;

namespace Assets.Code.StateTable
{
	/*
		TStateEnum must be an enum. As C# doesn't let you enforce this by saying "where TState: Enum"
		the scary stuff after "where TState" basically accomplishes the same thing (it's all the stuff
		an enum implements).

		Same for TActionEnum.

		By default all actions are required for all states. Check out StateActionRequired.cs: you can use this
		attribute tag above a give action to flag it as not being required.
	*/
	public class StateTable<TStateEnum, TComponent, TActionEnum> 
											where TStateEnum : struct, IComparable, IConvertible, IFormattable
											where TActionEnum : struct, IComparable, IConvertible, IFormattable
	{
		protected Dictionary<TActionEnum, Dictionary<TStateEnum, StateTableAction>> _stateTable = new Dictionary<TActionEnum, Dictionary<TStateEnum, StateTableAction>>();

		protected TComponent _owner;
		protected TStateEnum _currentState;
		protected TStateEnum _prevState;
		protected bool _validCurrentState;
		protected Stopwatch _timer = new Stopwatch();
		protected TimeSpan _currentStateTime = TimeSpan.Zero;
		protected bool _disableStateTiming;

		private const string MISSING_METHOD_ERROR = "State action declared as required but it wasn't found.";

		public TStateEnum CurrentState => _currentState;
		public TStateEnum PrevState => _prevState;

		// Called whenever a state exits, and will pass in the time in ticks it spent in that state.
		public Action<TStateEnum, long> OnStateExited;

		// You can use this to perform an action any time a new state is entered
		public Action<TStateEnum> OnStateEntered;

		public bool PauseStateTimerWhenGameIsPaused { get; set; } = true;

		public TimeSpan CurrentStateTime => _currentStateTime.Add(TimeSpan.FromMilliseconds(_timer.Elapsed.TotalMilliseconds * Time.timeScale));

		// If true, will print to the debug console when state changes happen
		public bool LogStateTransitions { get; set; } = false;
		public string LogStatePrefix { get; set; }

		public StateTable(TComponent owner)
		{
			_owner = owner;
			Component ownerComp = _owner as Component;
			if (ownerComp == null)
				return;
			
			var lst = ownerComp.GetComponent<LogStateTransitions>();
			if (lst != null) 
			{
				LogStateTransitions = lst.LogTransitions;
				lst.OnValueChanged += LogValueChanged;
			}
		}

		private void LogValueChanged(bool val)
		{
			LogStateTransitions = val;
		}

		public void DisableStateTiming(bool disable) => _disableStateTiming = disable;

		// If you stop timing the current state and forget to resume, it'll automatically restart at the next state transition
		public void StopTimingCurrentState() => _timer.Stop();
		public void ResumeTimingCurrentState()
		{
			if (!_disableStateTiming)
				_timer.Start();
		}

		public void RestartCurrentStateTimer()
		{
			if (_disableStateTiming)
				_timer.Reset();
			else
				_timer.Restart();
		}

		private void GamePaused(bool paused)
		{
			if (PauseStateTimerWhenGameIsPaused)
			{
				if (paused)
					StopTimingCurrentState();
				else
					ResumeTimingCurrentState();
			}
		}

		private void TimeScaleChanged(float oldScale, float newScale)
		{
			_timer.Stop();
			var elapsed = _timer.Elapsed.TotalMilliseconds; // includes fractional milliseconds
			_currentStateTime = _currentStateTime.Add(TimeSpan.FromMilliseconds(elapsed * oldScale));

			if (_disableStateTiming)
			{
				// If we're off screen we don't want to resume timing yet. That will happen when we're notified that we're back on screen. 
				_timer.Reset();
			}
			else
				_timer.Restart();
		}
		
		public void InitActionTable()
		{
			const BindingFlags bindingFlags = BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance;
#if UNITY_EDITOR
			EditorApplication.pauseStateChanged += ps => GamePaused(ps == PauseState.Paused);
#endif

			foreach (TActionEnum action in Enum.GetValues(typeof(TActionEnum)))
			{
				var actionStr = action.ToString();
				bool actionRequired = StateActionRequired.IsRequired(action);
				bool useDefaultIfImplementationNotFound = StateActionRequired.UseDefault(action);				

				var actionDict = new Dictionary<TStateEnum, StateTableAction>();
				_stateTable[action] = actionDict;

				foreach (TStateEnum state in Enum.GetValues(typeof(TStateEnum)))
				{
					string commonActionMethodName = CommonStateAction.CommonMethodName(action as Enum, state as Enum);

					var methodName = commonActionMethodName ?? state + actionStr;
					MethodInfo mi = _owner.GetType().GetMethod(methodName, bindingFlags);

					if (mi != null)
						createDelegateForMethodInfo(mi, methodName, state, actionDict);
					else if (useDefaultIfImplementationNotFound)
					{
						// Check if there's a default implementation of this method
						var defaultName = "Default" + actionStr;
						mi = _owner.GetType().GetMethod(defaultName, bindingFlags);

						if (mi == null)
						{
							// We couldn't find a default implementation or a concrete one.
							throw new MissingMethodException($"State \"{state}\", action \"{actionStr}\" was set to use a default function if an implementation wasn't defined. We couldn't find a default function, nor could we find a concrete one. Expected to find a method named either {defaultName} or {state + actionStr}", defaultName);
						}
						else
							createDelegateForMethodInfo(mi, defaultName, state, actionDict);
					}
					else if (actionRequired)
					{
						// Action is required but we were told to NOT use a default method. That means you need to have defined a concrete implementation of this method.
						throw new MissingMethodException(MISSING_METHOD_ERROR, methodName);
					}
				}
			}
		}

		private void createDelegateForMethodInfo(MethodInfo mi, string methodName, TStateEnum state, Dictionary<TStateEnum, StateTableAction> actionDict)
		{
			const string errorStr = "Invalid action function definition. Functions must be one of 4 forms: " +
									"void MyFunction(void), " +
									"void MyFunction(StateTableValue myValue), " +
									"StateTableValue MyFunction(void)" +
									"StateTableValue MyFunction(StateTableValue myValue). Function name: ";

			var p = mi.GetParameters();

			if (mi.ReturnType == typeof(void))
			{
				if (p.Length == 0)
				{
					// method is an action: void MyFunction()
					var method = Delegate.CreateDelegate(typeof(StateTableAction.StateActionDelegate), _owner, mi);
					actionDict[state] = new StateTableAction { StateAction = (StateTableAction.StateActionDelegate)method };
				}
				else if (p[0].ParameterType == typeof(StateTableValue))
				{
					// method is of type: void MyFunction(StateTableValue myValue)
					var method = Delegate.CreateDelegate(typeof(StateTableAction.StateActionWithParamsDelegate), _owner, mi);
					actionDict[state] = new StateTableAction { StateActionWithParams = (StateTableAction.StateActionWithParamsDelegate)method };
				}
				else
					throw new ArgumentException(errorStr + methodName);
			}
			else if (mi.ReturnType == typeof(StateTableValue))
			{
				if ((p.Length > 0) && (p[0].ParameterType == typeof(StateTableValue)))
				{
					// method is of type: StateTableValue MyFunction(StateTableValue myValue)
					var method = Delegate.CreateDelegate(typeof(StateTableAction.StateResultWithParamsDelegate), _owner, mi);
					actionDict[state] = new StateTableAction { StateResultWithParams = (StateTableAction.StateResultWithParamsDelegate)method };
				}
				else if (p.Length == 0)
				{
					// method is of type: StateTableValue MyFunction()
					var method = Delegate.CreateDelegate(typeof(StateTableAction.StateResultDelegate), _owner, mi);
					actionDict[state] = new StateTableAction { StateResult = (StateTableAction.StateResultDelegate)method };
				}
			}
			else
				throw new ArgumentException(errorStr + methodName);
		}

		/*
			Transitions to the next state, regardless of how the state's action was defined. 
			
			Will call "Exit" on the current state if it's valid  and if that method has been defined. 
			
			You can optionally specify a value. This value will be passed to both the *current* state's exit method,
			and the *next* state's enter method.

			If the state action doesn't take a value, this will be ignored even if it's specified.

			If the state's Enter or Exit method was declared as having a return type, the return value
			will be ignored.

			If "force" is true, will go to the state without calling exit on the current state.
		*/
		public void GotoState(TStateEnum newState, StateTableValue stateValue = null, bool force = false)
		{			
			if (LogStateTransitions)
			{
				// Debug.Log($"{LogStatePrefix}: {_owner.gameObject.name}-{_owner.GetType().ToString()} Leaving state {_currentState}, entering state {newState}");
				global::System.Diagnostics.Debug.WriteLine($"{LogStatePrefix}: Leaving state {_currentState}, entering state {newState}");
			}

			if (_validCurrentState)
			{
				_timer.Stop();
				if (!force)
				{
					OnStateExited?.Invoke(_currentState, _timer.ElapsedTicks);
					callActionForStateTransition(_currentState, "Exit", stateValue);
				}
			}

			if (_disableStateTiming)
				_timer.Reset();
			else
				_timer.Restart();

			_currentStateTime = TimeSpan.Zero;

			_prevState = force ? default(TStateEnum) : _currentState;
			_currentState = newState;
			_validCurrentState = true;

			callActionForStateTransition(newState, "Enter", stateValue);
			OnStateEntered?.Invoke(_currentState);
		}

		public void GotoStateNoEnterExitOptimized(TStateEnum newState)
		{
			_currentStateTime = TimeSpan.Zero;
			_prevState = _currentState;
			_currentState = newState;
		}

		private void callActionForStateTransition(TStateEnum state, string actionStr, StateTableValue stateValue)
		{
			if (Enum.IsDefined(typeof(TActionEnum), actionStr))
			{
				var action = (TActionEnum)Enum.Parse(typeof(TActionEnum), actionStr, true);
			
				Dictionary<TStateEnum,StateTableAction> stateTableDict;
				if (!_stateTable.TryGetValue(action,out stateTableDict))
				{
					if (StateActionRequired.IsRequired(action))
						throw new MissingMethodException(MISSING_METHOD_ERROR, state + action.ToString());

					return;
				}

				StateTableAction stateTableAction = null;
				stateTableDict.TryGetValue(state,out stateTableAction);

				if (stateTableAction?.StateAction != null)
					stateTableAction.StateAction();
				else if (stateTableAction?.StateActionWithParams != null)
					stateTableAction.StateActionWithParams(stateValue);
				else if (stateTableAction?.StateResult != null)
					stateTableAction.StateResult();								// ignore return result
				else
					stateTableAction?.StateResultWithParams?.Invoke(stateValue);			// ignore return result
			}
		}

		private StateTableAction getStateTableAction(TActionEnum action)
		{
#if (SAFESTATES)
			if (!_validCurrentState)
			{
				Debug.Log("Attempt to invoke action before initializing state machine (" + _owner.ToString() + ")");
			}
#endif
			Dictionary<TStateEnum, StateTableAction> stateActionDict;
			if (_stateTable.TryGetValue(action, out stateActionDict))
			{
				StateTableAction stateAction;
				if (stateActionDict.TryGetValue(_currentState, out stateAction))
					return stateAction;
			}

			return null;
		}

		// Call this function when you've declared a state action that's of this form:
		// void MyAction()
		// Throws an exception if that wasn't the function type that was defined.
		public void DoStateAction(TActionEnum action)
		{
			var stateTableAction = getStateTableAction(action);

			if (stateTableAction == null)
				return;
			else if (stateTableAction.StateAction == null)
				throw new MissingMethodException(MISSING_METHOD_ERROR, _currentState + action.ToString());

			stateTableAction.StateAction();
		}

		// Call this function when you've declared a state action that's of this form:
		// void MyAction(StateTableValue myValue)
		// Throws an exception if that wasn't the function type that was defined.
		public void DoStateAction(TActionEnum action, StateTableValue stateValue)
		{
			var stateTableAction = getStateTableAction(action);

			if (stateTableAction == null)
				return;
			else if (stateTableAction.StateActionWithParams == null)
				throw new MissingMethodException($"State machine error. State named {CurrentState} had action named {action} called on it. We found the method {CurrentState}{action}() but we were expecting one that takes a paremeter instead.");

			stateTableAction.StateActionWithParams(stateValue);
		}

		// Call this function when you've declared a state action that's of this form:
		// StateTableValue MyAction()
		// Throws an exception if that wasn't the function type that was defined.
		// Returns null if the action wasn't found, otherwise the result of the action.
		public StateTableValue DoStateActionWithResult(TActionEnum action)
		{
			var stateTableAction = getStateTableAction(action);

			if (stateTableAction == null)
				return null;
			else if (stateTableAction.StateResult == null)
				throw new MissingMethodException(MISSING_METHOD_ERROR, _currentState + action.ToString());

			return stateTableAction.StateResult();
		}

		// Call this function when you've declared a state action that's of this form:
		// StateTableValue MyAction(StateTableValue myValue)
		// Throws an exception if that wasn't the function type that was defined.
		// Returns null if the action wasn't found, otherwise the result of the action.
		public StateTableValue DoStateActionWithResult(TActionEnum action, StateTableValue stateValue)
		{
			var stateTableAction = getStateTableAction(action);

			if (stateTableAction == null)
				return null;
			else if (stateTableAction.StateResultWithParams == null)
				throw new MissingMethodException(MISSING_METHOD_ERROR, _currentState + action.ToString());

			return stateTableAction.StateResultWithParams(stateValue);
		}		
	}
}
