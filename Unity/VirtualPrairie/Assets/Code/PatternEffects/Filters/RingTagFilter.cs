using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName="RingTagFilter",menuName = "Prairie Filters/Ring Tag Filter")]
public class RingTagFilter : PatternPointFilterBase
{
	public List<int> Ids = new List<int>();

	public override bool AllowPoint(StemColorManager point)
	{
        foreach (int id in Ids)
        {
            if (point.RingId == id)
                return true;
        }
        return false;
    }
}
