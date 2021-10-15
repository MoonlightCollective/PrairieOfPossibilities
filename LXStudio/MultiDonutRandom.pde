import java.util.ArrayList;
import java.util.Iterator;
import java.util.Stack;

//
// MultiDonutRanom classes - also an example of a "triggered" effect using exposed boolean that can be modulated
//
@LXCategory("Triggered")
public static class MultiDonutRandomPattern extends MultiPattern {
  
  public final CompoundParameter size = new CompoundParameter("Size", 0, 2)
    .setDescription("Size of the donut");
  
  public final CompoundParameter wth = new CompoundParameter("Width", .4, 0, 1)
    .setDescription("Width of the donut");
  
  public final CompoundParameter distMin = new CompoundParameter("DistMin", .5, 0, 1)
    .setDescription("Min distance of origin from the center");

  public final CompoundParameter distMax = new CompoundParameter("DistMax", 1, 0, 1)
    .setDescription("Max distance of origin from the center");
  
  public final CompoundParameter thetaMin  = new CompoundParameter("ThetaMin", 0, 0, 1)
    .setDescription("Angle of origin min");
    
  public final CompoundParameter thetaMax  = new CompoundParameter("ThetaMax", 1, 0, 1)
    .setDescription("Angle of origin max");
  
  public final CompoundParameter duration = new CompoundParameter("Duration", 0.1,2.0);

  public final CompoundParameter fade = new CompoundParameter("Fade", 0.8,1.0)
    .setDescription("When this donut should start fading");
 
  public class Ring implements ParticleInfo
  {
    public float originTheta;
    public float thetaAngle;
    public float originDist;
    public float originX;
    public float originZ;
    
    public float falloff;
    public float start;
    public float range;
    public float size;
    public float curAlpha;
    public float fade;
  
    private float duration;
    private float curFade;
    
    Ring(float minTheta,float maxTheta, float minDist, float maxDist, float size, float ringDuration, float width, float fade)
    {
      originTheta = (float)LXUtils.random(minTheta,maxTheta);
      originDist = (float)LXUtils.random(minDist,maxDist);
      thetaAngle = originTheta * 2 * PI;
      originX = originDist * LXUtils.cosf(thetaAngle);
      originZ = originDist * LXUtils.sinf(thetaAngle);
      this.size = size;
      this.fade = fade;

      falloff = 100 / width;
      start = -width;
      range = 1 + (2*width);
      
      curAlpha = 0;
      duration = ringDuration;
      curFade = 1.0;
    }
    
    public void UpdateParticle(float deltaSec)
    {
      curAlpha = min(1.0,(curAlpha + (float)deltaSec/duration));
      if (curAlpha >= fade)
      {
        curFade = (1.0f - curAlpha)/(1.0f - fade);
      }
    }

    boolean isDead() {    // check if this particle is expired
      if (curAlpha >= 1.0)
        return true;
      else
        return false;
    }

    public int getColorValue(LXPoint pt)
    {
      float pos = start + (size * range * curAlpha);
      float n = (float)LXUtils.distance ((pt.xn*2.0)-1.0, (pt.zn*2.0)-1.0, originX, originZ); 
      int b = (int)(max(0, (100 - falloff*abs(n - pos)))* 2.559f * curFade);
      return LXColor.rgba(b,b,b,b);
    }
  }
 
  public MultiDonutRandomPattern(LX lx) {
    super(lx);
    addParameter("Size", this.size);
    addParameter("Width", this.wth);
    addParameter("DistRangeMin", this.distMin);
    addParameter("ThetaRangeMin", this.thetaMin);
    addParameter("DistRangeMax", this.distMax);
    addParameter("ThetaRangeMax", this.thetaMax);
    addParameter("Duration",this.duration);
    addParameter("Fade",this.fade);
    this.duration.setUnits(LXParameter.Units.SECONDS);
  }
  
