final static int DUST_FILL = #523D29;
final static int GROUND_SIZE = 300;

public class UIFloor extends UI3dComponent {

  private final PImage dust;
  private final PImage person;
  private final PImage stars;

  int numPointsW;
  int numPointsH_2pi; 
  int numPointsH;

  float[] coorX;
  float[] coorY;
  float[] coorZ;
  float[] multXZ;

  public UIFloor() {
    this.dust = loadImage("dust.png");
    this.person = loadImage("person.png");
    this.stars = loadImage("spacebg.jpg");

    initializeSphere (30, 30);  // set up for sky dome
}

  @Override
  protected void onDraw(heronarts.p3lx.ui.UI ui, PGraphics pg) {


    float level = 255;
    pg.pointLight(level, level, level, -80*FEET, 30*FEET, -80*FEET);
    pg.pointLight(level, level, level, 80*FEET, 30*FEET, 80*FEET);
    pg.pointLight(level, level, level, 0, 0, 30*FEET);
//    pg.ambientLight(255,255,255);
    
    //pg.perspective();
    //pg.perspective(PI/3.0, 4.0/3.0, 0, 10000);
    textureSphere(5000, 5000, 5000, this.stars, pg);
    
    pg.tint(DUST_FILL);
    pg.textureMode(NORMAL);
    pg.textureWrap(REPEAT);
    pg.beginShape();
    pg.texture(dust);

  // x,y,z,u,v
    pg.vertex(-GROUND_SIZE*FEET, 0, -GROUND_SIZE*FEET, 0, 0);
    pg.vertex(GROUND_SIZE*FEET, 0, -GROUND_SIZE*FEET, 0, 10);
    pg.vertex(GROUND_SIZE*FEET, 0, GROUND_SIZE*FEET, 10, 10);
    pg.vertex(-GROUND_SIZE*FEET, 0, GROUND_SIZE*FEET, 10, 0);
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
  
  void initializeSphere(int numPtsW, int numPtsH_2pi) {

    // The number of points around the width and height
    numPointsW=numPtsW+1;
    numPointsH_2pi=numPtsH_2pi;  // How many actual pts around the sphere (not just from top to bottom)
    numPointsH=ceil((float)numPointsH_2pi/2)+1;  // How many pts from top to bottom (abs(....) b/c of the possibility of an odd numPointsH_2pi)
  
    coorX=new float[numPointsW];   // All the x-coor in a horizontal circle radius 1
    coorY=new float[numPointsH];   // All the y-coor in a vertical circle radius 1
    coorZ=new float[numPointsW];   // All the z-coor in a horizontal circle radius 1
    multXZ=new float[numPointsH];  // The radius of each horizontal circle (that you will multiply with coorX and coorZ)
  
    for (int i=0; i<numPointsW ;i++) {  // For all the points around the width
      float thetaW=i*2*PI/(numPointsW-1);
      coorX[i]=sin(thetaW);
      coorZ[i]=cos(thetaW);
    }
    
    for (int i=0; i<numPointsH; i++) {  // For all points from top to bottom
      if (int(numPointsH_2pi/2) != (float)numPointsH_2pi/2 && i==numPointsH-1) {  // If the numPointsH_2pi is odd and it is at the last pt
        float thetaH=(i-1)*2*PI/(numPointsH_2pi);
        coorY[i]=cos(PI+thetaH); 
        multXZ[i]=0;
      } 
      else {
        //The numPointsH_2pi and 2 below allows there to be a flat bottom if the numPointsH is odd
        float thetaH=i*2*PI/(numPointsH_2pi);
  
        //PI+ below makes the top always the point instead of the bottom.
        coorY[i]=cos(PI+thetaH); 
        multXZ[i]=sin(thetaH);
      }
    }
  }

  void textureSphere(float rx, float ry, float rz, PImage t, PGraphics pg) { 
    // These are so we can map certain parts of the image on to the shape 
    float changeU=t.width/(float)(numPointsW-1)*3;    // added scaling factors 
    float changeV=t.height/(float)(numPointsH-1)*3;   // added scaling factors
    float u=0;  // Width variable for the texture
    float v=0;  // Height variable for the texture
  
    pg.beginShape(TRIANGLE_STRIP);
    pg.textureWrap(REPEAT);
    pg.textureMode(IMAGE);
    pg.pointLight(255,255,255,0,0,0);
    pg.texture(t);
    
    for (int i=0; i<(numPointsH-1); i++) {  // For all the rings but top and bottom
      // Goes into the array here instead of loop to save time
      float coory=coorY[i];
      float cooryPlus=coorY[i+1];
  
      float multxz=multXZ[i];
      float multxzPlus=multXZ[i+1];
  
      for (int j=0; j<numPointsW; j++) { // For all the pts in the ring
        pg.normal(-coorX[j]*multxz, -coory, -coorZ[j]*multxz);                    // normals point inward
        pg.vertex(coorX[j]*multxz*rx, coory*ry, coorZ[j]*multxz*rz, u, v);
        pg.normal(-coorX[j]*multxzPlus, -cooryPlus, -coorZ[j]*multxzPlus);        // normals point inward
        pg.vertex(coorX[j]*multxzPlus*rx, cooryPlus*ry, coorZ[j]*multxzPlus*rz, u, v+changeV);
        u+=changeU;
      }
      v+=changeV;
      u=0;
    }
    pg.endShape();
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
    if (fixture instanceof Field) {
        // TODO
    }
  }

  public void fixtureMoved(LXFixture fixture, int index) {
    if (fixture instanceof Field) {
        // TODO
    }
  }

  protected void beginDraw(UI ui, PGraphics pg) {
    float level = 255;
    pg.pointLight(level, level, level, -80*FEET, 30*FEET, -80*FEET);
    pg.pointLight(level, level, level, 80*FEET, 30*FEET, 80*FEET);
    pg.pointLight(level, level, level, 0, 0, 30*FEET);
//    pg.ambientLight(255,255,255);
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
    pg.translate(this.model.dx, this.model.dy, this.model.dz);
  }

  @Override
  protected void onDraw(heronarts.p3lx.ui.UI ui, PGraphics pg) {
    LXEngine.Frame frame = ui.lx.getUIFrame();
    int[] colors = frame.getColors();    
    LXPoint p = this.model.getPoint();

    if (p.index < colors.length) {
        pg.emissive(colors[p.index]);
        pg.fill(colors[p.index]);
        pg.emissive(0);
    } 

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
    pg.noStroke();
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
        pg.emissive(colors[p.index]);
        pg.fill(colors[p.index]);
        pg.emissive(0);
    } 
    pg.noStroke();
  }

