using UnityEditor;
using UnityEngine;

namespace Nothke.Utils
{
    [CustomPropertyDrawer(typeof(Nothke.Utils.ADSREnvelope))]
    public class ADSREnvelopeDrawer : PropertyDrawer
    {
        const int propCount = 8;
        bool fold;

        public override float GetPropertyHeight(SerializedProperty property, GUIContent label)
        {
            float h = EditorGUIUtility.singleLineHeight;
            return !fold ? h : (propCount * (h+3));
        }

        public override void OnGUI(Rect position, SerializedProperty property, GUIContent label)
        {
            float h = EditorGUIUtility.singleLineHeight;
            float fullWidth = position.width;

            EditorGUI.BeginProperty(position, label, property);
            float startX = position.x;

            // Draw label foldout
            Rect foldRect = position;
            foldRect.height = h;
            fold = EditorGUI.Foldout(foldRect, fold, label, true);
            position = EditorGUI.PrefixLabel(position, GUIUtility.GetControlID(FocusType.Passive), new GUIContent(" "));

            var attackProp = property.FindPropertyRelative("attack");
            var decayProp = property.FindPropertyRelative("decay");
            var sustainProp = property.FindPropertyRelative("sustain");
            var releaseProp = property.FindPropertyRelative("release");

            var attackEaseProp = property.FindPropertyRelative("attackEase");
            var decayEaseProp = property.FindPropertyRelative("decayEase");
            var releaseEaseProp = property.FindPropertyRelative("releaseEase");
            var interruptProp = property.FindPropertyRelative("interrupt");
			var timeProp = property.FindPropertyRelative("time");
			var curSegTimeProp = property.FindPropertyRelative("curSegTime");
			var curSegProp = property.FindPropertyRelative("curSegment");
			var retriggerProp = property.FindPropertyRelative("retrigger");

			// Debug.Log($"aProp:{attackProp.floatValue}");

            ADSREnvelope adsr = 
				new ADSREnvelope(attackProp.floatValue,
								decayProp.floatValue,
								sustainProp.floatValue,
								releaseProp.floatValue,
								interruptProp.boolValue,
								attackEaseProp.floatValue,
								decayEaseProp.floatValue,
								releaseEaseProp.floatValue);

			// Debug.Log("copying adsr:" + adsr.ToString());

            Rect curveRect = position;

            if (!fold)
                curveRect.height = h;
            else
            {
                curveRect.x = startX;
                curveRect.y = position.y + h;

                curveRect.width = fullWidth;
                curveRect.height = (h + 3) * 4;
            }

            Vector2 curveStart = curveRect.position - new Vector2(0, -curveRect.height);
            Vector2 lastP = curveStart;
            int viewWidth = (int)curveRect.width;

            float os = 0.9f;
            float adrScale = (adsr.attack + adsr.decay + adsr.release) / (viewWidth * os);

            float attackWidth = adsr.attack / adrScale;
            float decayWidth = adsr.decay / adrScale;
            float releaseWidth = adsr.release / adrScale;

            float attackDecayPoint = (adsr.attack + adsr.decay) / (adrScale * os);
            float releaseScale = adsr.release / (adrScale * os);

            const float colorAlpha = 0.4f;


            Rect miniRect = curveRect;
            miniRect.x = (int)miniRect.x;
            miniRect.width = Mathf.CeilToInt(attackWidth);
            EditorGUI.DrawRect(miniRect, new Color(0, 1, 0) * colorAlpha);

            miniRect.x += miniRect.width;
            miniRect.width = Mathf.CeilToInt(decayWidth);
            EditorGUI.DrawRect(miniRect, new Color(1, 1, 0) * colorAlpha);

            miniRect.x += miniRect.width;
			float sustainWidth = (curveRect.width - (attackWidth + decayWidth + releaseWidth));
            miniRect.width = Mathf.CeilToInt(sustainWidth);
            EditorGUI.DrawRect(miniRect, new Color(0, 1, 1) * colorAlpha);

            miniRect.x = Mathf.CeilToInt(curveRect.x + viewWidth - releaseWidth);
            miniRect.width = (int)releaseWidth;
            EditorGUI.DrawRect(miniRect, new Color(1.0f, 0.0f, 1.0f) * colorAlpha);

            float graphScale = adrScale;
            Handles.color = Color.white;
            for (int i = 0; i < viewWidth; i++)
            {
                float v = i < viewWidth - releaseWidth ?
                    adsr.EvaluateIn(i * graphScale) :
                    adsr.EvaluateOut((i - (viewWidth - releaseWidth)) * graphScale, adsr.sustain);

                Vector2 p = curveStart + new Vector2(i, -v * curveRect.height);
                Handles.DrawLine(lastP, p);
                lastP = p;
            }

            // Doesn't work nicely, not worth it:
			if (Application.isPlaying)
			{
				float t = timeProp.floatValue / adsr.TotalTime;
				float tx = 0f;
				switch (curSegProp.enumValueIndex)
				{
					case 0: // idle
						tx = 0;
						break;
					case 1: // attack
						tx = attackWidth * curSegTimeProp.floatValue;
						break;
					case 2: // decay
						tx = attackWidth + decayWidth * curSegTimeProp.floatValue;
						break;
					case 3: // sustain
						tx = attackWidth + decayWidth;
						break;
					case 4: // release
						tx = attackWidth + decayWidth + sustainWidth + releaseWidth * curSegTimeProp.floatValue;
						break;
				}
				Vector2 cp = curveRect.position;
				cp.x += tx;
				Handles.DrawLine(cp, cp + new Vector2(0, curveRect.height));
			}

            if (fold)
            {
                var indent = EditorGUI.indentLevel;
                EditorGUI.indentLevel = 0;

                position.x = startX;
                position.y += curveRect.height + h + 5;
                position.width = fullWidth;

                EditorGUIUtility.labelWidth = 52;

                float margin = 3;
                float propWidth = position.width / 4 - margin;
                var valueRect = new Rect(position.x, position.y, propWidth, h);

                EditorGUI.PropertyField(valueRect, attackProp); valueRect.x += propWidth + margin;
                EditorGUI.PropertyField(valueRect, decayProp); valueRect.x += propWidth + margin;
                EditorGUI.PropertyField(valueRect, sustainProp); valueRect.x += propWidth + margin;
                EditorGUI.PropertyField(valueRect, releaseProp); valueRect.x = startX; valueRect.y += h;

                EditorGUI.PropertyField(valueRect, attackEaseProp, new GUIContent("Ease")); valueRect.x += propWidth + margin;
                EditorGUI.PropertyField(valueRect, decayEaseProp, new GUIContent("Ease")); valueRect.x += propWidth + margin;
				valueRect.x += propWidth + margin;
                // EditorGUI.PropertyField(valueRect, interruptProp); 
                EditorGUI.PropertyField(valueRect, releaseEaseProp, new GUIContent("Ease")); valueRect.x += propWidth + margin;

				valueRect.y += h;
				valueRect.x = startX;
            	EditorGUI.PropertyField(valueRect, interruptProp);
				valueRect.x += propWidth + margin;
            	EditorGUI.PropertyField(valueRect, retriggerProp);
				valueRect.x += propWidth + margin;

                if (attackProp.floatValue < 0)
                    attackProp.floatValue = 0;

                if (decayProp.floatValue < 0)
                    decayProp.floatValue = 0;

                if (releaseProp.floatValue < 0)
                    releaseProp.floatValue = 0;

                sustainProp.floatValue = Mathf.Clamp01(sustainProp.floatValue);

                EditorGUI.indentLevel = indent;

                EditorGUIUtility.labelWidth = 0;
            }

            EditorGUI.EndProperty();
        }
    }
}