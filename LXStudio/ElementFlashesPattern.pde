
@LXCategory("Triggered")
public static class ElementFlashesPattern extends LXPattern 
{
	public enum ETriggerType
	{
		Bools,
		Midi,
		Both,
	}

	public CompoundParameter attackParam = new CompoundParameter("Attack",0,0,2);
	public CompoundParameter decayParam = new CompoundParameter("Decay",.5,0,4);
	public CompoundParameter brightnessParam = new CompoundParameter("Brightness",1,0,1);

	public BooleanParameter inner0Trig = new BooleanParameter("Inner0Trig",false).setMode(BooleanParameter.Mode.MOMENTARY);
	public BooleanParameter inner1Trig = new BooleanParameter("Inner1Trig",false).setMode(BooleanParameter.Mode.MOMENTARY);
	public BooleanParameter outer0Trig = new BooleanParameter("Outer0Trig",false).setMode(BooleanParameter.Mode.MOMENTARY);
	public BooleanParameter outer1Trig = new BooleanParameter("Outer1Trig",false).setMode(BooleanParameter.Mode.MOMENTARY);
	public BooleanParameter outer2Trig = new BooleanParameter("Outer2Trig",false).setMode(BooleanParameter.Mode.MOMENTARY);
	public BooleanParameter outer3Trig = new BooleanParameter("Outer3Trig",false).setMode(BooleanParameter.Mode.MOMENTARY);
	public BooleanParameter outer4Trig = new BooleanParameter("Outer4Trig",false).setMode(BooleanParameter.Mode.MOMENTARY);

	public EnumParameter<ETriggerType> triggerType = new EnumParameter<ETriggerType>("TriggerType",ETriggerType.Bools);
	public DiscreteParameter midiRootNote = new DiscreteParameter("MidiRoot",60,0,127);

	protected ArrayList<MidiNote> notesDown = new ArrayList<MidiNote>();
	protected SingleFlashElement elements[];

	protected boolean elementStates[] = new boolean[PrairieUtils.kNumLightsPerPlant];

	public ElementFlashesPattern(LX lx)
	{
		super(lx);
		addParameter("TrigType",triggerType);
		addParameter("MidiRoot",midiRootNote);
		addParameter("Attack",attackParam);
		addParameter("Decay",decayParam);
		addParameter("Brightness", brightnessParam);
		addParameter("Inner0Trig",inner0Trig);
		addParameter("Inner1Trig",inner1Trig);
		addParameter("Outer0Trig",outer0Trig);
		addParameter("Outer1Trig",outer1Trig);
		addParameter("Outer2Trig",outer2Trig);
		addParameter("Outer3Trig",outer3Trig);
		addParameter("Outer4Trig",outer4Trig);
		buildElements();
	}

	public void buildElements()
	{
		elements = new SingleFlashElement[PrairieUtils.kNumLightsPerPlant];
		for (int i = 0; i < PrairieUtils.kNumLightsPerPlant; i++)
		{
			elements[i] = new SingleFlashElement();
			elements[i].attackTimeMs = attackParam.getValuef() * 1000;
			elements[i].decayTimeMs = decayParam.getValuef() * 1000;
		}
	}

	public void resetElementStates()
	{
		for (int i = 0; i < PrairieUtils.kNumLightsPerPlant; i++)
		{
			elementStates[i] = false;
		}
	}

	public void updateActiveStatesFromParams()
	{
		elementStates[0] |= inner0Trig.getValueb();
		elementStates[1] |= inner1Trig.getValueb();
		elementStates[2] |= outer0Trig.getValueb();
		elementStates[3] |= outer1Trig.getValueb();
		elementStates[4] |= outer2Trig.getValueb();
		elementStates[5] |= outer3Trig.getValueb();
		elementStates[6] |= outer4Trig.getValueb();
	}

	public void updateActiveStatesFromMidi()
	{
		int root = midiRootNote.getValuei();
		for (MidiNote note : notesDown)
		{
			int dex = note.getPitch() - root;
			if (dex >= 0 && dex < PrairieUtils.kNumLightsPerPlant) {
				elementStates[dex] = true;
			}
		}		
	}

	protected void applyStatesToElements()
	{
		for(int i = 0; i < PrairieUtils.kNumLightsPerPlant; i++) {
			elements[i].setActive(elementStates[i]);
			elements[i].attackTimeMs = attackParam.getValuef() * 1000;
			elements[i].decayTimeMs = decayParam.getValuef() * 1000;
		}
	}

	public void run(double deltaMs)
	{
		ETriggerType tt = triggerType.getEnum();
		resetElementStates();

		if (tt == ETriggerType.Bools || tt == ETriggerType.Both)
			updateActiveStatesFromParams();
		if (tt == ETriggerType.Midi || tt == ETriggerType.Both)
			updateActiveStatesFromMidi();

		applyStatesToElements();
		
		float brightnessF = brightnessParam.getValuef();

		for (int i = 0; i  < PrairieUtils.kNumLightsPerPlant; i++) {
			elements[i].update((float)deltaMs);
		}

		for (LXPoint p: model.points)
		{
			int lightDex = (p.index)%7;
			float elAlpha = elements[lightDex].curValNormalized();
			float level = (brightnessF * elAlpha);
			int c = (int)(level * 255.0);
			colors[p.index] = LXColor.rgba(c,c,c,c);
		}
	}

	public void noteOnReceived(MidiNoteOn note)
	{
		notesDown.add(note);
	}

	public void noteOffReceived(MidiNote note) {
		Iterator<MidiNote> noteIter = notesDown.iterator();
		while (noteIter.hasNext())
		{
			MidiNote n = noteIter.next();
			if (note.getPitch() == n.getPitch()) 
				noteIter.remove();
		}
	}


	public static class SingleFlashElement
	{
		public float attackTimeMs;
		public float decayTimeMs;
		private float alpha = 0;
		private boolean isActive = false;

		public void setActive(boolean newActive) { isActive = newActive; }
		public float curValNormalized() { return alpha; }

		public void update(float deltaMs)
		{
			if (isActive && alpha < 1.0)
				alpha = min(1.0, (attackTimeMs > 0.0)?(alpha + deltaMs/attackTimeMs):1.0);
			else if (!isActive && alpha > 0)
				alpha = max(0.0, (decayTimeMs > 0.0)?(alpha - deltaMs/decayTimeMs):0.0);

		}
	}
}