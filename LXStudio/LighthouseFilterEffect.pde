@LXCategory("PrairieFilters")
public static class LighthouseFilterEffect extends LXEffect
{
	public final CompoundParameter widthParam = new CompoundParameter("Width",.25,0,1);
	public final CompoundParameter angleParam = new CompoundParameter("Angle",0,-360,360);
	public final CompoundParameter falloffParam = new CompoundParameter("Falloff",0,0,1);

	public LighthouseFilterEffect(LX lx)
	{
		super(lx);
		addParameter("Width",this.widthParam);
		addParameter("Angle",this.angleParam);
		addParameter("Falloff",this.falloffParam);
	}

	public void run(double deltaMs, double enabledAmount)
	{
		float angleNorm = angleParam.getValuef()/360.0f;
		if (angleNorm < 0.0)
			angleNorm += 1.0f;

		float widthF = widthParam.getValuef(); // cache since we use more than once.
		float halfWidth = widthF/2.0f; 
		float halfTotalWidth =  halfWidth + halfWidth* falloffParam.getValuef();
		float falloffWidth  = halfTotalWidth-halfWidth; // width per side of falloff

		for (int i = 0; i < colors.length; i++)
		{
			float pAngleNorm = (model.points[i].azimuth)/(2*PI);
			float deltaNorm = LXUtils.wrapdistf(pAngleNorm,angleNorm,1.0f);
			if (deltaNorm <= halfTotalWidth)
			{
				float alphaMult = 0;
				if (deltaNorm <= halfWidth)
				{
					alphaMult = 1.0;
				}
				else
				{
					alphaMult = 1.0-(deltaNorm - halfWidth)/falloffWidth;
				}
				int c = colors[i];
				colors[i] = LXColor.rgba(LXColor.red(c),LXColor.green(c),LXColor.blue(c),min(255,(int)(alphaMult * 255.0)));
			}
			else
			{
				colors[i] = 0x000000FF;
			}

		}
	}

}