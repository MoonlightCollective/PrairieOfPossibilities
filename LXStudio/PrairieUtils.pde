
import java.lang.Math;
import java.util.Random;

// class to capture a bunch of simple functions we use a lot.
public static class PrairieUtils {
	public static Random rand = new Random();
	public static boolean IsInner(int pointDex) { return(pointDex%7 < 2); }
	public static boolean IsOuter(int pointDex) { return(pointDex%7 > 1); }

	public static final int kNumLightsPerPlant = 7;

	public static int RandomPlantDex(int modelSize)
	{
	    return rand.nextInt(modelSize/kNumLightsPerPlant);
	}
	
}

public static class PrairieEnvAD
{
	public boolean IsActive = false;
	public double AttackTimeMs = 0.1f;
	public double DecayTimeMs = 0.3f;
	public float CurVal = 0;

	private double envTimer;
	private double totalTimeMs;
	private double attackTimeMs;
	private double decayTimeMs;

	public PrairieEnvAD(double attackTimeMs, double decayTimeMs)
	{
		AttackTimeMs = attackTimeMs;
		DecayTimeMs = decayTimeMs;
		totalTimeMs = AttackTimeMs + DecayTimeMs; // compute this each update since it might have changed.  Could be more efficient with dirty bits.
	}

	public void Update(double updateMs)
	{
		totalTimeMs = AttackTimeMs + DecayTimeMs; // compute this each update since it might have changed.  Could be more efficient with dirty bits.
		if (IsActive) {
			envTimer = Math.min(envTimer + updateMs,totalTimeMs);

			if (envTimer >= totalTimeMs) {
				IsActive = false;
				CurVal = 0;
			}
			else {
				if (envTimer <= AttackTimeMs) {
					CurVal = (float)(envTimer / AttackTimeMs);
				}
				else {
					CurVal = (float)(1 - (envTimer - AttackTimeMs) / DecayTimeMs);
				}
			}
		}
	}

	public void Trigger(boolean retrig)
	{
		if (retrig || !IsActive)
		{
			IsActive = true;
			
			if (IsActive) // if we are in the middle of an envelope, then we don't want to reset
				envTimer = CurVal * AttackTimeMs; // fast forward in the envelope to catch up to our current (normalized) value
			else
				CurVal = 0;
		}
	}


}