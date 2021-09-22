import java.util.ArrayList;
import java.util.Iterator;

@LXCategory("PrairieMidi")
public class MidiNoteListenEffect extends LXEffect implements LXTriggerSource {
	public BooleanParameter anyNoteOn = new BooleanParameter("NoteGateOut",false);
	public final BooleanParameter noteTrig = new BooleanParameter("NoteTrigOut",false).setMode(BooleanParameter.Mode.MOMENTARY);
	public DiscreteParameter midiNoteMin = new DiscreteParameter("MinNoteVal",0,0,127);
	public DiscreteParameter midiNoteMax = new DiscreteParameter("MaxNoteVal",127,0,127);

	public DiscreteParameter lastNoteDown = new DiscreteParameter("Pitch",0,0,127);
	public CompoundParameter lastNoteNorm = new CompoundParameter("PitchNorm",0,0,1);
	public CompoundParameter lastNoteVelNorm = new CompoundParameter("VelNorm",0,0,1);
	public DiscreteParameter noteCount = new DiscreteParameter("NoteCount",0,0,1);

	public MidiNoteListenEffect(LX lx){
		super(lx);
		addParameter("MinNote",this.midiNoteMin);
		addParameter("MaxNote",this.midiNoteMax);
		addParameter("Pitch",lastNoteDown);
		addParameter("PitchNorm",lastNoteNorm);
		addParameter("VelNorm",lastNoteVelNorm);
		addParameter("NoteGateOut",anyNoteOn);
		addParameter("NoteTrigOut",noteTrig);
	}

	private ArrayList<MidiNote> notesDown = new ArrayList<MidiNote>();

	public BooleanParameter getTriggerSource() {
		return this.noteTrig;
	}

	protected void run(double deltaMs,double enabledAmt) {
		if (notesDown.size() == 0)
			noNotesDown();
		else
			anyNoteOn.setValue(true);
		
		if (noteTrig.getValueb())
			noteTrig.setValue(false);
	}

	protected void noNotesDown()
	{
		lastNoteVelNorm.setValue(0);
		lastNoteDown.setValue(0);
		lastNoteNorm.setValue(0);
		anyNoteOn.setValue(false);
	}

	protected boolean noteInRange(MidiNote note)
	{
		int pitch = note.getPitch();
		return (pitch >= midiNoteMin.getValuei() && pitch <= midiNoteMax.getValuei());
	}

	public void noteOffReceived(MidiNote note) {
		Iterator<MidiNote> noteIter = notesDown.iterator();
		while (noteIter.hasNext())
		{
			MidiNote n = noteIter.next();
			if (note.getPitch() == n.getPitch()) {
				noteIter.remove();
			}
		}

		if (notesDown.size() == 0) {
			noNotesDown();
		}
	}
	public void noteOnReceived(MidiNoteOn note) {
		if (noteInRange(note)) {
			this.noteTrig.setValue(true);
			int pitch = note.getPitch();
			int vel = note.getVelocity();
			lastNoteDown.setValue(pitch);
			lastNoteNorm.setValue((float)(pitch-midiNoteMin.getValuei())/(float)(midiNoteMax.getValuei() - midiNoteMin.getValuei()));
			lastNoteVelNorm.setValue((float)vel / (float)128);
			notesDown.add(note);
		}
	}
}