@LXCategory("PrairieEffects")
public static class TargetedColorizePaletteEffect extends LXEffect //implements UIDeviceControls<TargetedColorizeEffect2>
{
	public enum ETargetType
	{
		Inner,
		Outer,
		Both,
	}

	public final DiscreteParameter targetType = new DiscreteParameter("Target",new String[]{"None","Inner","Outer","Both"},3);
	public final DiscreteParameter paletteDex = new DiscreteParameter("Index",1,1,LXSwatch.MAX_COLORS);
	public final BooleanParameter interpNext = new BooleanParameter("Interp",false);

	public TargetedColorizePaletteEffect(LX lx) {
		super(lx);
		addParameter("Target",this.targetType);
		addParameter("Index", this.paletteDex);
		addParameter("Interp",this.interpNext);
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

	protected LXDynamicColor getSwatchColor(int index)
	{
		return ( this.lx.engine.palette.getSwatchColor( min(index-1,LXSwatch.MAX_COLORS)) );
	}

	@Override
	protected void run(double deltaMs, double enabledAmount) 
	{
		// cache the colors, so we don't have to compute H and S inside the loop
		int selectedColor = getSwatchColor(paletteDex.getValuei()).getColor();
		int nextColor = getSwatchColor(paletteDex.getValuei()+1).getColor();

		float selectedH = LXColor.h(selectedColor);
		float selectedS = LXColor.s(selectedColor);
		float nextH = LXColor.h(nextColor);
		float nextS = LXColor.s(nextColor);

		int fromColor;
		int toColor;
		
		for (LXPoint p : model.points) {
			if (shouldColor(p.index))
			{
				// what's the current brightness? We'l keep the same brightness.
				float b = LXColor.b(colors[p.index]);
				
				fromColor = LXColor.hsb(selectedH,selectedS,b);
				if (interpNext.getValueb())
					toColor = LXColor.hsb(nextH,nextS,b);
				else
					toColor = LXColor.hsb(selectedH,selectedS,b);

				double alpha = b/100;
				colors[p.index] = LXColor.lerp(fromColor,toColor,alpha);
			}
		}
	}
}
