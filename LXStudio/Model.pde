import heronarts.lx.model.*;
import java.util.Collections;
import java.util.List;

Field buildField(LX lx) {
  return new Field(lx);
}

public static class LightBaseFixtureConfig {
  final String ip;
  final LXMatrix[] channels = new LXMatrix[LightBase.NUM_FIBERSTEMS]; 
  
  public LightBaseFixtureConfig(String ip) {
    this.ip = ip;
    for (int i = 0; i < channels.length; ++i) {
      channels[i] = null;
    }
  }
}

/**
 *
 * A field is a collection of LightBase(s) filled with FiberStem(s), laid out in a large circle.
 * the circle has an empty circle in the middle, making it one big donut.
*
**/

public static class Field extends LXStructure {
  
  public static final float CENTER_DIAMETER = 10*FEET;
  public static final float BASE_SPACING = 6*FEET;
  public static final int NUM_BASES = 200;
  
  public final List<LightBase> bases;
  
  public Field(LX lx) {
    super(lx);
    Fixture f = (Fixture) this.fixtures.get(0);
    this.bases = Collections.unmodifiableList(f.bases);        
  }

  private static class Fixture extends LXFixture {
    
    private final List<LightBase> bases = new ArrayList<LightBase>();
    
    Fixture(LX lx) {
      super (lx);
      // Load up the file
      JSONObject assemblages = null;  //applet.loadJSONObject(FIXTURES_FILE);
      JSONArray fixtures = assemblages.getJSONArray("Fixtures");
      
      // Load up all of the fixtures and index them by ID
              
      println("Stellar import done.");
      
    }
    int size ()
    {
      return 0;
    }
    void	computePointGeometry(LXMatrix transform, List<LXPoint> points)
    {

    }
    void	buildOutputs()
    {
      
    }
  }
}


// note:  a dmx512 universe can handle 512 channels
//       thats 24 bases.  (24*21 = 504)

/*
 * a base has 21 channels 
 * 7-stems , each with 3 channels (r,g,b)
 */ 
public class LightBase extends LXModel {

  // coordinates in global space
  public final float x;
  public final float y;
  public final float z;

  public static final int NUM_FIBERSTEMS = 7;

  LightBase(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
}

public class LightStem extends LXModel {

  // coordinates in global space
  public float x;
  public float y;
  public float z;
  public float azimuth;
  public int rgb;

  LightStem(float x, float y, float z, float azimuth, int rgb) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.azimuth = azimuth;
    this.rgb = rgb;
  }

}
