final static int DUST_FILL = #523D29;

public class UIFloor extends UI3dComponent {

  private final PImage dust;
  private final PImage person;

  public UIFloor() {
    this.dust = loadImage("dust.png");
    this.person = loadImage("person.png");
  }

  @Override
  protected void onDraw(heronarts.p3lx.ui.UI ui, PGraphics pg) {
    pg.tint(DUST_FILL);
    pg.textureMode(NORMAL);
    pg.beginShape();
    pg.texture(dust);
    // x,y,z,u,v
    pg.vertex(-100*FEET, 0, -100*FEET, 0, 0);
    pg.vertex(100*FEET, 0, -100*FEET, 0, 1);
    pg.vertex(100*FEET, 0, 100*FEET, 1, 1);
    pg.vertex(-100*FEET, 0, 100*FEET, 1, 0);
    pg.endShape(CLOSE);
    
    float personY = 0;
    drawPerson(pg, -10*FEET, personY, 10*FEET, 1.5*FEET, 1.5*FEET);
    drawPerson(pg, 8*FEET, personY, 12*FEET, -1.5*FEET, 1.5*FEET);
    drawPerson(pg, 2*FEET, personY, 8*FEET, -2*FEET, 1*FEET);
    
    pg.noStroke();
  }
  
  void drawPerson(PGraphics pg, float personX, float personY, float personZ, float personXW, float personZW) {
    pg.tint(#393939);
    pg.beginShape();
    pg.texture(this.person);
    pg.vertex(personX, personY, personZ, 0, 1);
    pg.vertex(personX + personXW, personY, personZ + personZW, 1, 1);
    pg.vertex(personX + personXW, personY + 5*FEET, personZ + personZW, 1, 0);
    pg.vertex(personX, personY + 5*FEET, personZ, 0, 0);
    pg.endShape(CLOSE);
  }
}

public class UISimulation extends UI3dComponent implements LXStructure.Listener {

  protected LX lx;

  UISimulation(LX lx) {
    this.lx = lx;
    addChild(new UIFloor());
    lx.structure.addListener(this);
  }

  public void fixtureAdded(LXFixture fixture) {
    if (fixture instanceof Field) {
      Field f = (Field)fixture;
      for (LXFixture child : f.getChildren()) {
        addChild(new UILightBase(child));
      }
    }
  }

  public void fixtureRemoved(LXFixture fixture) {
    if (fixture instanceof LightBase) {
        // TODO
    }
  }

  public void fixtureMoved(LXFixture fixture, int index) {
    if (fixture instanceof LightBase) {
        // TODO
    }
  }

  protected void beginDraw(UI ui, PGraphics pg) {
    float level = 255;
    pg.pointLight(level, level, level, -10*FEET, 30*FEET, -30*FEET);
    pg.pointLight(level, level, level, 30*FEET, 20*FEET, -20*FEET);
    pg.pointLight(level, level, level, 0, 0, 30*FEET);
  }
  
  protected void endDraw(UI ui, PGraphics pg) {
    pg.noLights();
  }
}

public class UILightStem extends UI3dComponent {
    public final LightStem model;

    UILightStem(LightStem model) {
        this.model = model;
    }
}

public class UILightStemTrio extends UILightStem {
  public static final float DIAMETER = 0.125*INCHES;
  public static final float HEIGHT = 60*INCHES;
  public static final int  DETAIL = 8;

  public final UICylinder[][] lightStems = new UICylinder[3][6];

  UILightStemTrio(LightStem model) {
    super(model);
    float  r = DIAMETER/2;
    float  h = HEIGHT;
    // 3 stems
    for (int i = 0; i < 3; ++i) {
        // the stem has 6 joints
        for (int j = 0; j < 6; j++) {
            this.lightStems[i][j] = new UICylinder(r, h/6.0, DETAIL);
        }
        h -= 5*INCHES;
    }
  }

  @Override
  protected void beginDraw(UI ui, PGraphics pg) {
    pg.pushMatrix();
    pg.translate(this.model.x, this.model.y, this.model.z);
  }

