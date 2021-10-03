import java.util.ArrayList;
import java.util.Iterator;
import java.util.Stack;

//
// Snake pattern -- sends random snakes spiraling along from inside to outisde, or vice versa
//
@LXCategory("Triggered")
public static class SnakePattern extends MultiPattern {
  
    public final CompoundParameter lengthMin = new CompoundParameter("LengthMin", 0.1)
        .setDescription("Minimum length of each snake");

    public final CompoundParameter lengthMax = new CompoundParameter("LengthMax", 0.2)
        .setDescription("Maximum length of each snake");

    public final CompoundParameter durationMin  = new CompoundParameter("DurationMin", 3, 10)
        .setDescription("Minimum time for snake to makes its way");

    public final CompoundParameter durationMax  = new CompoundParameter("DurationMax", 6, 10)
        .setDescription("Maximum time for snake to makes its way");

    public EnumParameter<Direction> direction = new EnumParameter<Direction>("Direction",Direction.Both);

    public enum Direction
        {
            Out,
            In,
            Both
        }

  public class Snake implements ParticleInfo
  {
      public int length;    // length of snake in terms of number of lights lit up
      public int start;     // first light lit up
      public int end;       // last light lit up
      public float speed;   // how fast the snake moves
    
    Snake(float size, float duration, Direction direction)
    {
        length = (int)(model.size * size);       // convert size of 0-1 into fixed number of lights
        speed = ((model.size + length) / duration);           // how many lights it needs to advance each second
        if (direction == Direction.Out || (direction == Direction.Both && (int)LXUtils.random(0,2) == 0))
        {
            start = -length;
            end = 0;
        }
        else
        {
            start = model.size;
            end = model.size + length;
            speed = -speed;             // advance inward
        }
    }
    
    public void UpdateParticle(float deltaSec)
    {
        int numLights = (int)(speed * deltaSec);
        start += numLights;
        end += numLights;
    }

    public boolean isDead()
    {    // check if this particle is out of bounds
        if (speed > 0)
            return (start >= model.size);
        else   
            return (end < 0);
    }

    public int getColorValue(LXPoint pt)
    {
        if (pt.index >= start && pt.index < end)
            return LXColor.rgba(255,255,255,255);
        else   
            return 0;
    }
  }
 
  public SnakePattern(LX lx) {
    super(lx);
    addParameter("LengthMin", this.lengthMin);
    addParameter("LengthMax", this.lengthMax);
    addParameter("DurationMin", this.durationMin);
    this.durationMin.setUnits(LXParameter.Units.SECONDS);
    addParameter("DurationMax", this.durationMax);
    this.durationMax.setUnits(LXParameter.Units.SECONDS);
    addParameter("Diretion", this.direction);
  }

  @Override
  public void triggerNewParticle()
  {
    super.triggerNewParticle();
    addParticle(new Snake((float)LXUtils.random(lengthMin.getValuef(), lengthMax.getValuef()), (float)LXUtils.random(durationMin.getValuef(), durationMax.getValuef()), direction.getEnum()));
  }  
}
