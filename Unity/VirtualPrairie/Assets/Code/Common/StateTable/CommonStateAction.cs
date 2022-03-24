using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Assets.Code.StateTable
{
	[AttributeUsage(AttributeTargets.Field, AllowMultiple = true)]
	public sealed class CommonStateAction : Attribute
	{
		private readonly string _commonMethodName;
		private readonly Enum[] _stateEnums;

		public CommonStateAction(string commonMethodName, params object[] stateEnums)
		{
			if ((stateEnums == null) || (stateEnums.Length == 0))
				throw new ArgumentException("You need to specify 1 or more state enums");

			_commonMethodName = commonMethodName;
			_stateEnums = new Enum[stateEnums.Length];

			for (int i = 0; i < stateEnums.Length; i++)
				_stateEnums[i] = stateEnums[i] as Enum;
		}

		// returns null if this enum doesn't have a shared/common method name
		public static string CommonMethodName(Enum actionEnum, Enum stateEnum)
		{
			MemberInfo[] mi = actionEnum.GetType().GetMember(actionEnum.ToString());

			if (mi.Length > 0)
			{
				var attrs = GetCustomAttributes(mi[0], typeof(CommonStateAction));
				foreach (var attr in attrs)
				{
					var csa = (CommonStateAction)attr;
					foreach (var se in csa._stateEnums)
					{
						if (se.Equals(stateEnum))
							return csa._commonMethodName;
					}
				}
			}

			return null;
		}
	}
}
