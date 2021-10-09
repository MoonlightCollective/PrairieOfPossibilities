import java.util.ArrayList;
import java.util.Iterator;
import java.util.Stack;

//
// Wisp pattern -- Small little snakes that run around on a single ring
//
@LXCategory("Form")
public static class LabyrinthPattern extends MultiPattern {
  
    public final CompoundParameter speed  = new CompoundParameter("Speed", 5, 20)
        .setDescription("Speed of the chase effect in lights per second");

    public EnumParameter<Direction> direction = new EnumParameter<Direction>("Direction",Direction.CW);

    public enum Direction
        {
            CW,
            CCW,
        }

  public class RingChase implements ParticleInfo
  {
      public int rangeStart; // define the range of lights within which this wisp travels
      public int rangeEnd;   
      public int length;    // length of wisp in terms of number of lights lit up
	  public boolean isCW;	// direction of travel

      private float pos;         // location within the range of the head of the wisp
    
    RingChase(int ring, int size, Direction direction)
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

		isCW = (direction == Direction.CW);
        length = size * PrairieUtils.kNumLightsPerPlant;
        this.pos = (float)LXUtils.random(rangeStart, rangeEnd);
    }
    
    public void UpdateParticle(float deltaSec)
    {
		float velocity = speed.getValuef() * PrairieUtils.kNumLightsPerPlant;
		if (!isCW)
			velocity = velocity * -1.0f;
        pos = pos + (velocity * deltaSec);	/// use speed directly from knob so it can change at any time
        if (pos > rangeEnd)
        {
            pos = rangeStart + (pos - rangeEnd);
        }
        else if (pos < rangeStart)
        {
            pos = rangeEnd - (rangeStart - pos);
        }
    }

    public boolean isDead()
    {    // this effect never ends -- perpetual effect
        return false;
    }

    public int getColorValue(LXPoint pt)
    {
        int b = 255;
        int wrap = (int)max(0, ((pos + length) - rangeEnd));
        int trim = (int)min(length, (rangeEnd - pos));

        if ( (pt.index >= rangeStart && pt.index < (rangeStart + wrap)) || (pt.index >= pos && pt.index < (pos + trim)))
            return LXColor.rgba(b,b,b,255);
        else   
            return 0;
    }
  }
 
  public LabyrinthPattern(LX lx) {
    super(lx);
    addParameter("Speed", this.speed);
    addParameter("Direction", this.direction);

	Direction isCW = direction.getEnum();
	for (int i=0; i<PrairieUtils.kNumRings; i++)
	{
		addParticle(new RingChase(i, 1, isCW));
		if (isCW == Direction.CW)
			isCW = Direction.CCW;
		else
			isCW = Direction.CW;
	}
  }
}
