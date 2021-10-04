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

  public final CompoundParameter decay = new CompoundParameter("Decay", 0.9f, 0.9f, 1.0f)
    .setDescription("Sets decay for this effect");

  protected ArrayList<ParticleInfo> particles = new ArrayList<ParticleInfo> ();
  protected int[] buffer = new int[model.size]; // use for fading out lights (ie, tail)
 
  protected MultiPattern(LX lx) {
    super(lx);
    triggerBool.setMode(BooleanParameter.Mode.MOMENTARY);
    addParameter("Trigger",this.triggerBool);
    addParameter("Decay",this.decay);
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

  public void computeColors()
  {
    for (int i = 0; i < model.size; i++)
    {
        buffer[i] = LXColor.multiply (buffer[i], LXColor.grayn(decay.getValuef()));
        if (LXColor.b(buffer[i]) <= 10)
          buffer[i] = 0;
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
        particles.remove(i);
    }

    if (triggerBool.getValueb())
    {
      triggerNewParticle();
    }

    computeColors();
  }
}