  @Override
  public void triggerNewParticle()
  {
    super.triggerNewParticle();
    addParticle(new Ring(thetaMin.getValuef(),thetaMax.getValuef(),distMin.getValuef(),distMax.getValuef(),size.getValuef(),duration.getValuef(),wth.getValuef(),fade.getValuef()));
  }  
}

@LXCategory("Triggered")
public static class VanishingDonutPattern extends MultiPattern {
  
  public final CompoundParameter size = new CompoundParameter("Size", 0, 2)
    .setDescription("Size of the donut");
  
  public final CompoundParameter wth = new CompoundParameter("Width", .4, 0, 1)
    .setDescription("Width of the donut");
  
  public final CompoundParameter distMin = new CompoundParameter("DistMin", .5, 0, 1)
    .setDescription("Min distance of origin from the center");

  public final CompoundParameter distMax = new CompoundParameter("DistMax", 1, 0, 1)
    .setDescription("Max distance of origin from the center");
  
  public final CompoundParameter thetaMin  = new CompoundParameter("ThetaMin", 0, 0, 1)
    .setDescription("Angle of origin min");
    
  public final CompoundParameter thetaMax  = new CompoundParameter("ThetaMax", 1, 0, 1)
    .setDescription("Angle of origin max");
  
  public final CompoundParameter duration = new CompoundParameter("Duration", 0.5,5.0);
 
  public class Ring implements ParticleInfo
  {
    public float originTheta;
    public float thetaAngle;
    public float originDist;
    public float originX;
    public float originZ;
    
    public float falloff;
    public float start;
    public float range;
    public float size;
    public float curAlpha;

    private float outerCircle;
    private float innerCircle;
    private float width;
  
    private float duration;
    
    Ring(float minTheta,float maxTheta, float minDist, float maxDist, float size, float ringDuration, float width)
    {
      originTheta = (float)LXUtils.random(minTheta,maxTheta);
      originDist = (float)LXUtils.random(minDist,maxDist);
      thetaAngle = originTheta * 2 * PI;
      originX = originDist * LXUtils.cosf(thetaAngle);
      originZ = originDist * LXUtils.sinf(thetaAngle);
      this.size = size;
      this.width = width;

      falloff = 100 / width;
      start = -width;
      range = 1 + (2*width);
      
      curAlpha = 0;
      duration = ringDuration;

      innerCircle = 0;
      outerCircle = 0;
    }
    
    public void UpdateParticle(float deltaSec)
    {
      curAlpha += deltaSec / duration;      // grow from 0-1 during "duration"
      outerCircle = curAlpha * size;
      if (curAlpha >= width)
      {
        innerCircle = (curAlpha - width) / (1.0f - width) * size;
      }
    }

    boolean isDead() {    // check if this particle is expired
      if (curAlpha >= 1.0)
        return true;
      else
        return false;
    }

    public int getColorValue(LXPoint pt)
    {
      float n = (float)LXUtils.distance ((pt.xn*2.0)-1.0, (pt.zn*2.0)-1.0, originX, originZ);
      int b;
      if (n >= innerCircle && n < outerCircle)
        b = 255;
      else 
        b = 0;

//      int b = (int)(max(0, (100 - falloff*abs(n - pos)))* 2.559f);
      return LXColor.rgba(b,b,b,b);
    }
  }
 
  public VanishingDonutPattern(LX lx) {
    super(lx);
    addParameter("Size", this.size);
    addParameter("Width", this.wth);
    addParameter("DistRangeMin", this.distMin);
    addParameter("ThetaRangeMin", this.thetaMin);
    addParameter("DistRangeMax", this.distMax);
    addParameter("ThetaRangeMax", this.thetaMax);
    addParameter("Duration",this.duration);
    this.duration.setUnits(LXParameter.Units.SECONDS);
  }
  
  @Override
  public void triggerNewParticle()
  {
    super.triggerNewParticle();
    addParticle(new Ring(thetaMin.getValuef(),thetaMax.getValuef(),distMin.getValuef(),distMax.getValuef(),size.getValuef(),duration.getValuef(),wth.getValuef()));
  }  
}
