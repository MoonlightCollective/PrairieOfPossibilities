@LXCategory("Utility")
public static class LightOnePlantPattern extends LXPattern
{
	public DiscreteParameter h = new DiscreteParameter("100s",0,2);
	public DiscreteParameter t = new DiscreteParameter("10s",0,9);
	public DiscreteParameter o = new DiscreteParameter("1s",0,9);

	public LightOnePlantPattern(LX lx)
	{
		super (lx);
		addParameter("100s",h);
		addParameter("10s",t);
		addParameter("1s",o);
	}

	public void run(double deltaMs)
	{
		int hundreds = h.getValuei();
		int tens = t.getValuei();
		int ones = o.getValuei();

		int plantID = hundreds * 100 + tens * 10  + ones;
		int baseDex = plantID * PrairieUtils.kNumLightsPerPlant;

		setColors(LXColor.rgba(0,0,0,0));

		for (int i = 0; i <PrairieUtils.kNumLightsPerPlant; i++)
		{
			colors[baseDex + i] = LXColor.rgba(255,255,255,255);
		}
	}
}