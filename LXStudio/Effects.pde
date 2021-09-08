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

@LXCategory("PrairieEffects")
public static class FilterEffect extends LXEffect
{
	public enum FilterType
	{
		Path,
		Edge,
		Inner,
		Outer,
		Area
	};

	private String[] filters = {"path","edge","inner","outer","area"};

	private boolean[] mask;

	public final EnumParameter<FilterType> targetType = new EnumParameter<FilterType> ("Filter", FilterType.Edge)
		.setDescription("Which subset of lights to keep");

	public FilterEffect(LX lx)
	{
		super(lx);
		addParameter("Filter", this.targetType);
		rebuildMask();
	}

    @Override
	public void onModelChanged(LXModel model)
	{
		rebuildMask();
	}
	
	@Override
	public void onParameterChanged(LXParameter parameter)
	{
		rebuildMask();
	}

	private void rebuildMask()
	{
		mask = new boolean[model.size];
		for (int i=0; i<mask.length; ++i)
		{
			mask[i] = false;
		}

		int iEnum = 0;
		switch (this.targetType.getEnum())
		{
			case Path:
				iEnum = 0;
				break;
			case Edge:
				iEnum = 1;
				break;
			case Inner:
				iEnum = 2;
				break;
			case Outer:
				iEnum = 3;
				break;
			case Area:
				iEnum = 4;
				break;
		}

		String strFilter = filters[iEnum];

		for (LXModel m : model.sub(strFilter)) {
			for (LXPoint p : m.points) {
				mask[p.index] = true;
			}
		}
	}

	public void run(double deltaMs, double enabledAmount) {
		for (int i=0; i<colors.length; i++)
		{
			if (!mask[i])
				colors[i] = 0x00000000;
		}		
	}
}
