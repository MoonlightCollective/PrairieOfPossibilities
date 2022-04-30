using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering.Universal;

public class LighthousePattern : PrairiePattern
{
  private float angle = 0; // go between 0 and 1
  private static float MOTION = .0005f;

  public enum AxisEnum 
  {
    Y,
    Z
  };
  
  public AxisEnum Axis;  
  public float Speed;  
  public float Width;
  
  public LighthousePattern() 
  {
  }
  
  public override void Run(float deltaMs) 
  {
    float falloff = 100 / this.Width;
    float speed = this.Speed;
    int posInt;
    
    angle += speed * deltaMs * MOTION;
    posInt = (int)angle;
    angle = angle - posInt; // map between 0 and 1
    
    float pAngle = 0;
    float dist = 0;
    foreach (var p in PrairieUtil.Points) 
    {
      switch (this.Axis) 
      {
        case AxisEnum.Y:
          pAngle = p.azimuth / (2*Mathf.PI);
          break;
        case AxisEnum.Z:
          pAngle = p.theta / (2*Mathf.PI); // angle between 0 and 1
          break;
      }
      dist = PrairieUtil.wrapdistf(pAngle,angle,1.0f);
      int b = (int) (Mathf.Max(0, (100 - falloff*dist)) * 2.559f);
      float c = b/255f;
      colors[p.GlobalPointIndex] = new Color(c, c, c, c);
    }
  }
}