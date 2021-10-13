
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
		public SpotInfo(float theta,float dist, float size, float attackTimeMs, float sustainTimeMs, float decayTimeMs, float brightness,boolean startAcive,float falloff)
		{
			float thetaAngle = theta * 2 * PI;
			originX = dist * LXUtils.cosf(thetaAngle);
			originZ = dist * LXUtils.sinf(thetaAngle);
			println("origin:" + originX + "," + originZ);
			targetSize = size;
			brightnessEnv.AttackTimeMs = attackTimeMs;
			brightnessEnv.ReleaseTimeMs = decayTimeMs;
			brightnessEnv.SustainTimeMs = sustainTimeMs;
			maxBrightness = brightness;
			falloffSlope = falloff;
			curVal = 0;

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
			float dist = (float)LXUtils.distance((pt.xn*2.0)-1.0,(pt.zn*2.0)-1.0,originX,originZ) / targetSize;
			float maxB = brightnessEnv.CurVal * maxBrightness;
			float bright = (-(1.0/falloffSlope) * dist) + (1.0/falloffSlope);
			bright = (max(0.0,(min(1.0,bright))));
			bright = bright * maxB;

			int c = (int)(bright*255.0);
			return LXColor.rgba(c,c,c,c);
		}

		public boolean isDead()
		{
			return !brightnessEnv.IsActive;
		}
	}

	public CompoundParameter sizeParam = new CompoundParameter("Size",.1,0.1,1);
	public CompoundParameter attackTimeParam = new CompoundParameter("AttackTimeMs",0,0,1);
	public CompoundParameter sustainTimeParam = new CompoundParameter("SustainTimeMs",0,0,1);
	public CompoundParameter decayTimeParam = new CompoundParameter("DecayTimeMs",.5,0,3);
	public CompoundParameter brightParam = new CompoundParameter("Brightness",1,0,1);
	public CompoundParameter distMin = new CompoundParameter("DistMin",0,0,1);
	public CompoundParameter distMax = new CompoundParameter("DistMax",0.5,0,1);
	public CompoundParameter softness = new CompoundParameter("Softness",0,0,1);

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
		addParameter("Softness",softness);
	}

	@Override
	public void triggerNewParticle()
	{
		super.triggerNewParticle();
		float rTheta = (float)LXUtils.random(0,1);
		float rDist = (float)LXUtils.random(distMin.getValuef(),distMax.getValuef());
		SpotInfo newSpot = new SpotInfo(rTheta,rDist,sizeParam.getValuef(),attackTimeParam.getValuef()*1000,sustainTimeParam.getValuef()*1000,decayTimeParam.getValuef()*1000,brightParam.getValuef(),true,softness.getValuef());
		addParticle(newSpot);
	}
}