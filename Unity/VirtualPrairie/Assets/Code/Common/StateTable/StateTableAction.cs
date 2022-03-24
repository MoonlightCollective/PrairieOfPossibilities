using System;
using Assets.Code.StateTable;

namespace Assets.Code.StateTable
{
	/*
		Only set one of these methods as the state machine will check which one isn't
		null and call that one.
	*/
	public class StateTableAction
	{
		// Defines a state action of type: void MyAction(void)
		public delegate void StateActionDelegate();
		public StateActionDelegate StateAction { get; set; }

		// Defines a state action of type: void MyAction(StateTableValue myValue)
		public delegate void StateActionWithParamsDelegate(StateTableValue value);
		public StateActionWithParamsDelegate StateActionWithParams { get; set; }

		// Defines a state action with a return type and not parameters: StateTableValue MyAction()
		public delegate StateTableValue StateResultDelegate();
		public StateResultDelegate StateResult { get; set; }

		// Defines a state action of type: StateTableValue MyAction(StateTableValue myValue)
		public delegate StateTableValue StateResultWithParamsDelegate(StateTableValue value);
		public StateResultWithParamsDelegate StateResultWithParams { get; set; }		
	}
}