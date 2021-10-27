import java.util.ArrayList;
import java.util.Iterator;
import java.util.Stack;

//
// Wisp pattern -- Small little snakes that run around on a single ring
//
@LXCategory("Triggered")
public static class WispPattern extends MultiPattern {
	public final CompoundParameter ringMin = new CompoundParameter("RingMin", 0, 0, 7)
		.setDescription("Defines lower limit of which rings the wisps travel on");

	public final CompoundParameter ringMax = new CompoundParameter("RingMax", 6.9, 0, 7)
		.setDescription("Defines upper limit of which rings the wisps travel on");

	public final CompoundParameter lengthMin  = new CompoundParameter("LengthMin", 5, 0, 10)
		.setDescription("Length of each Wisp");

	public final CompoundParameter lengthMax  = new CompoundParameter("LengthMax", 5, 0, 10)
		.setDescription("Length of each Wisp");

	public final CompoundParameter durationMin  = new CompoundParameter("DurationMin", 1, 10)
		.setDescription("Minimum time Wisp exists");

	public final CompoundParameter durationMax  = new CompoundParameter("DurationMax", 5, 10)
		.setDescription("Maximum time Wisp exists");

	public final CompoundParameter speedMin  = new CompoundParameter("SpeedMin", 5, 20)
		.setDescription("Minimum speed of the Wisp in lights per second");

	public final CompoundParameter speedMax  = new CompoundParameter("SpeedMax", 10, 20)
		.setDescription("Maximum speed of the Wisp in lights per second");

	public EnumParameter<Direction> direction = new EnumParameter<Direction>("Direction",Direction.CW);

	public final BooleanParameter doMinRingSpacing = new BooleanParameter("EnforceRingSpacing",false).setMode(BooleanParameter.Mode.TOGGLE);
	public final DiscreteParameter minRingSpacing = new DiscreteParameter("MinRingSpacing",0,0,6);

	public enum Direction
		{
			CW,
			CCW,
			Both
		}
	
	public final int kPoolSize = 30;
	private int lastRing = -1;
	
	public class Wisp implements ParticleInfo
	{
		public int rangeStart; // define the range of lights within which this wisp travels
		public int rangeEnd;   
		public int length;    // length of wisp in terms of number of lights lit up
		public float duration;    // total time the Wisp will travel for
		public float speed;       // speed of the wisp... pos = cw, neg = ccw

		private float pos;         // location within the range of the head of the wisp
		private float curLength;   // let the wisp grow when it first starts out
		private float timer;     // how much longer until the Wisp goes away

		public void TriggerWisp(int ring, int size, float duration, float speed, Direction direction)
		{
			// must first calculate the start and end positions of the lights on this ring
			rangeStart = 100000; // set absurd upper and lower limits
			rangeEnd = 0;

			String strFilter = "ring" + Integer.toString(ring);
			for (LXModel m : model.sub(strFilter)) {
				for (LXPoint p : m.points) {
					rangeStart = min(p.index, rangeStart);          // determine start and end of the range for this ring
					rangeEnd = max(p.index, rangeEnd);
				}
			}

			length = size * PrairieUtils.kNumLightsPerPlant;
			this.duration = duration;
			this.timer = duration;
			this.speed = speed * PrairieUtils.kNumLightsPerPlant;
			this.pos = (float)LXUtils.random(rangeStart, rangeEnd);
			this.curLength = 0;

			if (direction == Direction.CCW || (direction == Direction.Both && (int)LXUtils.random(0,2) == 0))
			{
				speed = -speed;
			}
		}
		
		public void UpdateParticle(float deltaSec)
		{
			float dist = (speed * deltaSec);
			curLength = min(length, curLength + abs(dist));
			pos = pos + dist;
			if (pos > rangeEnd)
			{
				pos = rangeStart + (pos - rangeEnd);
			}
			else if (pos < rangeStart)
			{
				pos = rangeEnd - (rangeStart - pos);
			}
			timer -= deltaSec;
		}

		public boolean isDead()
		{    // check if this particle is out of bounds
			return (timer <= 0);
		}

		public int getColorValue(LXPoint pt)
		{
			int b = 255;
			int wrap = (int)max(0, ((pos + curLength) - rangeEnd));
			int trim = (int)min(curLength, (rangeEnd - pos + 1));

			if ( (pt.index >= rangeStart && pt.index < (rangeStart + wrap)) || (pt.index >= pos && pt.index < (pos + trim)))
				return LXColor.rgba(b,b,b,255);
			else   
				return 0;
		}
	}
 	
	 public WispPattern(LX lx) {
		super(lx);
		addParameter("RingMin", this.ringMin);
		addParameter("RingMax", this.ringMax);
		addParameter("LengthMin", this.lengthMin);
		addParameter("LengthMax", this.lengthMax);
		addParameter("DurationMin", this.durationMin);
		this.durationMin.setUnits(LXParameter.Units.SECONDS);
		addParameter("DurationMax", this.durationMax);
		this.durationMax.setUnits(LXParameter.Units.SECONDS);
		addParameter("SpeedMin", this.speedMin);
		addParameter("Speed", this.speedMax);
		addParameter("Direction", this.direction);
		addParameter("UseMinSpacing",this.doMinRingSpacing);
		addParameter("MinSpacing",this.minRingSpacing);
	}

	@Override
	protected void buildPool()
	{
		particlePool = new Stack<ParticleInfo>();
		for (int i = 0; i < kPoolSize; i++) {
			Wisp w = new Wisp();
			particlePool.push(w);
		}

		usePool = true;
	}

	protected Wisp getParticleFromPool()
	{
		if (particlePool == null || particlePool.size() < 1)
			return null;
		
		return (Wisp)(particlePool.pop());
	}

	protected int chooseNextRingDex()
	{
		int range = (int) (ringMax.getValuef() - ringMin.getValuef());
		if (range < 1)
		{
			return (int)(ringMin.getValuef());
		}

		if (!doMinRingSpacing.getValueb() || lastRing < 0) {
			return(PrairieUtils.RandomInRange((int)ringMin.getValuef(), (int)ringMax.getValuef()));
		}

		// enforce min ring spacing
		int minSpacingI = (int)minRingSpacing.getValuef();
		int minRingI = (int)ringMin.getValuef();
		int offset = PrairieUtils.RandomInRange(minSpacingI,range);
		int newRingDex = min(minRingI+(lastRing + offset)%range,PrairieUtils.kNumRings-1);
		
		if (abs(newRingDex-lastRing) < minSpacingI) // if we ended up next to each other because of wrapping, just do minimum distance
		{
			newRingDex = (minRingI + ((lastRing + minSpacingI)%range));
		}
		
		return newRingDex;
	}

	@Override
	public void triggerNewParticle()
	{
		Random r = new Random();

		super.triggerNewParticle();

		Wisp w = getParticleFromPool();
		if (w != null)
		{
			int ring = chooseNextRingDex();
			w.TriggerWisp( ring,
							PrairieUtils.RandomInRange ((int)lengthMin.getValuef(),(int)lengthMax.getValuef(),false),
							(float)PrairieUtils.RandomFloatInRange(durationMin.getValuef(), durationMax.getValuef(),false),
							(float)PrairieUtils.RandomFloatInRange(speedMin.getValuef(), speedMax.getValuef(),false),
							direction.getEnum());
			addParticle(w);
			lastRing = ring;
		}
	}  
}
