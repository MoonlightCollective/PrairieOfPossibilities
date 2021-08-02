import heronarts.lx.model.*;
import java.util.Collections;
import java.util.List;
import java.net.InetAddress;
import com.google.gson.JsonObject;

Field buildField(LX lx) {
  return new Field(lx);
}

/**
 *
 * A field is a collection of LightBase(s) filled with FiberStem(s), laid out in a large circle.
 * the circle has an empty circle in the middle, making it one big donut.
*
**/

public class Field  extends JsonFixture {
  
  public final float CENTER_DIAMETER = 30*FEET;
  public final float BASE_SPACING = 8*FEET;
  public final int NUM_BASES = 200;
  public final float CENTER_RADIUS = CENTER_DIAMETER/2;

  public List<LXFixture> getChildren() {
    return this.children;
  }
  
  public Field(LX lx) {
    super(lx);
  }
}


public class LightStem extends LXPoint {

  public float dx;
  public float dy;
  public float dz;
  public LXFixture fixture;
  public int index;
  public float azimuth;

  LightStem(LXFixture f, LXPoint p, int index, float azimuth) {
    super(p);
    this.dx = (float)f.x.getValue() - this.x;
    this.dy = (float)f.y.getValue() - this.y;
    this.dz = (float)f.z.getValue() - this.z;
    this.index = index;
    this.fixture = f;
    this.azimuth = azimuth;
  }

  LXPoint getPoint() {
    return this.fixture.points.get(this.index);
  }
}
