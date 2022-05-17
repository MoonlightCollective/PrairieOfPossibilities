///
/// Inspired by: ADSREnvelope.cs by Nothke, but pretty much re-written.
///
/// Attack-Decay-Sustain-Release envelope helper struct. 
/// Also comes with an optional, but recommended, custom property drawer
/// (see Editor/ADSREnvelopeDrawer.cs)
///
/// Important notes:
/// * When using it as a field, initialize one with .Default(),
///   so that values are properly initialized, like this:
///   `public ADSREnvelope envelope = ADSREnvelope.Default();`
/// * To get a value, use envelope.Update(signalBool, deltaTime);
/// * Use interrupt if you want the value to be interrupted immediately 
///   when signal is cut (see tooltip)
///
///
/// ============================================================================
///
/// MIT License
///
/// Copyright(c) 2021 Ivan Notaroš
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in all
/// copies or substantial portions of the Software.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
/// SOFTWARE.
/// 
/// ============================================================================
///

using NaughtyAttributes;
using UnityEngine;

namespace Nothke.Utils
{
    [System.Serializable]
	[Snapshot]
    public class ADSREnvelope
    {
		const float kDefaultAttack = 1.0f;
		const float kDefaultDecay = 0.0f;
		const float kDefaultSustain = 1.0f;
		const float kDefaultRelease = 1.0f;
		const float kDefaultAttackEase = 0.0f;
		const float kDefaultDecayEase = 0.0f;
		const float kDefaultReleaseEase = 0.0f;
		const bool kDefaultInterrupt = false;
		const bool kDefaultLoop = false;

        [Snapshot]
		public float attack = kDefaultAttack;
        [Snapshot]
		public float decay = kDefaultDecay;
        [Snapshot]
		public float sustain = kDefaultSustain;
        [Snapshot]
		public float release = kDefaultRelease;

        public float attackEase = kDefaultAttackEase;
        public float decayEase = kDefaultDecayEase;
        public float releaseEase = kDefaultReleaseEase;

        [Tooltip("If disabled, no matter how short the signal is, it will be played until at least the end of decay time. " +
            "\n\nIf enabled, the end of signal will \"interrupt\" the attack or decay and immediatelly skip to release.")]
        public bool interrupt = kDefaultInterrupt;
		public bool retrigger = true;

		public float time = 0f;
		public float curSegTime = 0f;
		protected bool _lastGateVal = false;
		protected float _releaseStart = 1f;

		protected float _lastSegStartTime = 0f;
		public float LastSegStartTime => _lastSegStartTime;

		static bool s_debugEnv = false;

		public enum ESegment
		{
			Idle,
			Attack,
			Decay,
			Sustain,
			Release
		}
		
		public ESegment curSegment = ESegment.Idle;

		public float TotalTime => (attack + decay + release);

        public static ADSREnvelope Default()
        {
            return new ADSREnvelope(); // constructor takes care of defaults
        }

		public ADSREnvelope()
		{
			curSegment = ESegment.Idle;
			_lastGateVal = false;
			time = 0;
		}

		public ADSREnvelope(float a, float d, float s, float r, bool doInterrupt = false,float aEase = 0f, float dEase = 0f, float rEase = 0f) : base()
		{
			attack = a;
			decay = d;
			sustain = s;
			release = r;
			interrupt = doInterrupt;
			attackEase = aEase;
			decayEase = dEase;
			releaseEase = rEase;
		}

		public override string ToString()
		{
			return $"A:{attack.ToString("0.00")} D:{decay.ToString("0.00")} S:{sustain.ToString("0.00")} R:{release.ToString("0.00")} Time:{time} / Time:{TotalTime}";
		}

        public float Update(bool gateValue, float deltaTime)
        {
			if (retrigger && gateValue && !_lastGateVal)
			{
				time = -deltaTime;
				curSegment = ESegment.Attack;
			}
			
			_lastGateVal = gateValue;
			switch (curSegment)
			{
				case ESegment.Idle:
					return updateIdle(gateValue,deltaTime);
				case ESegment.Attack:
					return updateAttack(gateValue,deltaTime);
				case ESegment.Decay:
					return updateDecay(gateValue,deltaTime);
				case ESegment.Sustain:
					return updateSustain(gateValue,deltaTime);
				case ESegment.Release:
					return updateRelease(gateValue,deltaTime);
			}
			return 0f;
        }

