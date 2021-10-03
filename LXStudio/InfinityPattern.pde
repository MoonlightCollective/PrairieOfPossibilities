import java.util.ArrayList;
import java.util.Iterator;
import java.util.Stack;

//
// Infinity pattern -- Creates the effect of a ball of light tracing out an infinity symbol across the field
//
@LXCategory("Triggered")
public static class InfinityPattern extends MultiPattern {
  
  public final CompoundParameter size = new CompoundParameter("Size", 0.1)
    .setDescription("Size of the fireball");
      
  public final CompoundParameter duration  = new CompoundParameter("Duration", 3, 10)
    .setDescription("Time to make one circuit");

  public final CompoundParameter fuzzy  = new CompoundParameter("Fuzzy", 0)
    .setDescription("How soft the edge of the ball should be");

  public class Fireball implements ParticleInfo
  {
    public LXVector pos;
    public LXVector vel;
    public float radians;
    
    public float size;      // from 0 to 1 representing size of the head of this fireball
    public float softness;     // how soft the edge should be. 0 = crisp edge; 1 = totally fuzzy
    private LXVector origin;
    
    Fireball(float duration, float size, float fuzzy)
    {
      this.size = size;
      this.softness = fuzzy;

      float theta = 0;    // pick random direction to start
      float radius = 0.5;                       // put origin on edge of the model
      pos = new LXVector(0, 0.5, 0.5);

      float distToTravel = 2.0;                         // ball has to travel from one side to the other and back
      float speed = distToTravel / duration;
      float radian_speed = 4 * PI / duration;
      
      vel = new LXVector(speed, 0, radian_speed);  // set vel opposite to the initial vector
      radians = 0;
      origin = new LXVector(0.5, 0.5, 0.5);
    }
    
    public void UpdateParticle(float deltaSec)
    {
      radians = radians + (vel.z * deltaSec);
      pos.x = pos.x + (vel.x * deltaSec);
      pos.z = 0.5f + (LXUtils.sinf(radians) / 4.0f);

      if (pos.x > 1)
      {
        pos.x = pos.x - (2.0f * (pos.x - 1.0f));    // bounce off the wall when it hits
        vel.x = -vel.x;   // reverse direction
      }
    }

    // pass in a point, get back the color contribution from this particle to that point
    public int getColorValue(LXPoint pt)
    {
      LXVector p = new LXVector(pt.xn, pt.yn, pt.zn);   // do all math in normalized space
      float dist = pos.dist(p);
      int b = 0;

      if (dist > size / 2.0)      // quick out if this point is too far away from this particle //<>//
        b = 0;

      // otherwise the point is inside the range of this particle and will get a color contribution
      else
      {
        dist = dist / (size / 2.0);   // normalize dist to be 0-1 from center out to edge of fireball
        if (dist <= softness)
          b = 255;   // below the softness threshold, full bright
        else
          b = (int)( 255.0f * ( 1.0 - ((dist - softness) / (1.0 - softness))));    // between softness and the edge, slope from full bright to zero
      }
      return LXColor.rgba(b,b,b,b);
    }

    boolean isDead() {    // check if this particle is out of bounds
      if (radians > 4.0f * PI)
        return true;
      else
        return false;
    }
  }
 
  public InfinityPattern(LX lx) {
    super(lx);
    addParameter("Size", this.size);
    this.duration.setUnits(LXParameter.Units.SECONDS);
    addParameter("Duration", this.duration);
    addParameter("Fuzzy", this.fuzzy);
  }
  
  public void triggerNewParticle()
  {
    super.triggerNewParticle();
    addParticle(new Fireball(duration.getValuef(), size.getValuef(), fuzzy.getValuef()));
  }  
}
