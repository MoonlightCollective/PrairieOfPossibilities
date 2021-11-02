

@LXCategory("Triggered")
public static class SnakeCAVPattern extends MultiPattern
{
	private static int kMaxLength = 50;
	private static int kPoolSize = 30;

	public final CompoundParameter length = new CompoundParameter("Length",8.0f,1.0f,(float)kMaxLength)
		.setDescription("Length (plant count)");
	
	public final CompoundParameter duration = new CompoundParameter("Duration",1.0f,0.5f,20.0f)
		.setDescription("Duration (sec) for a complete circuit");

	public final CompoundParameter brightMin = new CompoundParameter("BrightMin",0.5f,0,1.0)
		.setDescription("Brightness of last plant in tail");

	public final CompoundParameter brightMax = new CompoundParameter("BrightMax",1.0f,0.1,1.0)
		.setDescription("Brightness of head of snake");

	public BooleanParameter outsideIn = new BooleanParameter("OutsideIn",false)
		.setDescription("Go from outside in (if false, goes from inside out)");

	public BooleanParameter reverseDir = new BooleanParameter("CCW",false)
		.setDescription("Go Counterclockwise");

	public static class SnakeCAV implements ParticleInfo
	{
		public float length = 4;
		public float durationMS = 1000.0f;
		public float brightMin = 0.0f;
		public float brightMax = 1.0f;
		public boolean outsideIn = false;

		private float timerMs = 0.0f;
		private int curRingDex = -1;
		private float curRingAlpha = 0f;
		private boolean isFinished = true;

		private int curHeadPlantDex = 0;
		private int curTailPlantDex = 0;

		public void TriggerSnake(float l, float d, float bMin, float bMax, boolean outIn)
		{
			outsideIn = outIn;
			curRingDex = outIn?(PrairieUtils.kNumRings-1):0;
			curRingAlpha = outIn?1.0:0.0;
			length = l;
			durationMS = d;
			brightMin = min(bMin,bMax);
			brightMax = max(bMax,bMin);
			isFinished = false;
			curHeadPlantDex = -1;
			curTailPlantDex = -1;
		}

		public void UpdateParticle(float deltaSec)
		{
			if (outsideIn)
			{
				UpdateParticleOutsideIn(deltaSec);
				return;
			}
			curRingAlpha += deltaSec * 1000.0f / durationMS;
			while (curRingAlpha > 1.0)
			{
				curRingAlpha -= 1.0;
				curRingDex++;
			}

			int plantInRing = (int) (curRingAlpha * ((float)ModelUtils.NumPlantsInRing(curRingDex)));

			curHeadPlantDex = ModelUtils.PlantDexArrayForRing(curRingDex).get(plantInRing);
			if (curRingDex >= PrairieUtils.kNumRings)
			{
				// we'll pretend like the head is still going so the tail can catch up, using
				// the same number of plants from the p revious ring.
				// make sure we don't go out of bounds in getColorValue!
				curHeadPlantDex += ModelUtils.NumPlantsInRing(PrairieUtils.kNumRings-1);
			}
			curTailPlantDex = curHeadPlantDex - (int)length;

			if (curTailPlantDex >= ModelUtils.MaxPlantDex)
				isFinished = true;
		}

		public void UpdateParticleOutsideIn(float deltaSec)
		{
			curRingAlpha -= deltaSec * 1000.0f / durationMS;
			while (curRingAlpha < 0)
			{
				curRingAlpha += 1;
				curRingDex--;
			}

			int plantInRing = (int) (curRingAlpha * ((float)ModelUtils.NumPlantsInRing(curRingDex)));
			curHeadPlantDex = ModelUtils.PlantDexArrayForRing(curRingDex).get(plantInRing);
			if (curRingDex < 0)
			{
				// keep going negtive and "winding" the head so you can let the tail catch up.
				curHeadPlantDex = (int)((ModelUtils.NumPlantsInRing(0) * (curRingDex+1)));
				curHeadPlantDex -= (int) ((1-curRingAlpha) * ((float)ModelUtils.NumPlantsInRing(curRingDex)));
			}
			curTailPlantDex = curHeadPlantDex + (int)length;

			if (curTailPlantDex <= 0)
				isFinished = true;
		}

		public int getColorValue(LXPoint pt)
		{
			if (isFinished)
				return 0;

			int plantDex = pt.index / PrairieUtils.kNumLightsPerPlant;

			float brightTheta = 0;
			if (outsideIn)
			{
				if (plantDex > curTailPlantDex || plantDex < curHeadPlantDex)
					return 0;
				
				brightTheta = 1- (float)(plantDex - curHeadPlantDex) / length;
			}
			else
			{
				if (plantDex < curTailPlantDex || plantDex > curHeadPlantDex)
					return 0;

				brightTheta = (float)(plantDex - curTailPlantDex) / length;
			}

			
			// where in the lenght of the snake are we (normalized)
			float brightF = brightMin + brightTheta * (brightMax-brightMin);
			int brightI = (int)(max(0.0,(min(1.0f,brightF))) * 255);
			return LXColor.rgba(brightI,brightI,brightI,255);
		}

		public boolean isDead()
		{
			return isFinished;
		}
	}

	public SnakeCAVPattern(LX lx)
	{
		super(lx);
		addParameter("Length",length);
		addParameter("Duration",duration);
		addParameter("BrightMin",brightMin);
		addParameter("BrightMax",brightMax);
		addParameter("OutIn",outsideIn);
		ModelUtils.Init(model);
	}

	@Override
	public void buildPool()
	{
		particlePool = new Stack<ParticleInfo>();
		for (int i = 0; i < kPoolSize; i++)
		{
			particlePool.add(new SnakeCAV());
		}
		usePool = true;
	}

	protected SnakeCAV getParticleFromPool()
	{
		// println("PoolSize:" + particlePool.size());
		if (particlePool == null || particlePool.size() < 1)
			return null;
		
		return (SnakeCAV)(particlePool.pop());
	}

	@Override
	public void triggerNewParticle()
	{
		super.triggerNewParticle();
		SnakeCAV s = getParticleFromPool();
		if (s != null)
		{
			s.TriggerSnake(length.getValuef(),duration.getValuef()*1000/PrairieUtils.kNumRings,brightMin.getValuef(),brightMax.getValuef(),outsideIn.getValueb());
			addParticle(s);
		}
	}
	

}