
@LXCategory("Gated")
public static class RingTogglesPattern extends LXPattern 
{
	public enum ETriggerType
	{
		Bools,
		Midi,
		Both,
	}

	public CompoundParameter attack = new CompoundParameter("Attack",0,0,2);
	public CompoundParameter decay = new CompoundParameter("Decay",.5,0,3);
	public BooleanParameter ring0On = new BooleanParameter("R0",false).setMode(BooleanParameter.Mode.MOMENTARY);
	public BooleanParameter ring1On = new BooleanParameter("R1",false).setMode(BooleanParameter.Mode.MOMENTARY);
	public BooleanParameter ring2On = new BooleanParameter("R2",false).setMode(BooleanParameter.Mode.MOMENTARY);
	public BooleanParameter ring3On = new BooleanParameter("R3",false).setMode(BooleanParameter.Mode.MOMENTARY);
	public BooleanParameter ring4On = new BooleanParameter("R4",false).setMode(BooleanParameter.Mode.MOMENTARY);
	public BooleanParameter ring5On = new BooleanParameter("R5",false).setMode(BooleanParameter.Mode.MOMENTARY);
	public BooleanParameter ring6On = new BooleanParameter("R6",false).setMode(BooleanParameter.Mode.MOMENTARY);

	public EnumParameter<ETriggerType> triggerType = new EnumParameter<ETriggerType>("TriggerType",ETriggerType.Bools);
	public DiscreteParameter midiRootNote = new DiscreteParameter("MidiRoot",60,0,127);
	
	protected boolean ringState[];
	protected ArrayList<MidiNote> notesDown = new ArrayList<MidiNote>();

	public static class SingleRing
	{
		public float attackTimeMs;
		public float decayTimeMs;
		private float alpha = 0;
		public boolean isActive = false;

		public void setActive(boolean newActive)
		{
			isActive = newActive;
		}

		public void update(float deltaMs)
		{
			if (isActive && alpha < 1.0)
				alpha = min(1.0, alpha + deltaMs/attackTimeMs);
			else if (!isActive && alpha > 0)
				alpha = max(0.0, alpha - deltaMs/decayTimeMs);
		}

		public float curValNormalized()
		{
			// wrapping in a function in case we want to create non-linear functions
			return alpha;
		}
	}

	private SingleRing[] rings;

	public RingTogglesPattern(LX lx)
	{
		super(lx);
		addParameter("Trig",triggerType);
		addParameter("Attack",attack);
		addParameter("Decay",decay);
		addParameter("R0",ring0On);
		addParameter("R1",ring1On);
		addParameter("R2",ring2On);
		addParameter("R3",ring3On);
		addParameter("R4",ring4On);
		addParameter("R5",ring5On);
		addParameter("R6",ring6On);
		addParameter("MidiRoot",midiRootNote);
		buildRings();
	}

	public void buildRings()
	{
		rings = new SingleRing[PrairieUtils.kNumRings];
		for (int i = 0; i < PrairieUtils.kNumRings; i++)
		{
			rings[i] = new SingleRing();
			rings[i].attackTimeMs = attack.getValuef() * 1000;
			rings[i].decayTimeMs = decay.getValuef() * 1000;
		}

		ringState = new boolean[PrairieUtils.kNumRings];
	}

	public void onParameterChanged(LXParameter parameter)
	{
		for (int i = 0; i < PrairieUtils.kNumRings;i++)
		{
			rings[i].attackTimeMs = attack.getValuef() * 1000;
			rings[i].decayTimeMs = decay.getValuef() * 1000;
		}
	}

	protected void resetRingStates()
	{
		for (int i = 0; i < PrairieUtils.kNumRings; i++)
			ringState[i] = false;
	}
	protected void updateActiveStatesFromParams()
	{
		ringState[0] |= ring0On.getValueb();
		ringState[1] |= ring1On.getValueb();
		ringState[2] |= ring2On.getValueb();
		ringState[3] |= ring3On.getValueb();
		ringState[4] |= ring4On.getValueb();
		ringState[5] |= ring5On.getValueb();
		ringState[6] |= ring6On.getValueb();
	}
	
	protected void updateActiveStatesFromMidi()
	{
		int root = midiRootNote.getValuei();
		for (MidiNote note : notesDown)
		{
			int dex = note.getPitch() - root;
			if (dex >= 0 && dex < PrairieUtils.kNumRings)
			{
				ringState[dex] = true;
			}
		}
	}

	protected void applyStatesToRings()
	{
		for(int i = 0; i < PrairieUtils.kNumRings; i++)
		{
			rings[i].setActive(ringState[i]);
		}
	}

	public void run(double deltaMs)
	{
		ETriggerType tt = triggerType.getEnum();

		resetRingStates();

		if (tt == ETriggerType.Bools || tt == ETriggerType.Both)
			updateActiveStatesFromParams();
		if (tt == ETriggerType.Midi || tt == ETriggerType.Both)
			updateActiveStatesFromMidi();

		applyStatesToRings();

		for (int i = 0; i < PrairieUtils.kNumRings; i++)
		{
			rings[i].update((float)deltaMs);
			String strFilter = "ring" + Integer.toString(i);
			int brightness = (int)(255.0 * rings[i].curValNormalized());
			float bf = rings[i].curValNormalized();
			for (LXModel m : model.sub(strFilter)) {
				for (LXPoint p : m.points) {
					colors[p.index] = LXColor.rgba(brightness,brightness,brightness,brightness);
				}
			}
		}
	}

	public void noteOnReceived(MidiNoteOn note) {
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

}
