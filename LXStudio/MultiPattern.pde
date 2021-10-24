import java.util.ArrayList;
import java.util.Iterator;
import java.util.Stack;

interface ParticleInfo
{    
    public void UpdateParticle(float deltaSec);     // called each tick through
    public int getColorValue(LXPoint pt);           // returns color component of this particle at that point
    boolean isDead();                               // used to determine when a particle should be removed
}

//
// MultiPattern -- this is an abstract class for any pattern which has a particle system 
// to use, you need to define how the particle behaves and any custom controls it needs
//
public static class MultiPattern extends LXPattern {
  
  public final BooleanParameter triggerBool = new BooleanParameter("Trigger",false)
    .setDescription("Triggers a new particle");

  public final CompoundParameter decay = new CompoundParameter("Decay", 0.5f, 0, 3.0f)
    .setDescription("Sets decay for this effect");

  protected ArrayList<ParticleInfo> particles = new ArrayList<ParticleInfo> ();

  protected boolean usePool = false;
  protected Stack<ParticleInfo> particlePool;

  protected int[] buffer = new int[model.size]; // use for fading out lights (ie, tail)
 
  protected MultiPattern(LX lx) {
    super(lx);
    triggerBool.setMode(BooleanParameter.Mode.MOMENTARY);
    addParameter("Trigger",this.triggerBool);
    addParameter("Decay",this.decay);
    this.decay.setUnits(LXParameter.Units.SECONDS);
    buildPool(); // up to the child classes to implement this or not. See comments in buildPool()
  }
  
  public void addParticle (ParticleInfo particle)
  {
    particles.add(particle);
  }
 
  public void triggerNewParticle()
  {
    // when you override this, be sure to create an instance of your particle and add it to the list of particles
    triggerBool.setValue(false);
  }  


  protected void buildPool()
  {
    // override to build a particle pool (stack) and fill it with particles to pull off the stack.
    // if you do this, make sure to set usePool to TRUE and to pop new particles off the stack
    // rather than allocate new ones.  If usePool is set to true, then particles go back to the
    // pool when they die rather than getting deleted and GC'd
    usePool = false;
  }

  public void computeColors(double deltaMs)
  {
    double decayTimeMs = decay.getValuef() * 1000.0f;
    double alpha = deltaMs / decayTimeMs;
    int decayGray = LXColor.grayn(alpha);

    for (int i = 0; i < model.size; i++)
    {
        int c = LXColor.subtract (buffer[i], decayGray);
        float b = LXColor.b (c);    // from 0-100
        c = LXColor.rgba((int)LXColor.red(c), (int)LXColor.green(c), (int)LXColor.blue(c), (int)(b * 2.559f));
        buffer[i] = c;
    }

    for (LXPoint p : model.points) 
    {
      colors[p.index] = buffer[p.index];

      for (ParticleInfo particle : particles)
      {
        int col = particle.getColorValue(p);
        colors[p.index] = LXColor.add(colors[p.index], col);
        buffer[p.index] = colors[p.index];
      }
    }
  }
  
  public void run(double deltaMs) 
  {
    for (int i = particles.size() - 1; i >= 0; i--)
    {
      ParticleInfo particle = particles.get(i);
      particle.UpdateParticle((float)deltaMs/1000.0);
      if (particle.isDead())
      {
        notifyRemovedParticle(particle);
        if (usePool)
        {
          particlePool.push(particle);
        }
        particles.remove(i);
      }
    }

    if (triggerBool.getValueb())
    {
      triggerNewParticle();
    }

    computeColors(deltaMs);
  }

  protected void notifyRemovedParticle(ParticleInfo pi)
  {
    // nothing - but override if you wanna do something
  }

}