  @Override
  protected void onDraw(heronarts.p3lx.ui.UI ui, PGraphics pg) {
    LXEngine.Frame frame = ui.lx.getUIFrame();
    int[] colors = frame.getColors();
    pg.noStroke();

    pg.rotateY(this.model.azimuth);

    // start with a larger bend angle for the longest stem
    float bendAngle = 6;
    // 3 stems
    for (int i = 0; i < 3; ++i) {
        pg.pushMatrix();
        // 6 joints
        float angle = -PI/bendAngle;
        float k = 1.0;
        for (int j = 0; j < 6; j++) {
            LXPoint p = this.model;
            if (colors.length > p.index) {
                pg.fill(colors[p.index]);
            }
            //pg.fill(this.model.lightStems[this.stem].rgb);
            this.lightStems[i][j].onDraw(ui, pg);
            pg.translate(0.125*INCHES, this.lightStems[i][j].len, 0);
            angle *= k;
            k -= 1.0/6.0;
            pg.rotateX(angle);
        }
        pg.popMatrix();

        bendAngle += 1;

        if (i == 0) {
            pg.rotateY(PI/6);
        }
        if (i == 1) {
            pg.rotateY(-2*PI/6);
        }
    }
  }

  @Override
  protected void endDraw(UI ui, PGraphics pg) {
    pg.popMatrix();
  }

}

public class UILightStemSingle extends UILightStem {
  public static final float DIAMETER = 0.25*INCHES;
  public static final float HEIGHT = 49*INCHES;
  public static final int  DETAIL = 8;

  UILightStemSingle(LightStem model) {
    super(model);
    addChild(new UICylinder(DIAMETER/2, HEIGHT, DETAIL));
  }

  @Override
  protected void beginDraw(UI ui, PGraphics pg) {
    pg.pushMatrix();
    pg.translate(this.model.dx, this.model.dy, this.model.dz);
  }

  @Override
  protected void onDraw(heronarts.p3lx.ui.UI ui, PGraphics pg) {
    LXEngine.Frame frame = ui.lx.getUIFrame();
    int[] colors = frame.getColors();

    LXPoint p = this.model.getPoint();
    if (p.index < colors.length) {
        pg.fill(colors[p.index]);
    } 
    //pg.fill(this.model.lightStems[this.stem].rgb);
    pg.noStroke();
  }

  @Override
  protected void endDraw(UI ui, PGraphics pg) {
    pg.popMatrix();
  }
}


/*
 *         0     1
 *            3
 *       2
 *             4
 *          5     6
 */      

/*
 *         5     6
 *            2
 *       4    1
 *          3     7
 */      

public class UILightBase extends UI3dComponent {
  public static final float DIAMETER = 10.5*INCHES;
  public static final float HEIGHT = 3.5*INCHES;
 
  public final LXFixture model;

  UILightBase(LXFixture model) {
    this.model = model;
    addChild(new UICylinder(DIAMETER/2, HEIGHT, 5));
    int i = 0;
    for (LXPoint p : model.points) {
        addChild(new UILightStemSingle(new LightStem(this.model, p, i++, 0)));
    }
  }

  @Override
  protected void beginDraw(UI ui, PGraphics pg) {
    pg.pushMatrix();
    pg.translate((float)this.model.x.getValue(), (float)this.model.y.getValue(), (float)this.model.z.getValue());
  }

  @Override
  protected void onDraw(heronarts.p3lx.ui.UI ui, PGraphics pg) {
    pg.fill(#F01529);
    pg.noStroke();
  }

  @Override
  protected void endDraw(UI ui, PGraphics pg) {
    pg.popMatrix();
  }

}

/**
 * Utility class for drawing cylinders. Assumes the cylinder is oriented with the
 * y-axis vertical. Use transforms to position accordingly.
 */
public static class UICylinder extends UI3dComponent {
  
  private final PVector[] base;
  private final PVector[] top;
  private final int detail;
  public final float len;
  
  public UICylinder(float radius, float len, int detail) {
    this(radius, radius, 0, len, detail);
  }
  
  public UICylinder(float baseRadius, float topRadius, float len, int detail) {
    this(baseRadius, topRadius, 0, len, detail);
  }
  
  public UICylinder(float baseRadius, float topRadius, float yMin, float yMax, int detail) {
    this.base = new PVector[detail];
    this.top = new PVector[detail];
    this.detail = detail;
    this.len = yMax - yMin;
    for (int i = 0; i < detail; ++i) {
      float angle = i * TWO_PI / detail;
      this.base[i] = new PVector(baseRadius * cos(angle), yMin, baseRadius * sin(angle));
      this.top[i] = new PVector(topRadius * cos(angle), yMax, topRadius * sin(angle));
    }
  }
  
  public void onDraw(UI ui, PGraphics pg) {
    pg.beginShape(TRIANGLE_STRIP);
    for (int i = 0; i <= this.detail; ++i) {
      int ii = i % this.detail;
      pg.vertex(this.base[ii].x, this.base[ii].y, this.base[ii].z);
      pg.vertex(this.top[ii].x, this.top[ii].y, this.top[ii].z);
    }
    pg.endShape(CLOSE);
  }
}
