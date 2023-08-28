using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using Newtonsoft.Json;

public class FixtureLayoutExporter : MonoBehaviour
{
	public bool DoFixtureExport(GameObject rootObj, string exportPath)
	{
		FixtureData data = buildExportData(rootObj);
		if (data == null)
			return false;

		string jsonStr = JsonConvert.SerializeObject(data,Formatting.Indented);
		Debug.Log(jsonStr);

		File.WriteAllText(exportPath,jsonStr);
		return true;
	}

	FixtureData buildExportData(GameObject rootObj)
	{
		List<FixtureItemData> items = new List<FixtureItemData>();

		// go through all my children looking for plants
		int itemCount = 0;
		foreach (Transform obj in rootObj.transform)
		{
			PlantColorManager pcm = obj.gameObject.GetComponent<PlantColorManager>();
			if (pcm == null)
			{
				// Debug.LogWarning($"Skipping {obj.gameObject.name} - not a Plant fixture");
				continue; // skip if not a plant.
			}

			if (itemCount != pcm.PlantId)
			{
				Debug.LogWarning($"out of order plant id:{pcm.PlantId} in plant, but is the item dex{itemCount}");
			}

			itemCount++;

			FixtureItemData fid = new FixtureItemData { id = pcm.PlantId, x = PrairieUtil.MetersToInches(pcm.transform.position.x), z = PrairieUtil.MetersToInches(pcm.transform.position.z) };			
			
			// export tags
			List<string> tagData = new List<string>();
			foreach (PrairieTag t in pcm.FixtureTags)
			{
				tagData.Add(t.Name);
			}
			fid.tags = tagData;
			
			items.Add(fid);
		}


		List<FixtureOutputItemData> outputItems = new List<FixtureOutputItemData>();

		List<WirePathData> wirePathData = buildWirePathExportData();
		List<PortalItemData> portalData = buildPortalExportData();
		List<BoothItemData> boothData = buildBoothExportData();

		FixtureData data = new FixtureData();
		data.label = rootObj.gameObject.name;
		data.comment = "Exported from virtual prairie";
		data.children = items;
		data.outputs = outputItems;
		data.wirePaths = wirePathData;
		data.portals = portalData;
		data.booths = boothData;

		// TODO: add generator export
		return data;
	}

	List<WirePathData> buildWirePathExportData()
	{
		List<WirePathData> dataList = new List<WirePathData>();
		foreach (var path in WiredPathManager.Instance.Paths)
		{
			WirePathData pathData = new WirePathData();
			pathData.artnetHost = path.ArtnetHost;
			pathData.channelStart = path.ChannelStart;
			pathData.pathId = path.PathId;
			pathData.universe = path.Universe;
			List<WirePathItemData> pathItemList = new List<WirePathItemData>();
			foreach (var fixture in path.Fixtures)
			{
				WirePathItemData item = new WirePathItemData();
				item.PathId = fixture.PathIndex;
				item.FixtureId = fixture.FixtureId;
				item.FixtureType = fixture.FixtureType;
				item.ChannelStartOverride = fixture.ChannelStartOverride;
				pathItemList.Add(item);
			}
			pathData.items = pathItemList;
			dataList.Add(pathData);
		}
		return dataList;
	}

	List<PortalItemData> buildPortalExportData()
	{
		List<PortalItemData> dataList = new List<PortalItemData>();

		var rootObj = PrairieUtil.GetPortalRoot();
		foreach (Transform child in rootObj.transform)
		{
			Portal p = child.GetComponentInChildren<Portal>();
			if (p != null)
			{
				Vector3 portalPosFt = PrairieUtil.MetersToInches(child.transform.position);
				PortalItemData data = new PortalItemData{x = portalPosFt.x, z = portalPosFt.z,portalId = p.PortalId};
				data.rotation = new RotData(child);
				dataList.Add(data);
			}
			else
			{
				Debug.LogWarning($"Encountered a child in Portal root ({child.gameObject.name}) that doesn't have a portal script - NOT EXPORTED ");
			}
		}

		return dataList;
	}

	List<BoothItemData> buildBoothExportData()
	{
		List<BoothItemData> dataList = new List<BoothItemData>();

		var rootObj = PrairieUtil.GetBoothRoot();
		foreach (Transform child in rootObj.transform)
		{
			Booth booth = child.GetComponentInChildren<Booth>();
			if (booth != null)
			{
				Vector3 boothPosFt = PrairieUtil.MetersToInches(child.transform.position);
				BoothItemData data = new BoothItemData{x = boothPosFt.x, z = boothPosFt.z, boothId = booth.BoothId};
				data.rotation = new RotData(child);
				dataList.Add(data);
			}
			else
			{
				Debug.LogWarning($"Encountered a child in Booth root ({child.gameObject.name}) that doesn't have a booth script - NOT EXPORTED ");
			}
		}

		return dataList;
	}

