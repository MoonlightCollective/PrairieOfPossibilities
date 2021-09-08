import heronarts.lx.effect.LXEffect;

  
@LXCategory("PrairieEffects")
public static class TargetedColorizeEffect extends LXEffect
{
	public enum ETargetType
	{
		Inner,
		Outer,
	}

	public final EnumParameter targetType = new EnumParameter<ETargetType>("Target",ETargetType.Inner);
	public final CompoundParameter h1 = new CompoundParameter("Hue1",50,0,360);
	public final CompoundParameter s1 = new CompoundParameter("Sat1",50,0,100);
	public final CompoundParameter h2 = new CompoundParameter("Hue2",50,0,360);
	public final CompoundParameter s2 = new CompoundParameter("Sat2",50,0,100);


	public TargetedColorizeEffect(LX lx) {
		super(lx);
		addParameter("Target",this.targetType);
		addParameter("H1",this.h1);
		addParameter("S1",this.s1);
		addParameter("H2",this.h2);
		addParameter("S2",this.s2);
	}

	protected boolean shouldColor(int lightDex)
	{
		if (targetType.getEnum() == ETargetType.Inner)
			return (PrarieUtils.IsInner(lightDex));
		else
			return (PrarieUtils.IsOuter(lightDex));

	}

	@Override
	protected void run(double deltaMs, double enabledAmount) {
		for (LXPoint p : model.points) {
			if (shouldColor(p.index))
			{
				float b = LXColor.b(colors[p.index]);
				int fromColor = LXColor.hsb(h1.getValuef(),s1.getValuef(),b);
				int toColor = LXColor.hsb(h2.getValuef(),s2.getValuef(),b);
				double alpha = b/100;
				colors[p.index] = LXColor.lerp(fromColor,toColor,alpha);
			}
		}
	}
}
