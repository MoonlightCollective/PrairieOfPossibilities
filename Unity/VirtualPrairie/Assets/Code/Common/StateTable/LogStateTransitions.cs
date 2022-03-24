using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace Assets.Code.StateTable
{
	public class LogStateTransitions : MonoBehaviour
	{
		public bool LogTransitions;

		public Action<bool> OnValueChanged;

		private bool _prev;

		private void Update()
		{
			if (_prev != LogTransitions)
			{
				_prev = LogTransitions;
				OnValueChanged?.Invoke(LogTransitions);
			}
		}
	}
}
