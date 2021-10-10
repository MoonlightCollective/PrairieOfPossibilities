import java.util.ArrayList;
import java.util.Iterator;
import java.util.Stack;

// pattern that lights up a single plant each time it is triggered
@LXCategory("Triggered")
public static class MultiFlashesPattern extends MultiPattern 
{
	public CompoundParameter brightnessMin = new CompoundParameter("B Min",20,0,100).setDescription("Min brightness of outer lights (when not triggered)");
	public CompoundParameter brightnessMax = new CompoundParameter("B Max",100,0,100).setDescription("Max brightness of outer lights (when triggered)");
	public CompoundParameter envAttack = new CompoundParameter("Atk",0,0,3).setDescription("Attack time of light flash (sec)");
	public CompoundParameter envDecay = new CompoundParameter("Dcy",.5,0,3).setDescription("Decay time of light flash (sec");
	public EnumParameter<EPlantPart> targetPart = new EnumParameter<EPlantPart>("Target",EPlantPart.Both);

	public enum EPlantPart
	{
		Outer,
		Inner,
		Both,
	}

	public class SingleFlashInstance implements ParticleInfo
	{
		public PrairieEnvAD env;
		public int plantDex;
		public EPlantPart plantPart;
		
		public SingleFlashInstance(float attackTime, float decayTime, int plantDex, EPlantPart plantPart)
		{
			env = new PrairieEnvAD(attackTime,decayTime);
			this.plantDex = plantDex;
			this.plantPart = plantPart;
            env.Trigger(true);
		}
		
		public void UpdateParticle(float deltaSec)
		{
			env.Update(deltaSec*1000.0f);
		}

        boolean isDead()
        {
			return (!env.IsActive);
        }

        public int getColorValue(LXPoint pt)
        {
			int baseDex = plantDex * 7;

            if (pt.index >= baseDex && pt.index < baseDex + 7)          // only return light values if it's in the right range
            {
                float brightMinF = brightnessMin.getValuef();
                float brightMaxF = brightnessMax.getValuef();
                float bright = brightMinF + env.CurVal * (brightMaxF-brightMinF);
                int b = (int)(bright * 2.559f);
                int c = LXColor.rgba(b,b,b,b);

                if (plantPart == EPlantPart.Inner)
                {
                    if (PrairieUtils.IsInner(pt.index))
                        return c;
                    else
                        return 0;
                }
                else if (plantPart == EPlantPart.Outer)
                {
                    if (PrairieUtils.IsOuter(pt.index))
                        return c;
                    else
                        return 0;
                }
                else return c;
            }
            return 0;
        }
	}

	public MultiFlashesPattern(LX lx)
	{
		super(lx);
		addParameter("B Min",brightnessMin);
		addParameter("B Max",brightnessMax);
		addParameter("Atk",envAttack);
        envAttack.setUnits(LXParameter.Units.SECONDS);
		addParameter("Dcy",envDecay);
        envDecay.setUnits(LXParameter.Units.SECONDS);
		addParameter("Target",targetPart);
	}

    @Override
	public void triggerNewParticle()
	{
        super.triggerNewParticle();
        addParticle(new SingleFlashInstance(envAttack.getValuef() * 1000, envDecay.getValuef() * 1000, PrairieUtils.RandomPlantDex(model.size), targetPart.getEnum()));
	}

    @Override
    public void computeColors(double deltaMs)
    {
        float brightMinF = brightnessMin.getValuef();
        int b = (int)(brightMinF * 2.559f);
        int c = LXColor.rgba(b,b,b,b);

        for (LXPoint p : model.points) 
        {
            colors[p.index] = c;
            for (ParticleInfo particle : particles)
            {
                int col = particle.getColorValue(p);
                colors[p.index] = LXColor.lightest(colors[p.index], col);
            }
        }
    }

}
