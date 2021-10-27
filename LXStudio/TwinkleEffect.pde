import java.util.ArrayList;
import java.util.Iterator;
import java.util.Stack;

@LXCategory("PrairieEffects")
public static class TwinkleEffect extends LXEffect {
	public final CompoundParameter blinkTimeMin = new CompoundParameter("MinTime",1,0.01,2).setDescription("Min time between twinkles");
	public final CompoundParameter blinkTimeMax = new CompoundParameter("MaxTime",1,0.01,2).setDescription("Max time between twinkles");
	public final CompoundParameter intensity = new CompoundParameter("Intensity",80,0,100).setDescription("Max brightness of a twinkle");
	public final CompoundParameter decayTimeS = new CompoundParameter("DecayTime",.5,0,2);
	public final CompoundParameter elementStartOffsetMs = new CompoundParameter("AttackTimeMs",40,0,600);
	
	private final static int kPoolSize = 100;
	private float twinkleTimer = 0;

	private Stack<SingleTwinkle> twinklePool;
	private ArrayList<SingleTwinkle> activeTwinkles;

	public static class SingleTwinkleElement {
		public float startOffset;
		public PrairieEnvAD envelope;
		public boolean didFire;
	}

	public static class SingleTwinkle {
		public int plantDex;
		private SingleTwinkleElement[] elements;
		public float timer;
		private boolean active;

		public SingleTwinkle() {
			elements = new SingleTwinkleElement[PrairieUtils.kNumLightsPerPlant];

			for (int i = 0; i < PrairieUtils.kNumLightsPerPlant;i++){
				elements[i] = new SingleTwinkleElement();
				elements[i].envelope = new PrairieEnvAD(1,300);
				elements[i].didFire = false;
				elements[i].startOffset = 0;
			}

			plantDex = -1;
			active = false;
			timer = -1;
		}

		public float ValForEnv(int envDex) {
			if (envDex >= PrairieUtils.kNumLightsPerPlant)
				return 0;
			else
				return elements[envDex].envelope.CurVal;
		}

		public void StartTwinkle(int inPlantDex,float decayTimeMs,float attackTimeMs)
		{
			plantDex = inPlantDex;
			for (int i = 0; i < PrairieUtils.kNumLightsPerPlant; i++) {
				elements[i].envelope.IsActive = false;
				elements[i].envelope.DecayTimeMs = decayTimeMs;
				elements[i].didFire = false;
				if (i < 2)
					elements[i].startOffset = 0;
				else
					elements[i].startOffset = PrairieUtils.rand.nextFloat() * attackTimeMs;
			}
			timer = 0;
			active = true;
		}

		public void UpdateTwinkle(double deltaMs)
		{
			timer += deltaMs;
			int activeCount = 0;
			for (int i = 0; i < PrairieUtils.kNumLightsPerPlant; i++) {
				if (elements[i].envelope.IsActive && elements[i].didFire ) {
					elements[i].envelope.Update((float)deltaMs);
				}
				else if (!(elements[i].didFire) && (timer > elements[i].startOffset) ) {
					elements[i].envelope.Trigger(true);
					elements[i].didFire = true;
				}

				if (elements[i].envelope.IsActive) {
					activeCount++;
				}
			}

			active = (activeCount > 0);
		}

		public boolean IsActive()
		{
			return active;
		}
	}

	public TwinkleEffect(LX lx)
	{
		super(lx);
		addParameter("MinTime",blinkTimeMin);
		addParameter("MaxTime",blinkTimeMax);
		addParameter("Intensity",intensity);
		addParameter("DecayTime",decayTimeS);
		addParameter("AttackTimeMs",elementStartOffsetMs);
		buildPool();
		twinkleTimer = -1;
	}

	private void buildPool()
	{
		twinklePool = new Stack<SingleTwinkle>();
		for (int i = 0; i < kPoolSize; i++) {
			twinklePool.push(new SingleTwinkle());
		}

		activeTwinkles = new ArrayList<SingleTwinkle>();
	}

	public void triggerNewTwinkle()
	{
		// println("Trigger new");
		if (twinklePool.size() > 0) {
			SingleTwinkle twink = twinklePool.pop();
			twink.StartTwinkle(PrairieUtils.RandomPlantDex(model.size),decayTimeS.getValuef() * 1000,elementStartOffsetMs.getValuef());
			activeTwinkles.add(twink);
		}
		// println("Triggered new");
	}

	public void run(double deltaMs,double enabledAmount) {
		twinkleTimer -= (float)deltaMs;
		if (twinkleTimer < 0) {
			float blinkMinMsF = blinkTimeMin.getValuef() * 1000;
			float blinkMaxMsF = blinkTimeMax.getValuef() * 1000;
			triggerNewTwinkle();
			twinkleTimer =  blinkMinMsF + (PrairieUtils.rand.nextFloat() * (blinkMaxMsF - blinkMinMsF));
			// println("new Timer:" + twinkleTimer);
		}

		Iterator<SingleTwinkle> iter = activeTwinkles.iterator();
		while (iter.hasNext()) {
			SingleTwinkle twink = iter.next();
			twink.UpdateTwinkle(deltaMs);
			// println("updateTwinkle:" + twink.timer);
			
			if (!twink.IsActive()) {
				// println("remove Twinkle");
				iter.remove();
				twinklePool.push(twink);
			}
			else {
				int baseDex = twink.plantDex * PrairieUtils.kNumLightsPerPlant;
				for (int i = 0; i < PrairieUtils.kNumLightsPerPlant; i++) {
					float brightAdd = twink.ValForEnv(i) * intensity.getValuef();
					// println("updateLight("+i+")" + twink.ValForEnv(i));
					float bright = min(brightAdd + LXColor.b(colors[baseDex+i]),100);
					int c = colors[baseDex + i];
					colors[baseDex + i] = LXColor.hsba(LXColor.h(c),LXColor.s(c),(int)bright,bright/100);
				}
			}
		}
	}
}

