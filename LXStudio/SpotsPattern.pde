
@LXCategory("Triggered")
public static class SpotsPattern extends MultiPattern
{
	public static class SpotInfo implements ParticleInfo
	{
		public float originX;
		public float originZ;
		public float targetSize;
		public PrairieEnvASR brightnessEnv = new PrairieEnvASR(.1,1.0,.1);
		public float curVal = 0;
		public float maxBrightness;
		public float falloffSlope = .5;
		public float growPct = 0;
		public float colorHue = 0;
		public float colorSat = 0;

		public void ResetSpotInfo (float theta,
									float dist, 
									float size, 
									float attackTimeMs, 
									float sustainTimeMs, 
									float decayTimeMs, 
									float brightness,
									boolean startAcive,
									float falloff,
									float growAmt,
									float hue,
									float sat)
		{
			float thetaAngle = theta * 2 * PI;
			originX = dist * LXUtils.cosf(thetaAngle);
			originZ = dist * LXUtils.sinf(thetaAngle);
			targetSize = size;
			brightnessEnv.AttackTimeMs = attackTimeMs;
			brightnessEnv.ReleaseTimeMs = decayTimeMs;
			brightnessEnv.SustainTimeMs = sustainTimeMs;
			maxBrightness = brightness;
			falloffSlope = falloff;
			curVal = 0;
			growPct = growAmt;

			colorHue = hue;
			colorSat = sat;

			if (startAcive)
				brightnessEnv.Trigger(true);
		}

		public void UpdateParticle(float deltaSec)
		{
			brightnessEnv.Update(deltaSec*1000);
		}

		@Override
		public int getColorValue(LXPoint pt)
		{
			float modTargetSize = targetSize + (growPct * brightnessEnv.TotalEnvFraction());
			float dist = (float)LXUtils.distance((pt.xn*2.0)-1.0,(pt.zn*2.0)-1.0,originX,originZ) / modTargetSize;
			float maxB = brightnessEnv.CurVal * maxBrightness;
			float bright = (-(1.0/falloffSlope) * dist) + (1.0/falloffSlope);
			bright = (max(0.0,(min(1.0,bright))));
			bright = bright * maxB;
			return LXColor.hsba((int)colorHue,(int)colorSat,bright * 100.0,bright);
		}

		public boolean isDead()
		{
			return !brightnessEnv.IsActive;
		}
	}

	public CompoundParameter sizeParam = new CompoundParameter("Size",.1,0.1,1);
	public CompoundParameter attackTimeParam = new CompoundParameter("AttackTimeMs",0,0,2);
	public CompoundParameter sustainTimeParam = new CompoundParameter("SustainTimeMs",0,0,3);
	public CompoundParameter decayTimeParam = new CompoundParameter("DecayTimeMs",.5,0,3);
	public CompoundParameter brightParam = new CompoundParameter("Brightness",1,0,1);
	public CompoundParameter distMin = new CompoundParameter("DistMin",0,0,2);
	public CompoundParameter distMax = new CompoundParameter("DistMax",0.5,0,2);
	public CompoundParameter thetaMin = new CompoundParameter("ThetaMin",0,0,1);
	public CompoundParameter thetaMax = new CompoundParameter("ThetaMax",1,0,1);
	public CompoundParameter softness = new CompoundParameter("Softness",0,0,1);
	public CompoundParameter growParam = new CompoundParameter("GrowPct",0,0,4);

	protected final int kPoolSize = 30;

	public SpotsPattern(LX lx)
	{
		super(lx);
		addParameter("Size",sizeParam);
		addParameter("AtkSpot",attackTimeParam);
		addParameter("SusSpot",sustainTimeParam);
		addParameter("DcySpot",decayTimeParam);
		addParameter("Brightness",brightParam);
		addParameter("DistMin",distMin);
		addParameter("DistMax",distMax);
		addParameter("ThetaMin",thetaMin);
		addParameter("ThetaMax",thetaMax);
		addParameter("Softness",softness);
		addParameter("GrowPct",growParam);
	}

	@Override
	protected void buildPool()
	{
		particlePool = new Stack<ParticleInfo>();
		for (int i = 0; i < kPoolSize; i++)
		{
			SpotInfo info = new SpotInfo();
			particlePool.push(info);
		}
		usePool = true;
	}

	@Override
	public void triggerNewParticle()
	{
		super.triggerNewParticle();
		SpotInfo newSpot = newRandomParticle();
		addParticle(newSpot);
	}

	protected SpotInfo getParticleFromPool()
	{
		if (particlePool == null || particlePool.size() < 1)
			return null;

		return (SpotInfo)(particlePool.pop());
	}

	protected SpotInfo newRandomParticle()
	{
		float rTheta = (float)LXUtils.random(thetaMin.getValuef(),thetaMax.getValuef());
		float rDist = (float)LXUtils.random(distMin.getValuef(),distMax.getValuef());

		SpotInfo newSpot = getParticleFromPool();
		if (newSpot != null)
		{
			newSpot.ResetSpotInfo(rTheta,rDist,
									sizeParam.getValuef(),
									attackTimeParam.getValuef()*1000,
									sustainTimeParam.getValuef()*1000,
									decayTimeParam.getValuef()*1000,
									brightParam.getValuef(),
									true,
									softness.getValuef(),
									growParam.getValuef(),
									0.0,0.0);
		}
		return newSpot;
	}
}

@LXCategory("Triggered")
public class SpotsPatternRandomColor extends SpotsPattern {
	public final DiscreteParameter slotStartParam = new DiscreteParameter("PaletteSlot",1,1,5);
	public final DiscreteParameter slotCountParam = new DiscreteParameter("NumColors",0,0,5);
	public final BooleanParameter sequentialSlots = new BooleanParameter("SequentialColors",false).setMode(BooleanParameter.Mode.TOGGLE);

	protected int lastColorDex = 0;

	public SpotsPatternRandomColor(LX lx)
	{
		super(lx);
		addParameter("PaletteSlot",slotStartParam);
		addParameter("NumColors",slotCountParam);
		addParameter("SequentialColors",sequentialSlots);
	}

	protected LXDynamicColor getSwatchColor(int index)
	{
		return ( this.lx.engine.palette.getSwatchColor( min(index,LXSwatch.MAX_COLORS)) );
	}

	

	@Override
	protected SpotInfo newRandomParticle()
	{
		float rTheta = (float)LXUtils.random(thetaMin.getValuef(),thetaMax.getValuef());
		float rDist = (float)LXUtils.random(distMin.getValuef(),distMax.getValuef());

		int startSlotDex = slotStartParam.getValuei()-1;
		int colorDex = (lastColorDex+1)%5;
		if (!sequentialSlots.getValueb())
			colorDex = min(PrairieUtils.RandomInRange(startSlotDex,startSlotDex + slotCountParam.getValuei()),4);

		int selectedColor = getSwatchColor(colorDex).getColor();
		lastColorDex = colorDex;

		SpotInfo newSpot = getParticleFromPool();
		if (newSpot != null)
		{
			newSpot.ResetSpotInfo(rTheta,rDist,
									sizeParam.getValuef(),
									attackTimeParam.getValuef()*1000,
									sustainTimeParam.getValuef()*1000,
									decayTimeParam.getValuef()*1000,
									brightParam.getValuef(),
									true,
									softness.getValuef(),
									growParam.getValuef(),
									LXColor.h(selectedColor),
									LXColor.s(selectedColor));
		}
		return newSpot;
	}
}