		float updateIdle(bool value, float deltaTime)
		{
			if (value)
			{
				curSegment = ESegment.Attack;
				_lastSegStartTime = 0f;
				time = 0;
			}
			curSegTime = 0f;
			return 0;
		}

		float updateAttack(bool gateValue, float deltaTime)
		{
			time = Mathf.Min(deltaTime+time,attack);

			// figure out our value from the attack ramp
			curSegTime = (attack<=0)?0f:time/attack;

			float val = Ease(0,1,curSegTime,attackEase);
			
			if (!gateValue && interrupt)
			{
				// no gate - if I'm allowed to interrupt, move on to release
				startRelease(val);
			}
			else if (time >= attack)
			{
				// if I get here, regardless of gate state, I should continue on to 
				// the decay phase
				curSegTime = 0f;
				_lastSegStartTime = time;
				curSegment = ESegment.Decay; // assume we'll be moving on to decay, but might not if we released this frame
			}

			envDebug($"Attack:v:{val} {this.ToString()} next:{curSegment.ToString()}");
			return val;
		}

		float updateDecay(bool gateValue, float deltaTime)
		{
			float adTime = attack + decay;
			time = Mathf.Clamp(time+deltaTime,0,adTime);

			curSegTime = (decay <= 0)?1:((time - _lastSegStartTime)/decay);
			float val = Ease(1,sustain,curSegTime,decayEase);

			if (time >= adTime)
			{
				if (!gateValue)
				{
					startRelease(val);
				}
				else
				{
					_lastSegStartTime = time;
					curSegTime = 0f;
					curSegment = ESegment.Sustain;
				}
			}
			else if (!gateValue && interrupt)
			{
				// if I don't have a gate and I'm allowed to interrupt, then 
				// move on to release immediately.
				startRelease(val);
			}

			envDebug($"Decay:v:{val} {this.ToString()} next:{curSegment.ToString()}");
			return val;
		}

		float updateSustain(bool gateValue, float deltaTime)
		{
			curSegTime = 1.0f;
			if (!gateValue)
			{
				startRelease(sustain);
			}

			envDebug($"Sustain:v:{sustain} {this.ToString()} next:{curSegment.ToString()}");
			return sustain;
		}



		void startRelease(float releaseStart)
		{
			curSegment = ESegment.Release;
			curSegTime = 0f;
			_lastSegStartTime = time;
			_releaseStart = releaseStart;
		}

		float updateRelease(bool gateValue, float deltaTime)
		{
			time += deltaTime;
			if (time >= _lastSegStartTime + release)
			{
				time = _lastSegStartTime + release;
				curSegment = ESegment.Idle;
			}

			if (release <= 0)
			{
				curSegTime = 1f;
				return 0;
			}

			curSegTime = (time-_lastSegStartTime)/release;
			float val = Ease(_releaseStart,0,curSegTime,releaseEase);

			envDebug($"Release:v:{val} {this.ToString()} next:{curSegment.ToString()}");

			// Debug.Log($"Release:v:{val} {this.ToString()} next:{_curSegment.ToString()}");
			// finish out our release, even if we have a gate signal at this point.
			// todo: handle retrigger
			return val;
		}


		static public float Ease(float from, float to, float t, float power)
		{
			float easePct = Ease(t,power);			
			return (from + easePct * (to-from));
		}

		static float Ease(float t, float power)
		{
			if (power<0)
			{
				return Mathf.Pow(t,-1/(power-1));
			}
			else
			{
				return Mathf.Pow(t,1+power);
			}
		}

		void envDebug(string dString)
		{
			if (s_debugEnv)
			{
				Debug.Log($"Env: {dString}");
			}
		}
    }
}
