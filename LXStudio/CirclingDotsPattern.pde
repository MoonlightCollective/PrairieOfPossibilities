import java.util.Stack;

public static class CirclingDotsPattern extends MultiPattern
{
	public final CompoundParameter dotCount = new CompoundParameter("DotCount",5,0,10);
	public final CompoundParameter dotSpeedMin = new CompoundParameter("DotSpeedMin",10.0f,1,360);
	public final CompoundParameter dotSpeedVariability = new CompoundParameter("DotSpeedVariability",0.0f,0,360);
	public final CompoundParameter brightness = new CompoundParameter("DotBrightness",100,0,100);
	public final CompoundParameter dotWidth = new CompoundParameter("DotWidth",1,1,10);
	public final CompoundParameter attackTime = new CompoundParameter("AtkTime",0.1,0,2.0);
	public final CompoundParameter sustainTime = new CompoundParameter("sustainTime",1,0.5,10.0);
	public final CompoundParameter decayTime = new CompoundParameter("DcyTime",0.1,0,2.0);
	public final CompoundParameter updateFreq = new CompoundParameter("UpdateFreq",10,.1,10);
	public final ColorParameter dotColor = new ColorParameter("DotColor",0xFFFFFFFF);

	private static int kPoolSize = 100;

	private float updateTimer = -1;

	private int[] countPerRing = new int[PrairieUtils.kNumRings];

	private static float speedDeltaPerRing = 0.25;// multiply speed by 1-(ringDex*speedDeltaPerRing)
	private static float countMultPerRing = 4.0/6.0;

	public CirclingDotsPattern(LX lx)
	{
		super(lx);
		addParameter("Brightness",brightness);
		addParameter("DotsCount",dotCount);
		addParameter("DotSpeedMin",dotSpeedMin);
		addParameter("SpeedVariability",dotSpeedVariability);
		addParameter("DotWidth",dotWidth);
		addParameter("AtkTime",attackTime);
		addParameter("SusTime",sustainTime);
		addParameter("DcyTime",decayTime);
		addParameter("UpdateFreq",updateFreq);
		addParameter("DotColor",dotColor);

		ModelUtils.Init(model);
		for (int i = 0; i < PrairieUtils.kNumRings; i++)
		{
			countPerRing[i] = 0;
		}
		updateTimer = 1.0f/(updateFreq.getValuef());
	}

	@Override
	public void buildPool()
	{
		particlePool = new Stack<ParticleInfo>();
		for (int i = 0; i < kPoolSize; i++)
		{
			particlePool.add(new DotInfo());
		}
		usePool = true;
	}

	public DotInfo getParticleFromPool()
	{
		if (particlePool == null || particlePool.size() < 1)
			return null;
		return (DotInfo)(particlePool.pop());
	}

	@Override
	public void triggerNewParticle()
	{
		super.triggerNewParticle();
		int ring = PrairieUtils.RandomInRange(0,PrairieUtils.kNumRings);
		spawnNewDot(ring);
	}

	private void spawnNewDot(int ringDex)
	{

		DotInfo dot = getParticleFromPool();
		if (dot == null)
		{
			return;
		}

		float life = sustainTime.getValuef() + PrairieUtils.RandomFloatInRange(0,sustainTime.getValuef()*.1);
		float speed = dotSpeedMin.getValuef() + PrairieUtils.RandomFloatInRange(0,dotSpeedVariability.getValuef());
		speed = speed * (1.0-(ringDex*speedDeltaPerRing));
		int dir = PrairieUtils.RandomInRange(0,11);
		if (dir%2 > 0)
			speed *= -1;
		dot.TriggerDot(ringDex,
						attackTime.getValuef(),life, decayTime.getValuef(),
						speed,
						brightness.getValuef()/100.0f,
						dotWidth.getValuef(),
						dotColor.getColor()
						);
		addNewDot(dot);
	}

