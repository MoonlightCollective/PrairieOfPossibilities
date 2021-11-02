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

    public final CompoundParameter brightnessMin  = new CompoundParameter("BrightnessMin", 0, 100)
        .setDescription("Minimum brightness for the snake");

    public final CompoundParameter brightnessMax  = new CompoundParameter("BrightnessMax", 100, 100)
        .setDescription("Maximum brightness for the snake");

	public final CompoundParameter accelerationMultParam = new CompoundParameter("Acel",2.5,0,10).
		setDescription("How much faster it goes by the time it reaches the outer rim");

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
      public float start;     // first light lit up
      public float end;       // last light lit up
      public float brightness;      // how bright the snake should be

      private float ds;         // delta speed -- how much speed grows as we move
      private float speed;      // how fast the snake moves -- unit time
    
    Snake(float size, float duration, float brightness, Direction direction, float accelerationMult)
    {
        length = (int)(model.size * size);       // convert size of 0-1 into fixed number of lights
        speed = 105.0f / duration;                   // starting speed
        ds = 105.0 * accelerationMult / duration;                  // how much speed increases per unit of time
//        speed = ((model.size + length) / duration);           // how many lights it needs to advance each second
        this.brightness = brightness;
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
            ds = -ds;
        }
    }
    
    public void UpdateParticle(float deltaSec)
    {
        start += (speed * deltaSec);
        end += (speed * deltaSec);
        speed += (ds * deltaSec);
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
        int b = (int)(brightness * 2.559f);
        if (pt.index >= start && pt.index < end)
            return LXColor.rgba(b,b,b,255);
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
    addParameter("BrightnessMin", this.brightnessMin);
    addParameter("BrightnessMax", this.brightnessMax);
    addParameter("Diretion", this.direction);
	addParameter("Accel",this.accelerationMultParam);
  }

  @Override
  public void triggerNewParticle()
  {
    super.triggerNewParticle();
    addParticle(new Snake(
                (float)LXUtils.random(lengthMin.getValuef(), lengthMax.getValuef()),
                (float)LXUtils.random(durationMin.getValuef(), durationMax.getValuef()),
                (float)LXUtils.random(brightnessMin.getValuef(), brightnessMax.getValuef()),
                direction.getEnum(),
				accelerationMultParam.getValuef()));
  }  
}