	public void ExportPathDataCSV(string exportFilePath)
	{
		string HeaderStr = "PathId,Host,Universe,ChannelStart,Fixture0,Fixture1,DistanceFt";
		using (StreamWriter stream = new StreamWriter(exportFilePath) )
		{
			stream.WriteLine(HeaderStr);
			foreach (var path in WiredPathManager.Instance.Paths)
			{
				string host = path.ArtnetHost;
				string channelStart = path.ChannelStart.ToString();
				string pathId = path.PathId;
				string universe = path.Universe.ToString();
				for (int i = 0; i < path.Fixtures.Count-1; i++)
				{
					Vector3 startPos = path.Fixtures[i].transform.position;
					Vector3 endPos = path.Fixtures[i+1].transform.position;
					float distM = Vector3.Distance(endPos,startPos);
					float distFt = PrairieUtil.MetersToFeet(distM);
					stream.WriteLine($"{pathId},{host},{universe},{channelStart},{(path.Fixtures[i].FixtureId).ToString()},{(path.Fixtures[i+1].FixtureId).ToString()},{distFt.ToString()}");
				}
				stream.Flush();
			}
			stream.Flush();
		}
	}

	// returns an angle in 0-360 from the x axis origin
	private float AngleBetweenVector3(Vector3 vec1, Vector3 vec2)
	{
		// lets use these as Vector2's
		var A = new Vector2(vec1.x, vec1.z);
		var B = new Vector2(vec2.x, vec2.z);
		// normalize the vectors
		A.Normalize();
		B.Normalize();
		// get the dot product
		var Dot = Vector2.Dot(A, B);
		// get the determinant
		var Det = A.x * B.y - A.y * B.x;
		// get the angle
		var radians = Mathf.Atan2(Det, Dot);
		// convert to degrees
		var degrees = RadianstoDegrees(radians);
		// where is it ?
		if (degrees < 0)
			degrees = 360.0f + degrees;
		return degrees;
	}

	private float DegreesToRadians(float angle)
	{
		return Mathf.PI / 180.0f * angle;
	}
	private float RadianstoDegrees(float angle)
	{
		float degrees = angle * 180.0f / Mathf.PI;
		if (degrees == 360)
			degrees = 0;
		return degrees;
	}

	private Vector2 GetIntersection(Vector2 point, float theta, float radius)
	{
		// express the line as a normalized unit vector
		float dx = radius * Mathf.Cos(theta) - 0;
		float dy = radius * Mathf.Sin(theta) - 0;
		float mag = Mathf.Sqrt(dx * dx + dy * dy);
		dx /= mag;
		dy /= mag;

		// translate the point and get the dot product
		float lambda = (dx * (point.x - 0)) + (dy * (point.y - 0));
		Vector2 intersectPoint = new Vector2();
		intersectPoint.x = (dx * lambda) + 0;
		intersectPoint.y = (dy * lambda) + 0;

		return intersectPoint;
	}

	private float SubtractDegreesWithRollover(float theta, float offset)
	{
		theta -= offset;
		if (theta < 0.0f)
			theta = 360.0f + theta;
		return theta;
	}

	private float CCWtoCW(float angle)
	{
		if (angle == 0)
			return 0;
		return 360.0f-angle;
	}

	private void FiveDegreeMath(
		float theta, 
		float radius, 
		float x, 
		float y, 
		out float NearestTheta5, 
		out float DistFromCenterOnTheta5,
		out float DistFromTheta5)
	{
		Vector2 fixturePoint = new Vector2(x,y);

		float angle = theta;
		// round angle down
		int angleFloor = Mathf.FloorToInt(angle);
		// the nearest 5(degree) angle below
		float angle1 = angleFloor - (angleFloor % 5);
		// the nearest 5(degree) angle above
		float angle2 = angle1 + 5.0f;
		// convert to radians
		angle1 = DegreesToRadians(angle1);
		angle2 = DegreesToRadians(angle2);

		// make a line from the origin out angle1 to double the radius (just a big line) and get the intersection
		Vector2 angle1Point = GetIntersection(fixturePoint, angle1, 2 * radius);
		// how far to that intersection
		float distance1 = Vector2.Distance(fixturePoint, angle1Point);

		// same thing for angle2
		Vector2 angle2Point = GetIntersection(fixturePoint, angle2, 2 * radius);
		// how far to that intersection
		float distance2 = Vector2.Distance(fixturePoint, angle2Point);

		Vector2 origin = new Vector2(0,0);
		if (distance1 < distance2)
		{
			NearestTheta5 = Mathf.Round(RadianstoDegrees(angle1));
			DistFromCenterOnTheta5 = Vector2.Distance(origin, angle1Point);
			// negative numbers mean go "backwards" from that nearest theta
			DistFromTheta5 = -1 * distance1;
		}
		else
		{
			NearestTheta5 = Mathf.Round(RadianstoDegrees(angle2));
			DistFromCenterOnTheta5 = Vector2.Distance(origin, angle2Point);
			DistFromTheta5 = distance2;
		}
	}	