	private void addNewDot(DotInfo dot)
	{
		countPerRing[dot.ringDex]++;
		addParticle(dot);
	}

	@Override
	protected void notifyRemovedParticle(ParticleInfo pi)
	{
		int ring = ((DotInfo)pi).ringDex;
		countPerRing[ring] = max(0,countPerRing[ring]-1);
	}
	

	@Override
	public void run(double deltaMs)
	{
		super.run(deltaMs);
		updateTimer -= deltaMs / 1000.0f;
		if (updateTimer < 0)
		{
			updateTimer = 1.0f/updateFreq.getValuef();
			checkForNewParticleSpawns();
		}
	}

	public void checkForNewParticleSpawns()
	{
		for (int i = 0; i < PrairieUtils.kNumRings; i++)
		{
			int countTarget = (int)(dotCount.getValuef() + (countMultPerRing * i));
			if (countPerRing[i] < countTarget)
			{
				spawnNewDot(i);
				return;
			}
		}
	}

	//
	// DotInfo - particle class for each dot.
	//
	public static class DotInfo implements ParticleInfo
	{
		public float curSpeed; // degrees per sec
		public float maxSpeed; // degrees per sec
		public float maxBright; // 0-100
		public PrairieEnvASR lifetimeEnv = new PrairieEnvASR(.1,1,.1);
		public float curAngle;
		public int ringDex;
		public float widthPlantCount;
		public float widthDegrees;
		public float fullBrightWidthDegrees;
		public int dotColor;

		public void TriggerDot(int ring,float atk, float sus, float dec, float speed, float brightness,float width,int dColor)
		{
			ringDex = ring;
			lifetimeEnv.AttackTimeMs = atk*1000.0f;
			lifetimeEnv.SustainTimeMs = sus*1000.0f;
			lifetimeEnv.ReleaseTimeMs = dec*1000.0f;
			curAngle = PrairieUtils.RandomFloatInRange(0.0,360.0);
			maxSpeed = speed;
			curSpeed = maxSpeed;
			maxBright = brightness;
			widthPlantCount = width;
			fullBrightWidthDegrees = widthPlantCount * (360.0/(float)ModelUtils.NumPlantsInRing(ringDex)); // how many degress is in a single plant?
			widthDegrees = fullBrightWidthDegrees+(fullBrightWidthDegrees * .2); // add 20% for falloff.
			
			dotColor = dColor;
			lifetimeEnv.Trigger(true);
		}

		public void UpdateParticle(float deltaSec)
		{
			// update my envelope
			lifetimeEnv.Update(deltaSec * 1000);
			
			// rotate based on speed.
			curAngle += curSpeed * deltaSec;
			
			// wrap
			while(curAngle > 360)
				curAngle -= 360;
			while(curAngle < 0)
				curAngle += 360;
		}


		public int getColorValue(LXPoint pt)
		{
			if (!ModelUtils.IsLightInRing(pt.index,ringDex))
				return 0;
			
			// println("pt in range: ", pt.index + " for ring:" + ringDex);
			float pAngleDeg = pt.azimuth * 180/PI;
			float angleDelta = abs((float)LXUtils.wrapdist(curAngle,pAngleDeg,360));
			
			if (angleDelta > widthDegrees)
			{
				return 0;
			}

			float bNorm = max(0,min(1,1-(angleDelta/(.5*fullBrightWidthDegrees))));
			float brightMult = bNorm * maxBright * lifetimeEnv.CurVal;
			int r = (int)(min(255.0,brightMult * LXColor.red(dotColor)));
			int g = (int)(min(255.0,brightMult * LXColor.green(dotColor)));
			int b = (int)(min(255.0,brightMult * LXColor.blue(dotColor)));
			int a = (int)(min(255.0,brightMult * 255));
			return LXColor.rgba(r,g,b,a);
		}

		public boolean isDead()
		{
			return !lifetimeEnv.IsActive;
		}
	} // end DotInfo



		
}