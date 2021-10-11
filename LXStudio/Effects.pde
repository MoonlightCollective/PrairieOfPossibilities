import heronarts.lx.effect.LXEffect;

  
@LXCategory("PrairieEffects")
public static class TargetedColorizeEffect extends LXEffect
{
	public enum ETargetType
	{
		Inner,
		Outer,
		Both,
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
			return (PrairieUtils.IsInner(lightDex));
		else if (targetType.getEnum() == ETargetType.Outer)
			return (PrairieUtils.IsOuter(lightDex));

		return true;
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
public static class TargetedColorizeEffect2 extends LXEffect implements UIDeviceControls<TargetedColorizeEffect2>
{
	public enum ETargetType
	{
		Inner,
		Outer,
		Both,
	}

	public final DiscreteParameter targetType = new DiscreteParameter("Target",new String[]{"None","Inner","Outer","Both"},3);
	public final ColorParameter c1 = new ColorParameter("Color 1",0xFFFF0000).setDescription("Color for darkest LED's (brightness ignored)");
	public final ColorParameter c2 = new ColorParameter("Color 2",0xFF00FF00).setDescription("Color for darkest LED's (brightness ignored)");

	public TargetedColorizeEffect2(LX lx) {
		super(lx);
		addParameter("Target",this.targetType);
		addParameter("C1",this.c1);
		addParameter("C2",this.c2);
	}

	protected boolean shouldColor(int lightDex)
	{
		int targetTypeI = (int)targetType.getValue();
		switch (targetTypeI)
		{
			case 0:
				return false;
			case 1:
				return PrairieUtils.IsInner(lightDex);
			case 2:
				return PrairieUtils.IsOuter(lightDex);
			case 3:
				return true;
		}
		return false;
	}

	@Override
	protected void run(double deltaMs, double enabledAmount) {
		for (LXPoint p : model.points) {
			if (shouldColor(p.index))
			{
				float b = LXColor.b(colors[p.index]);
				int fromColor = LXColor.hsb(c1.hue.getValuef(),c1.saturation.getValuef(),b);
				int toColor = LXColor.hsb(c2.hue.getValuef(),c2.saturation.getValuef(),b);
				double alpha = b/100;
				colors[p.index] = LXColor.lerp(fromColor,toColor,alpha);
			}
		}
	}

	public void buildDeviceControls(heronarts.lx.studio.LXStudio.UI ui, UIDevice uiDevice, TargetedColorizeEffect2 tc2Effect) {
    	uiDevice.setContentWidth(150);

		UI2dComponent dropbox = newDropMenu(tc2Effect.targetType);
	    UIColorPicker c1Picker = new UIColorPicker(25,20,tc2Effect.c1);
	    UIColorPicker c2Picker = new UIColorPicker(25,20,tc2Effect.c2);
		c1Picker.setCorner(UIColorPicker.Corner.TOP_RIGHT);
		c2Picker.setCorner(UIColorPicker.Corner.TOP_RIGHT);
		UI2dContainer row1 = UI2dContainer.newHorizontalContainer(150,10,dropbox,c1Picker,c2Picker);
		addColumn(uiDevice,150,row1);
  	}

}

@LXCategory("PrairieEffects")
public static class RingColorEffect extends LXEffect implements UIDeviceControls<RingColorEffect>
{
	public ArrayList<ColorParameter> ringColors = new ArrayList<ColorParameter> ();

	public RingColorEffect(LX lx) {
		super(lx);
		for (int i = 0; i<PrairieUtils.kNumRings; i++)
		{
			String ringName = "ring " + Integer.toString(i);
			ColorParameter c = new ColorParameter(ringName, 0xFFFF0000).setDescription("Color for " + ringName);
			ringColors.add(c);
			addParameter(ringName, c);
		}
	}

	@Override
	protected void run(double deltaMs, double enabledAmount) {
		for (int i=0; i<PrairieUtils.kNumRings; i++)
		{
			float h = ringColors.get(i).hue.getValuef();
			float s = ringColors.get(i).saturation.getValuef();

	        String strFilter = "ring" + Integer.toString(i);
			for (LXModel m : model.sub(strFilter)) {
				for (LXPoint p : m.points) {
					float b = LXColor.b(colors[p.index]);
					float a = (LXColor.alpha(colors[p.index]) / 255.0f); // convert from 0-255 into 0-1
					colors[p.index] = LXColor.hsba(h, s, b, a);
				}
			}
		}
	}

	public void buildDeviceControls(heronarts.lx.studio.LXStudio.UI ui, UIDevice uiDevice, RingColorEffect ringEffect) {
    	uiDevice.setContentWidth(150);
	    UIColorPicker c1Picker = new UIColorPicker(25,20,ringEffect.ringColors.get(0));
	    UIColorPicker c2Picker = new UIColorPicker(25,20,ringEffect.ringColors.get(1));
	    UIColorPicker c3Picker = new UIColorPicker(25,20,ringEffect.ringColors.get(2));
	    UIColorPicker c4Picker = new UIColorPicker(25,20,ringEffect.ringColors.get(3));
	    UIColorPicker c5Picker = new UIColorPicker(25,20,ringEffect.ringColors.get(4));
	    UIColorPicker c6Picker = new UIColorPicker(25,20,ringEffect.ringColors.get(5));
	    UIColorPicker c7Picker = new UIColorPicker(25,20,ringEffect.ringColors.get(6));
		c1Picker.setCorner(UIColorPicker.Corner.TOP_RIGHT);
		c2Picker.setCorner(UIColorPicker.Corner.TOP_RIGHT);
		c3Picker.setCorner(UIColorPicker.Corner.TOP_RIGHT);
		c4Picker.setCorner(UIColorPicker.Corner.TOP_RIGHT);
		c5Picker.setCorner(UIColorPicker.Corner.TOP_RIGHT);
		c6Picker.setCorner(UIColorPicker.Corner.TOP_RIGHT);
		c7Picker.setCorner(UIColorPicker.Corner.TOP_RIGHT);
		UI2dContainer row1 = UI2dContainer.newHorizontalContainer(50,10,c1Picker,c2Picker, c3Picker,c4Picker);
		UI2dContainer row2 = UI2dContainer.newHorizontalContainer(50,10,c5Picker,c6Picker, c7Picker);
		addColumn(uiDevice,150,row1,row2);
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
		Area,
		Yinyang,
		Section0,
		Section1,
	};

	private String[] filters = {"path","edge","inner","outer","area","yinyang","section0","section1"};

	private boolean[] mask;

	public final EnumParameter<FilterType> targetType = new EnumParameter<FilterType> ("Filter", FilterType.Edge)
		.setDescription("Which subset of lights to keep");

	public final BooleanParameter invert = new BooleanParameter ("Invert", false)
		.setDescription("Whether to invert the filter");

	public FilterEffect(LX lx)
	{
		super(lx);
		addParameter("Filter", this.targetType);
		addParameter("Invert", this.invert);
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
			case Yinyang:
				iEnum = 5;
				break;
			case Section0:
				iEnum = 6;
				break;
			case Section1:
				iEnum = 7;
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
			if ((mask[i] && invert.getValueb()) || (!mask[i] && !invert.getValueb()))
				colors[i] = 0x00000000;
		}		
	}
}
