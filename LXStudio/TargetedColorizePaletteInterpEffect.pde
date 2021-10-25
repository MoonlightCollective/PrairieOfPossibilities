@LXCategory("PrairieEffects")
public static class TargetedColorizePaletteInterpEffect extends LXEffect
{
	public enum ETargetType
	{
		Inner,
		Outer,
		Both,
	}

	public final DiscreteParameter targetType = new DiscreteParameter("Target",new String[]{"None","Inner","Outer","Both"},3);
	public final CompoundParameter paletteDex = new CompoundParameter("TargetIndex",1,1,LXSwatch.MAX_COLORS);
	public final CompoundParameter transitionTime = new CompoundParameter("TransTime",0,0,5);
	public final BooleanParameter  midiEnabled = new BooleanParameter("MidiEnabled",false);
	public final DiscreteParameter midiRootNote = new DiscreteParameter("MidiRoot",60,0,127);

	private int targetDex;
	private int targetColor;
	private int startDex;
	private int startColor;
	private int curColor;

	private float transitionAlpha = 1.0f;

	public TargetedColorizePaletteInterpEffect(LX lx) {
		super(lx);
		addParameter("Target",this.targetType);
		addParameter("Index", this.paletteDex);
		addParameter("TransTime",this.transitionTime);
		addParameter("MidiEnabled",this.midiEnabled);
		addParameter("MidiRoot",this.midiRootNote);

		// initiaize to already colored
		targetDex = (int)this.paletteDex.getValuef();
		startColor = getSwatchColor(targetDex).getColor();
		targetColor = getSwatchColor(targetDex).getColor();
		curColor = getSwatchColor(targetDex).getColor();
		transitionAlpha = 1.0f;
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

	protected void startTransitionTo(int newTargetDex)
	{
		startColor = curColor;
		targetDex = newTargetDex;
		targetColor = getSwatchColor(targetDex).getColor();
		transitionAlpha = 0;
	}

	protected void updateTransition(double deltaMs)
	{
		if (transitionTime.getValuef() > 0)
		{
			transitionAlpha += (deltaMs/1000.0)/transitionTime.getValuef();
			transitionAlpha = min(1.0,max(0.0,transitionAlpha));
		}
		else
			transitionAlpha = 1.0f;

		curColor = LXColor.lerp(startColor,targetColor,transitionAlpha);
	}

	@Override
	protected void run(double deltaMs, double enabledAmount) 
	{
		int paramTarget = (int) paletteDex.getValuef();
		if (paramTarget != targetDex)
		{
			startTransitionTo(paramTarget);
		}

		if (transitionAlpha < 1.0f)
		{
			updateTransition(deltaMs);
		}
		
		for (LXPoint p : model.points) {
			if (shouldColor(p.index))
			{
				// what's the current brightness? We'l keep the same brightness.
				float b = LXColor.b(colors[p.index]);
				byte curAlphaByte = LXColor.alpha(colors[p.index]);
				float curAlphaVal = (float)curAlphaByte / 255.0;

				int newColor = LXColor.hsba(LXColor.h(curColor),
											LXColor.s(curColor),
											b,
											curAlphaVal);

				colors[p.index] = newColor;
			}
		}
	}

	public void noteOnReceived(MidiNoteOn note)
	{
		if (!midiEnabled.getValueb())
			return;
		
		int pitch = note.getPitch();
		int targetDex = pitch - midiRootNote.getValuei() + 1;
		if (targetDex >= 1 && targetDex <= LXSwatch.MAX_COLORS)
		{
			paletteDex.setValue((float)targetDex);
		}
	}
}