import java.util.ArrayList;
import java.util.Iterator;
import java.util.Collections;

public static class ModelUtils 
{
	public static int MaxPlantDex = 0;

	private static boolean s_initialized = false;

	private static ArrayList<ArrayList<Integer>> ringLightDexArrays = new ArrayList<ArrayList<Integer>>();
	private static ArrayList<ArrayList<Integer>> ringPlantDexArrays = new ArrayList<ArrayList<Integer>>();

	private static class IndexRange 
	{
		public int min;
		public int max;
		IndexRange(int minIn, int maxIn)
		{
			min = minIn;
			max = maxIn;
		}
	}

	private static IndexRange[] ringPlantDexRanges = new IndexRange[PrairieUtils.kNumRings];
	private static IndexRange[] ringLightDexRanges = new IndexRange[PrairieUtils.kNumRings];

	public static void Init(LXModel model)
	{
		if (s_initialized)
		{
			return;
		}
		computeringLightDexArrays(model);
		s_initialized = true;
	}

	public static int NumPlants()
	{
		return MaxPlantDex + 1;
	}

	public static ArrayList<Integer> PlantDexArrayForRing(int ringDex)
	{
		if (!s_initialized)
		{
			println("Not initialized!");
			return null;
		}

		if (ringDex < 0)
			return ringPlantDexArrays.get(0);

		if (ringDex >= PrairieUtils.kNumRings)
			return ringPlantDexArrays.get(PrairieUtils.kNumRings-1);

		return ringPlantDexArrays.get(ringDex);
	}

	public static int NumPlantsInRing(int ringDex)
	{
		return PlantDexArrayForRing(ringDex).size();
	}


	public static boolean IsPlantInRing(int plantDex,int ringDex)
	{
		if (ringDex < 0 || ringDex >= PrairieUtils.kNumRings)
			return false;

		IndexRange range = ringPlantDexRanges[ringDex];

		return (plantDex >= range.min && plantDex <= range.max);
	}

	public static boolean IsLightInRing(int lightDex,int ringDex)
	{
		if (ringDex < 0 || ringDex >= PrairieUtils.kNumRings)
			return false;
		
		IndexRange range = ringLightDexRanges[ringDex];
		return (lightDex >= range.min && lightDex <= range.max);
	}

	private static void computeringLightDexArrays(LXModel model)
	{
		for (int i = 0; i < PrairieUtils.kNumRings; i++)
		{
			ArrayList<Integer> rda = new ArrayList<Integer>(); // array for index of each LED, ordered within an array for this ring
			ArrayList<Integer> rpda = new ArrayList<Integer>(); // array for index of each plant, ordered within an array for this ring.

			String strFilter = "ring" + Integer.toString(i);
			for (LXModel m: model.sub(strFilter))
			{
				for (LXPoint p : m.points)
				{
					rda.add(p.index);
					if (p.index%PrairieUtils.kNumLightsPerPlant == 0)
					{
						int plantDex = p.index/PrairieUtils.kNumLightsPerPlant;
						rpda.add(plantDex);
						ModelUtils.MaxPlantDex = max(ModelUtils.MaxPlantDex,plantDex);
					}
				}
			}
			Collections.sort(rda);
			Collections.sort(rpda);
			ringLightDexArrays.add(rda);
			ringPlantDexArrays.add(rpda);

			ringLightDexRanges[i] = new IndexRange(rda.get(0),rda.get(rda.size()-1));
			ringPlantDexRanges[i] = new IndexRange(rpda.get(0),rpda.get(rpda.size()-1));
		}

	}
}