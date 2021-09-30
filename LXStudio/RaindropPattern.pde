import java.util.ArrayList;
import java.util.Iterator;
import java.util.Stack;

@LXCategory("Rain")
public static class RainPattern extends LXPattern 
{
	public final CompoundParameter rainFreq = new CompoundParameter("RainFrequency",.5,.01,1);
	public final CompoundParameter maxIntensity = new CompoundParameter("MaxIntensity",100,0,100);
	public final CompoundParameter minIntensity = new CompoundParameter("MinIntensity",100,0,100);
	public final CompoundParameter dropDecay = new CompoundParameter("DropDecay",5,.1,10);
	public final CompoundParameter dropAttack = new CompoundParameter("DropAttack",.05,.01,1);
	public final CompoundParameter size = new CompoundParameter("Size",.1,.01,1);
	public final CompoundParameter ringWidth = new CompoundParameter("Width",.1,.01,1);

	private final static int kPoolSize = 100;
	private float dropTimer = 0;

	private Stack<SingleDrop> dropPool;
	private ArrayList<SingleDrop> activeDrops;
	public static float s_ringWidth = 0.1;

	public static class SingleDropWave {
		public PrairieEnvAD intensityEnv = new PrairieEnvAD(1,1);
		public PrairieEnvAD distanceEnv = new PrairieEnvAD(1,1);
		public float maxIntensity = 1.0f;
		public float maxDistance = 3.0f;
		private float originX = 0;
		private float originY = 0;

		public float timer;
		public boolean active;
		public float curDist;
		public float curIntensity;

		public void Init(double intensity, double attackMs, double decayMs, float distanceMax, float distanceDecayMs)
		{
			intensityEnv.AttackTimeMs = attackMs;
			intensityEnv.DecayTimeMs = decayMs;
			distanceEnv.AttackTimeMs = distanceDecayMs;
			distanceEnv.DecayTimeMs = 0;
			maxIntensity = (float)intensity;
			maxDistance = (float)distanceMax;
			float curDist;
			timer = 0;
			curDist = 0;
			curIntensity = 0;
			active = false;
		}

		public void Activate()
		{
			active = true;
			curDist = 0;
			intensityEnv.Trigger(true);
			distanceEnv.Trigger(true);
		}

		public boolean UpdateSingleDropWave(double deltaMs)
		{
			intensityEnv.Update(deltaMs);
			distanceEnv.Update(deltaMs);
			// println("sdUpdate: " + distanceEnv.CurVal);
			curDist = distanceEnv.CurVal * maxDistance;
			curIntensity = intensityEnv.CurVal * maxIntensity;
			return IsActive();
		}
		
		public boolean IsActive()
		{
			return intensityEnv.IsActive || distanceEnv.IsActive;
		}

		public float CurIntensity() 
		{
			if (!intensityEnv.IsActive) 
				return 0;
			return (intensityEnv.CurVal * maxIntensity);
		}
		
		public float CurDistance()
		{
			if (!intensityEnv.IsActive)
				return 0;
			return (distanceEnv.CurVal * maxDistance);
		}
	}

	public static class SingleDrop {

		public int plantDex;
		private boolean active;
		private SingleDropWave dropWave;
		private float dropOriginX,dropOriginZ;
		private float timer;

		public SingleDrop()
		{
			plantDex = -1;
			active = false;
			timer = -1;
			dropWave = new SingleDropWave();
		}

		public void StartDrop(double intensity, double attackMs, double decayMs, float distanceMax, float distanceDecayMs,float originX, float originZ)
		{
			dropWave.Init(intensity,attackMs, decayMs, distanceMax, distanceDecayMs);
			dropOriginX = originX;
			dropOriginZ = originZ;
			dropWave.Activate();
			timer = 0;
			active = true;
		}

		public void UpdateDrop(double deltaMs)
		{
			timer += deltaMs;
			dropWave.UpdateSingleDropWave(deltaMs);
			active = dropWave.IsActive();
		}

		public float GetIntensityForPoint(LXPoint point)
		{
			if (!dropWave.IsActive())
				return 0;

			// distance of the point from the origin of this drop.
			float distFromOrigin = (float) LXUtils.distance(point.xn,point.zn,dropOriginX,dropOriginZ);
			float wdth = RainPattern.s_ringWidth;
			float distFromEdge = abs(distFromOrigin-dropWave.curDist);
			//float b = max(0,100-100*(distFromEdge/wdth));
			// float b = max(0,100-100*distFromOrigin/dropWave.maxDistance);
			// float b = max(0,1-1*distFromOrigin/dropWave.CurDistance());
			float b = max(0,1-1*distFromEdge/wdth);
			return (b * dropWave.CurIntensity());
		}
		public float debugIntensity()
		{
			return dropWave.curIntensity;
		}
		public float debugDist()
		{
			return dropWave.curIntensity;
		}

		public boolean IsActive()
		{
			return active;
		}
	}

	public RainPattern(LX lx)
	{
		super(lx);
		addParameter("RainFrequency",rainFreq);
		addParameter("MaxIntensity",maxIntensity);
		addParameter("MinIntensity",minIntensity);
		addParameter("DropDecay",dropDecay);
		addParameter("DropAttack",dropAttack);
		addParameter("Size",size);
		addParameter("Width",ringWidth);
		buildPool();
		dropTimer = -1;
	}

	private void buildPool()
	{
		dropPool = new Stack<SingleDrop>();
		for (int i = 0; i < kPoolSize; i++)
		{
			dropPool.push(new SingleDrop());
		}

		activeDrops = new ArrayList<SingleDrop>();
	}

	public void triggerNewDrop()
	{
		if (dropPool.size() > 0)
		{
			SingleDrop drop = dropPool.pop();
			int baseDex = PrairieUtils.RandomPlantDex(model.size) * PrairieUtils.kNumLightsPerPlant;
			drop.StartDrop((double)maxIntensity.getValuef(),(double)dropAttack.getValuef()*1000,(double)dropDecay.getValuef()*1000,size.getValuef(),dropDecay.getValuef()*1000,model.points[baseDex].xn,model.points[baseDex].zn);
			println("Triggered new:" + (double)maxIntensity.getValuef()+ "," + (double)dropAttack.getValuef() + "," + (double)dropDecay.getValuef() + "at" + model.points[baseDex].xn + "," + model.points[baseDex].zn);
			activeDrops.add(drop);
		}
	}

	public void run(double deltaMs)
	{
		s_ringWidth = ringWidth.getValuef();
		dropTimer -= (float)deltaMs;
		if (dropTimer < 0) {
			triggerNewDrop();
			dropTimer = rainFreq.getValuef() * 1000;
			// println("new Timer:" + twinkleTimer);
		}

		Iterator<SingleDrop> iter = activeDrops.iterator();
		while (iter.hasNext()) {
			SingleDrop drop = iter.next();
			drop.UpdateDrop(deltaMs);
			// println("drop:" + drop.debugIntensity() + "," + drop.debugDist());

			if (!drop.IsActive()) {
				iter.remove();
				dropPool.push(drop);
			}
		}


	    for (LXPoint p : model.points) 
		{
			colors[p.index] = 0;
			for (SingleDrop drop : activeDrops)
			{
				int b = (int) (drop.GetIntensityForPoint(p) * 2.55);
				colors[p.index] = LXColor.add(colors[p.index],LXColor.rgba(b,b,b,b));
			}
		}
	}
}

