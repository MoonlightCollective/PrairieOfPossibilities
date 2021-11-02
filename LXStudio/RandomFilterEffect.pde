@LXCategory("PrairieFilters")
public static class RandomFilterEffect extends LXEffect
{
	public final CompoundParameter plantCountMin = new CompoundParameter("CountMin",100,1,250);
	public final CompoundParameter plantCountVariation = new CompoundParameter("cCuntVariation",0,0,250);
	public final BooleanParameter seedTrigger = new BooleanParameter("SeedTrigger",false).setMode(BooleanParameter.Mode.MOMENTARY);

	public boolean[] filter;

	public RandomFilterEffect(LX lx)
	{
		super(lx);
		addParameter("CountMin",plantCountMin);
		addParameter("CountVariation",plantCountVariation);
		addParameter("SeedTrigger",seedTrigger);
		ModelUtils.Init(model);
		filter = new boolean[ModelUtils.NumPlants()];
		updateFilter();
	}

	public void updateFilter()
	{
		for(int i = 0; i < model.size/PrairieUtils.kNumLightsPerPlant; i++)
		{
			filter[i] = false;
		}

		int minCount = (int)plantCountMin.getValuef();
		int maxCount = minCount + PrairieUtils.RandomInRange(0,(int)plantCountVariation.getValuef());

		int plantCount = min(PrairieUtils.RandomInRange(minCount,maxCount),ModelUtils.NumPlants());
		while (plantCount > 0)
		{
			filter[PrairieUtils.RandomPlantDex(model.size)] = true;
			plantCount--;
		}
	}

	@Override
	public void run(double deltaMs, double enabledAmount)
	{
		if (seedTrigger.getValueb())
		{
			updateFilter();
			seedTrigger.setValue(false);
		}

		for (int i = 0; i < ModelUtils.NumPlants(); i++)
		{
			if (!filter[i])
			{
				int baseDex = i * PrairieUtils.kNumLightsPerPlant;
				for (int e = 0; e < PrairieUtils.kNumLightsPerPlant; e++)
				{
					colors[baseDex+e] = 0;
				}
			}
		}
	}
}