  @Override
  protected void endDraw(UI ui, PGraphics pg) {
    pg.popMatrix();
  }
}


/*
 *         5     6
 *            2
 *       4    1
 *          3     7
 */      


//1: 57 in
//2: 60 in
//3: 47, 56, 61 inches
//4: 48, 58, 62 inches
//5: 49, 59, 63 inches
//6: 47, 56, 61 inches
//7: 48, 58, 62 inches

public class UILightBase extends UI3dComponent {
  public static final float DIAMETER = 10.5*INCHES;
  public static final float HEIGHT = 3.5*INCHES;
 
  public final LXFixture model;

  UILightBase(LXFixture model) {
    this.model = model;
    addChild(new UICylinder(DIAMETER/2, HEIGHT, 5));
    int i = 0;
    for (LXPoint p : model.points) {
      switch (i){
        case 0:
        case 1:
          addChild(new UILightStemSingle(new LightStem(this.model, p, i, 0)));
          break;
        case 2:
          addChild(new UILightStemTrio(new LightStem(this.model, p, i, -3*PI/4))); 
          break;
        case 3:
          addChild(new UILightStemTrio(new LightStem(this.model, p, i, -2*PI/4))); 
          break;
        case 4:
          addChild(new UILightStemTrio(new LightStem(this.model, p, i, -1*PI/4))); 
          break;
        case 5:
          addChild(new UILightStemTrio(new LightStem(this.model, p, i, 1*PI/4))); 
          break;
        case 6:
          addChild(new UILightStemTrio(new LightStem(this.model, p, i, 3*PI/4))); 
          break;
      }
      i++;
    }
  }

  @Override
  protected void beginDraw(UI ui, PGraphics pg) {
    pg.pushMatrix();
    pg.translate((float)this.model.x.getValue(), (float)this.model.y.getValue(), (float)this.model.z.getValue());
  }

  @Override
  protected void onDraw(heronarts.p3lx.ui.UI ui, PGraphics pg) {
    pg.fill(#101010);
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
    pg.beginShape(QUAD_STRIP);
    for (int i = 0; i <= this.detail; ++i) {
      int ii = i % detail;
      pg.vertex(this.base[ii].x, this.base[ii].y, this.base[ii].z);
      pg.vertex(this.top[ii].x, this.top[ii].y, this.top[ii].z);
    }
    pg.endShape();
    
    // now draw the top cap
    pg.beginShape(TRIANGLE_FAN);
    pg.vertex(0,this.top[0].y, 0);
    for (int i=0; i<= this.detail; ++i) {
      int ii = i % detail;
      pg.vertex(this.top[ii].x, this.top[ii].y, this.top[ii].z);
    }
    pg.endShape();
  }
}
