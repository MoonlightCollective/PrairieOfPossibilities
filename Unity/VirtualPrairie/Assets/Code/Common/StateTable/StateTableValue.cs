
namespace Assets.Code.StateTable
{
	/*
		Used as a generic return type or parameter to a state table action function. Defines
		conversion operators to automatic (implicitly) convert the value to a base type.
		Example:

		var myResult = new StateTableValue {Value = "Test Value"};
		string myString = myResult;

		var myParam = new StateTableValue {Value = 3}
		int myInt = myParam;

		You can also use this to return a basic type as an instance of this class. For example:
		
		public bool TestBoolReturn()
		{
			return (StateTableValue)true;
		}

		bool myBool = TestBoolReturn();


		Or a more complex type:

		public StateTableValue TestReturn()
		{
			var myResult = new StateTableValue {Value = new List<SomeClass>()}
			return myResult;
		}

		var myList = (List<SomeClass>)TestReturn().Value;	
	*/
	public class StateTableValue
	{
		public object Value { get; set; }

		public static implicit operator bool(StateTableValue rhs)
		{
			return (bool)rhs.Value;
		}

		public static implicit operator int(StateTableValue rhs)
		{
			return (int)rhs.Value;
		}

		public static implicit operator string(StateTableValue rhs)
		{
			return (string)rhs.Value;
		}

		public static implicit operator float(StateTableValue rhs)
		{
			return (float)rhs.Value;
		}

		public static implicit operator double(StateTableValue rhs)
		{
			return (double)rhs.Value;
		}

		public static explicit operator StateTableValue(bool rhs)
		{
			return new StateTableValue { Value = rhs };
		}

		public static explicit operator StateTableValue(int rhs)
		{
			return new StateTableValue { Value = rhs };
		}

		public static explicit operator StateTableValue(string rhs)
		{
			return new StateTableValue { Value = rhs };
		}

		public static explicit operator StateTableValue(float rhs)
		{
			return new StateTableValue { Value = rhs };
		}

		public static explicit operator StateTableValue(double rhs)
		{
			return new StateTableValue { Value = rhs };
		}
	}
}
