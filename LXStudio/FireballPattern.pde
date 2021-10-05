import java.util.ArrayList;
import java.util.Iterator;
import java.util.Stack;

//
// Fireball pattern -- sends random fireballs shooting across the field, from random directions, with variable size and falloff
//
@LXCategory("Triggered")
public static class FireballPattern extends MultiPattern {
  
  public final CompoundParameter size = new CompoundParameter("Size", 0.1)
    .setDescription("Size of the fireball");
      
  public final CompoundParameter duration  = new CompoundParameter("Duration", 3, 10)
    .setDescription("Time for fireball to shoot across");

  public final CompoundParameter fuzzy  = new CompoundParameter("Fuzzy", 0)
    .setDescription("How soft the edge of the ball should be");

  public class Fireball implements ParticleInfo
  {
    public LXVector pos;
    public LXVector vel;
    public float size;      // from 0 to 1 representing size of the head of this fireball
    public float softness;     // how soft the edge should be. 0 = crisp edge; 1 = totally fuzzy
    private LXVector origin;
    
    Fireball(float duration, float size, float fuzzy)
    {
      this.size = size;
      this.softness = fuzzy;

      float theta = (float)LXUtils.random(0,1.0) * 2.0 * PI;    // pick random direction to start
      float radius = 0.5 + (size / 2.0);                       // put origin of ball just outside the model (which has diameter 1)
      pos = new LXVector(0.5 + (radius * LXUtils.cosf(theta)), 0.5, 0.5 + (radius * LXUtils.sinf(theta)));

      float distToTravel = 1.0 + size;                         // ball has to travel from just outside, across the center, to just outside again
      float speed = distToTravel / duration;
      vel = new LXVector(-speed * LXUtils.cosf(theta), 0, -speed * LXUtils.sinf(theta));  // set vel opposite to the initial vector
      origin = new LXVector(0.5, 0.5, 0.5);
    }
    
    public void UpdateParticle(float deltaSec)
    {
      pos.x = pos.x + (vel.x * deltaSec);
      pos.z = pos.z + (vel.z * deltaSec);
    }

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
          b = 255;
        else
          b = (int)(255.0f * ( 1.0 - ((dist - softness) / (1.0 - softness))));
      }
      return LXColor.rgba(b,b,b,b);
    }

    boolean isDead() {    // check if this particle is out of bounds
      if (pos.dist( origin ) > 0.5 + (size / 2.0))
        return true;
      else
        return false;
    }
  }
 
  public FireballPattern(LX lx) {
    super(lx);
    addParameter("Size", this.size);
    this.duration.setUnits(LXParameter.Units.SECONDS);
    addParameter("Duration", this.duration);
    addParameter("Fuzzy", this.fuzzy);
  }

  @Override
  public void triggerNewParticle()
  {
    super.triggerNewParticle();
    addParticle(new Fireball(duration.getValuef(), size.getValuef(), fuzzy.getValuef()));
  }  
}
