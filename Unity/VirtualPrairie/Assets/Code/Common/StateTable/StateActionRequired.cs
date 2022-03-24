using System;
using System.Reflection;

/*
	Use this attribute to specify that an action for a state is required (or isn't).
	For example, let's say you have an action enum set up like this:

	enum Actions
	{
		OnEnter,
		OnExit,
		OnTakeDamage,
		Update
	}

	If you don't specify anything, the state machine will require that you have 
	those actions defined for every state. If you want to flag an action as being optional, you can do:

	enum Actions
	{
		OnEnter,
		
		[StateActionRequired(false)]
		OnExit,
		
		OnTakeDamage,

		[StateActionRequired]
		Update
	}

	In the first case, OnExit is now flagged as being optional, so you don't have to have an OnExit
	method for every state. The second case flags Update as being a required action for every state.
	Note that you don't have to do this: by default actions are flagged as required. I'm just showing
	the example for completeness.

	You can also specify if we should use a default method if an action isn't found. For example, you may have a case where you need
	do something specific for one particular state action, but for all the other states they just do the same thing. It would be tedious
	to write the same function multiple times for those states. Here's an example without using the default state option:

	enum Actions
	{
		OnEnter,
		OnExit,
		ApplyVelocity
	}

	enum States
	{
		Init,
		Grounded,
		Floating,
		Attached,
		PreSpinshot,
		Spinshot,
		Dying,
	}

	Let's say that for every state, EXCEPT "Spinshot", you want the "ApplyVelocity" action to do the same thing: _velocity += new Vector2(1,1);
	You'd have to write 6 *ApplyVelocity functions that all do that same thing, and one unique one for Spinshot that does something different:
	void InitApplyVelocity()
	{
		_velocity += new Vector2(1,1);
	}
	
	void GroundedApplyVelocity()
	{
		_velocity += new Vector2(1,1);
	}

	void FloatingApplyVelocity()
	{
		_velocity += new Vector2(1,1);
	}
	..... (omitting others)
	
	void SpinshotApplyVelocity()
	{
		// do something different here
	}
	
	Instead you could define your Actions enum like so:

	enum Actions
	{
		OnEnter,
		OnExit,

		[StateActionRequired(false, true)]
		ApplyVelocity
	}

	What happens now is that when you DoStateAction for ApplyVelocity for a state that DOES NOT have that function defined, the state machine will automatically
	look for a function named: "DefaultApplyVelocity" and call that. Otherwise it would, in this case, call "SpinshotApplyVelocity". This means you just 
	simply have to define one function: DefaultWhateverMyActionIs. Note that the prefix "Default" is fixed. You have to name your method starting with Default and
	ending with the action name. The above example now looks like this with just 2 function definitions instead of 7:

	void DefaultApplyVelocity()
	{
		_velocity += new Vector2(1,1);
	}

	void SpinshotApplyVelocity()
	{
		// do something different here
	}

	And note that you can use any of the 4 forms for a state action as defined in StateTableAction.cs. Doesn't have to be void/void.

	In the above example we set "required" to false and "useDefaultIfNotDefined" to true. What's the difference between this and setting "required" to true?
	If "required" is false and default is true, then if you don't have a default function the state machine won't care, it'll ignore it.
	If "required" is true and default is true, however, the state machine will throw an exception if you didn't define your default action.
*/
namespace Assets.Code.StateTable
{
	[AttributeUsage(AttributeTargets.Field)]
	public sealed class StateActionRequired : Attribute
	{
		private readonly bool _required;
		private readonly bool _useDefaultMethodIfNotDefined;

		public StateActionRequired(bool required, bool useDefaultIfNotDefined = false)
		{
			_required = required;
			_useDefaultMethodIfNotDefined = useDefaultIfNotDefined;
		}

		public StateActionRequired()
		{
			_required = true;
		}

	
		public static bool IsRequired(object enm)
		{
			if (enm != null)
			{
				MemberInfo[] mi = enm.GetType().GetMember(enm.ToString());
				if (mi.Length > 0)
				{
					var attr = GetCustomAttribute(mi[0], typeof(StateActionRequired)) as StateActionRequired;

					// Default to required == true if not specified aka not found
					return (attr != null) && (attr._required);
				}
			}

			return false;
		}

		public static bool UseDefault(object enm)
		{
			if (enm != null)
			{
				MemberInfo[] mi = enm.GetType().GetMember(enm.ToString());
				if (mi.Length > 0)
				{
					var attr = GetCustomAttribute(mi[0], typeof(StateActionRequired)) as StateActionRequired;

					// if not found, use false for default method
					if (attr != null)
						return attr._useDefaultMethodIfNotDefined;
					else
						return false;					
				}
			}

			return false;
		}
	}
}