	private Vector3 FindContainer()
	{
		// find the camera stops
		var CameraStops = new List<CameraStop>(PrairieGlobals.Instance.CameraStopRoot.GetComponentsInChildren<CameraStop>());
		// find the container
		var ContainerCameraStop = CameraStops[3];
		// grab the transform position vector
		return ContainerCameraStop.FollowObj.position;		
	}

	public void ExportBaseDataCSV(string exportFilePath)
	{
		var rootObj = PrairieUtil.GetLayoutRoot();
		string HeaderStr = "BaseId,x,z,DistFromCtr,Theta,ChannelStart,PathId,NearestTheta5,DistFromCenterOnTheta5,DistFromTheta5";
		using (StreamWriter stream = new StreamWriter(exportFilePath) )
		{
			stream.WriteLine(HeaderStr);

			// Vector3 container = FindContainer();
			Vector3 xAxis = new Vector3(1, 0, 0);
			//float containerOffset = AngleBetweenVector3(xAxis, container);
			float containerOffset = 90;

			// Debug.Log($"ExportBaseDataCSV: AngleBetweenVector3(xAxis, container) = {containerOffset}");

			foreach (Transform obj in rootObj.transform)
			{
				Vector3 origin = new Vector3(0, 0, 0);

				PlantColorManager pcm = obj.gameObject.GetComponent<PlantColorManager>();
				if (pcm == null)
				{
					// Debug.LogWarning($"Skipping {obj.gameObject.name} - not a Plant fixture");
					continue; // skip if not a plant.
				}
				float distM = Vector3.Distance(pcm.transform.position, origin);
				float distFt = PrairieUtil.MetersToInches(distM);
				float theta = AngleBetweenVector3(xAxis, pcm.transform.position);
				float x = PrairieUtil.MetersToInches(pcm.transform.position.x);
				float z = PrairieUtil.MetersToInches(pcm.transform.position.z);
            	float NearestTheta5, DistFromCenterOnTheta5, DistFromTheta5;
				// do the 5(deg) math !
				FiveDegreeMath(theta, distFt, x, z, out NearestTheta5, out DistFromCenterOnTheta5, out DistFromTheta5);
				// now make it all relative to the container
				theta = CCWtoCW(SubtractDegreesWithRollover(theta, containerOffset));
				NearestTheta5 = CCWtoCW(SubtractDegreesWithRollover(NearestTheta5, containerOffset));

				stream.WriteLine($"{pcm.PlantId},{x.ToString()},{z.ToString()},{distFt.ToString()},{theta.ToString()},{pcm.ChannelStart.ToString()},{pcm.PathId},{NearestTheta5},{DistFromCenterOnTheta5},{DistFromTheta5}");
			}
			stream.Flush();
		}
	}

    public void ExportStalkDataCSV(string exportFilePath)
    {
        var rootObj = PrairieUtil.GetLayoutRoot();
        string HeaderStr = "StalkId,PlantId,x,z,ChannelStart,Universe,IPAddress,StemIndex";
        using (StreamWriter stream = new StreamWriter(exportFilePath))
        {
			int stemId = 0;
            stream.WriteLine(HeaderStr);
            foreach (StemColorManager stem in PrairieUtil.Points)
            {
                float x = PrairieUtil.MetersToInches(stem.transform.position.x);
                float z = PrairieUtil.MetersToInches(stem.transform.position.z);
                stream.WriteLine($"{stemId},{stem.ParentFixture.FixtureId.ToString()},{x.ToString()},{z.ToString()},{stem.ChannelStart.ToString()},{stem.Universe.ToString()},{stem.Host},{stem.StemIndex.ToString()}");
				stemId++;
            }
            stream.Flush();
        }
    }

}
