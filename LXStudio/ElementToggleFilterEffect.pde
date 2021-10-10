
@LXCategory("PrairieFilters")
public static class ElementToggleFilterEffect extends LXEffect 
{
	public BooleanParameter inner1Enabled = new BooleanParameter("Inner1",true);
	public BooleanParameter inner2Enabled = new BooleanParameter("Inner2",true);
	public BooleanParameter outer1Enabled = new BooleanParameter("Outer1",true);
	public BooleanParameter outer2Enabled = new BooleanParameter("Outer2",true);
	public BooleanParameter outer3Enabled = new BooleanParameter("Outer3",true);
	public BooleanParameter outer4Enabled = new BooleanParameter("Outer4",true);
	public BooleanParameter outer5Enabled = new BooleanParameter("Outer5",true);

	public BooleanParameter invertEnabled = new BooleanParameter("Invert",false);
	public BooleanParameter midiEnabled = new BooleanParameter("MidiEnabled",false);
	public DiscreteParameter midiRoot = new DiscreteParameter("MidiRoot",60,0,127);

	private boolean[] mask = new boolean[7];
	protected ArrayList<MidiNote> notesDown = new ArrayList<MidiNote>();

	public ElementToggleFilterEffect(LX lx)
	{
		super(lx);
		addParameter("I1",this.inner1Enabled);
		addParameter("I2",this.inner2Enabled);
		addParameter("O1",this.outer1Enabled);
		addParameter("O2",this.outer2Enabled);
		addParameter("O3",this.outer3Enabled);
		addParameter("O4",this.outer4Enabled);
		addParameter("O5",this.outer5Enabled);
		addParameter("Invert",this.invertEnabled);
		addParameter("MidiEnabled",this.midiEnabled);
		addParameter("MidiRoot",this.midiRoot);
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
		mask[0] = inner1Enabled.getValueb();
		mask[1] = inner2Enabled.getValueb();
		mask[2] = outer1Enabled.getValueb();
		mask[3] = outer2Enabled.getValueb();
		mask[4] = outer3Enabled.getValueb();
		mask[5] = outer4Enabled.getValueb();
		mask[6] = outer5Enabled.getValueb();
	}

	protected void updateActiveStatesFromMidi()
	{
		if (!midiEnabled.getValueb())
			return;

		rebuildMask();
		int midiRootI = midiRoot.getValuei();
		for (MidiNote n : notesDown)
		{
			int lightDex = max(0,(n.getPitch() - midiRootI)%7);
			mask[lightDex] = true;
		}
	}

	public void run(double deltaMs, double enabledAmount) {
		boolean invertB = invertEnabled.getValueb();
		updateActiveStatesFromMidi();

		for (int i=0; i<colors.length; i++)
		{
			int dex = i%7;
			if ((mask[dex] && invertB) || (!mask[dex] && !invertB))
				colors[i] = 0x00000000;
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
}
