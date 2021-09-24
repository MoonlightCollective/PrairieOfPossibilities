
@LXCategory("PrairieEffects")
public static class PieFilterEffect extends LXEffect
{
	public final DiscreteParameter sliceCount = new DiscreteParameter("SliceCount",4,1,30).
		setDescription("How many pie pieces to divide the field into");

	public final CompoundParameter rotationOffset = new CompoundParameter("Offset",0,0,360).
		setDescription("Rotational offset for slicing");

	public final BooleanParameter invert = new BooleanParameter("invert",false);
	
	private int[] segId;
	private int prevSliceCount = -1;
	public PieFilterEffect(LX lx)
	{
		super(lx);
		addParameter("SliceCount",sliceCount);
		addParameter("Invert",invert);
		addParameter("Offset",rotationOffset);
	}

    @Override
	public void run(double deltaMs, double enabledAmount) {
		int sliceCountInt = (int)sliceCount.getValue();
		float radPerSlice = 2 * PI / (float) sliceCountInt;
		float offset = rotationOffset.getValuef() * PI/180;

		for (int i=0; i<colors.length; i++)
		{
			int plantDex = i/7;

			// what angle from origin is the light?
			float pAngleRad = model.points[i].azimuth + offset;
			if (pAngleRad > 2*PI)
				pAngleRad -= 2*PI;
			
			int segId = (int)(pAngleRad/radPerSlice);

			boolean show = (segId%2)==0;
			if ((show && invert.getValueb()) || (!show && !invert.getValueb()))
				colors[i] = 0x00000000;
		}		
	}
}
