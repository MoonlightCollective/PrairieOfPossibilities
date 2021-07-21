import heronarts.lx.model.*;
import java.util.Collections;
import java.util.List;
import java.net.InetAddress;
import com.google.gson.JsonObject;

final static String OUTPUTS_FILE = "FieldOutputs.json";

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

public class Field  {
  
  public final float CENTER_DIAMETER = 30*FEET;
  public final float BASE_SPACING = 8*FEET;
  public final int NUM_BASES = 200;
  public final float CENTER_RADIUS = CENTER_DIAMETER/2;

  public final List<DmxLightController> controllers = new ArrayList<DmxLightController>();
  
  public Field(LX lx) {
    //buildRings(lx);
    buildSpiral(lx);
  }

  private void buildRings(LX lx)
  {
    JsonParser parser = new JsonParser();
    JSONObject fieldOutputs = applet.loadJSONObject(OUTPUTS_FILE);
    JSONArray outputs = fieldOutputs.getJSONArray("fixtures");
    int currentOutput = 0;

    DmxLightController controller = new DmxLightController(lx);
    //controller.load(lx, parser.parse(outputs.getJSONObject(currentOutput).toString()).getAsJsonObject());
    this.controllers.add(controller);
    lx.structure.addFixture(controller);

    int layers = 7;
    float radius = CENTER_RADIUS;

    for (int l = 0; l < layers; ++l) {
        float perimeter = TWO_PI * radius;
        int bases = (int)(perimeter / BASE_SPACING);
        float angle = 0.5 * TWO_PI / bases;
        for (int i = 0 ; i < bases; ++i) {
            angle += TWO_PI / bases;
            if (controller.isFull()) {
              // is there another output available?
              if (currentOutput+1 < outputs.size()) {
                currentOutput++;
              }
              controller = new DmxLightController(lx);
              //controller.load(lx, parser.parse(outputs.getJSONObject(currentOutput).toString()).getAsJsonObject());
              this.controllers.add(controller);
              lx.structure.addFixture(controller);
            }
            controller.addBase(radius * cos(angle), 0, radius * sin(angle));
        }
        radius += BASE_SPACING;
    }
  }

  private void buildSpiral(LX lx)
  {
    JsonParser parser = new JsonParser();
    JSONObject fieldOutputs = applet.loadJSONObject(OUTPUTS_FILE);
    JSONArray outputs = fieldOutputs.getJSONArray("fixtures");
    int currentOutput = 0;

    DmxLightController controller = new DmxLightController(lx);
    //controller.load(lx, parser.parse(outputs.getJSONObject(currentOutput).toString()).getAsJsonObject());
    this.controllers.add(controller);
    lx.structure.addFixture(controller);

    int bases = 200;
    float radius = CENTER_RADIUS;
    float angle = 0;

    for (int i = 0 ; i < bases; ++i) {
        float perimeter = TWO_PI * radius;
        int ring_bases = (int)(perimeter / BASE_SPACING);
        float radius_add = BASE_SPACING/ring_bases;
        if (controller.isFull()) {
          // is there another output available?
          if (currentOutput+1 < outputs.size()) {
            currentOutput++;
          }
          controller = new DmxLightController(lx);
          //controller.load(lx, parser.parse(outputs.getJSONObject(currentOutput).toString()).getAsJsonObject());
          this.controllers.add(controller);
          lx.structure.addFixture(controller);
        }
        controller.addBase(radius * cos(angle), 0, radius * sin(angle));
        angle += TWO_PI / ring_bases;
        radius += radius_add;
    }
  }

}


// note:  a dmx512 universe can handle 512 channels
//        a base has 21 channels 
//        thats 24 bases.  (24*21 = 504)

public class DmxLightController extends JsonFixture {

  public final int MAX_BASES = 24;
  public final List<LightBase> bases = new ArrayList<LightBase>();

  DmxLightController(LX lx) {
    super(lx, "DmxLightController");
  }

  public boolean isFull() {
    if (this.bases.size() >= MAX_BASES) {
      return true;
    }
    return false;
  }

  public LX getLX() {
    return this.lx;
  }

  public void addBase(float x, float y, float z) {
    LightBase base = new LightBase(this, x, y, z);
    this.bases.add(base);
    this.addChild(base);
  }
}

/*
 * a base has 21 channels 
 * 7-stems , each with 3 channels (r,g,b)
 */ 
public class LightBase extends JsonFixture {

  // coordinates in global space
  public final float x;
  public final float y;
  public final float z;

  public static final int NUM_FIBERSTEMS = 7;
  public DmxLightController controller;

  public LightStem[] lightStems;

  /*
  *         0     1
  *            3
  *       2
  *             4
  *          5     6
  */      

  LightBase(DmxLightController controller, float x, float y, float z) {
    super(controller.getLX(), "7-pixel-base");
    this.controller = controller;
    this.x = x;
    this.y = y;
    this.z = z;

    this.lightStems = new LightStem[7];
    this.lightStems[3] = new LightStem(1,    3,  1, 0.0,     #154FF0); // 3
    this.lightStems[4] = new LightStem(1,    3, -1, 0.0,     #E8F015); // 4
    this.lightStems[1] = new LightStem(3,    3,  2, -3*PI/4, #29FD10); // 1
    this.lightStems[6] = new LightStem(2.5,  3, -3, -PI/4,   #10FDE8); // 6
    this.lightStems[0] = new LightStem(-2.5, 3,  2, -5*PI/4, #F8FD10); // 0
    this.lightStems[5] = new LightStem(-2.5, 3, -3, -7*PI/4, #1040FD); // 5
    this.lightStems[2] = new LightStem(-3.5, 3,  0, -3*PI/2, #A010FD); // 2
  }

/*
  protected void buildOutputs() {
    int universe = this.controller.outputObject.getInt("universe"); //<>//
    ArtNetDatagram output = new ArtNetDatagram(this.controller.getLX(), model, universe);
    String host = this.controller.outputObject.getString("host");
    InetAddress address = InetAddress.getByName(host);
    output.setAddress(address);
    this.addOutput(output);
  }

  protected void computePointGeometry(LXMatrix transform, List<LXPoint> points) {

  }

  protected int size() {
    // we have 7 light points
    return 7;
  }*/
}

public class LightStem extends LXPoint {

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
