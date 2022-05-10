///
/// ADSREnvelope.cs by Nothke
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

        public float attack = kDefaultAttack;
		public float decay = kDefaultDecay;
		public float sustain = kDefaultSustain;
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
		protected bool _triggerSignalOn = false;
		protected float _releaseStart = 1f;

		protected float _lastSegStartTime = 0f;
		public float LastSegStartTime => _lastSegStartTime;

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
			_triggerSignalOn = false;
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

        public float EvaluateIn(float time)
        {
            if (time < attack)
                return 1 - Ease(1 - time / attack, attackEase);

            else if (time < attack + decay)
                return Mathf.Lerp(sustain, 1, Ease(1 - ((time - attack) / decay), decayEase));

            else
                return sustain;
        }

        public float EvaluateOut(float time, float from = 0)
        {
            // float _from = from == 0 ? sustain : from;
			float _from = from;
			
            if (time < 0)
                return _from;

            else if (time < release)
                return Ease(1 - time / release, releaseEase) * _from;

            else
                return 0;
        }


        public float Update(bool gateValue, float deltaTime)
        {
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
			time += deltaTime;
			if (time >= attack)
			{
				time = attack;
				curSegment = ESegment.Decay; // assume we'll be moving on to decay, but might not if we released this frame
			}

			_lastSegStartTime = time; // if we change state, keep track of when we did it.

			curSegTime = (attack<=0)?0f:time/attack;
			float val = (attack<=0)?0f:Mathf.Lerp(0,1,curSegTime);

			if (!gateValue)
			{
				if (interrupt)
				{
					curSegment = ESegment.Release;
					_releaseStart = val;
				}
				// if we don't have interrupt set, we just keep trucking through decay as if we did.
			}

			// Debug.Log($"Attack:v:{val} {this.ToString()} next:{_curSegment.ToString()}");
			return val;
		}

		float updateDecay(bool gateValue, float deltaTime)
		{
			time += deltaTime;

			if (time >= attack + decay)
			{
				time = attack + decay;
				curSegment = gateValue?ESegment.Sustain:ESegment.Release; // assume we're moving on to sustain
			}

			curSegTime = (decay<=0)?1:(time-_lastSegStartTime)/decay;
			float val = (decay<=0)?sustain:Mathf.Lerp(1,sustain,curSegTime);

			if (!gateValue && interrupt)
			{
				_lastSegStartTime = time;
				_releaseStart = val;
				curSegment = ESegment.Release;
			}

			// Debug.Log($"Decay:v:{val} {this.ToString()} next:{_curSegment.ToString()}");
			return val;
		}

		float updateSustain(bool gateValue, float deltaTime)
		{
			curSegTime = 1.0f;
			if (!gateValue)
			{
				curSegment = ESegment.Release;
				_lastSegStartTime = time;
				_releaseStart = sustain;
			}

			// Debug.Log($"Systain:v:{sustain} {this.ToString()} next:{_curSegment.ToString()}");
			return sustain;
		}

		float updateRelease(bool gateValue, float deltaTime)
		{
			time += deltaTime;
			if (time >= _lastSegStartTime + release)
			{
				time = _lastSegStartTime + release;
				curSegment = ESegment.Idle;
			}

			curSegTime = (release<=0)?1:(time-_lastSegStartTime)/release;
			float val = (release<=0)?0f:Mathf.Lerp(_releaseStart,0,curSegTime);

			// Debug.Log($"Release:v:{val} {this.ToString()} next:{_curSegment.ToString()}");
			// finish out our release, even if we have a gate signal at this point.
			// todo: handle retrigger
			return val;
		}

        static float Ease(float p_x, float p_c)
        {
            if (p_c == 0)
            {
                return p_x;
            }
            else if (p_c < 0)
            {
                return 1.0f - Mathf.Pow(1.0f - p_x, -p_c + 1);
            }
            else
            {
                return Mathf.Pow(p_x, p_c + 1);
            }
        }
    }
}
