/** 
 * By using LX Studio, you agree to the terms of the LX Studio Software
 * License and Distribution Agreement, available at: http://lx.studio/license
 *
 * Please note that the LX license is not open-source. The license
 * allows for free, non-commercial use.
 *
 * HERON ARTS MAKES NO WARRANTY, EXPRESS, IMPLIED, STATUTORY, OR
 * OTHERWISE, AND SPECIFICALLY DISCLAIMS ANY WARRANTY OF
 * MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR A PARTICULAR
 * PURPOSE, WITH RESPECT TO THE SOFTWARE.
 */

// ---------------------------------------------------------------------------
//
// Welcome to LX Studio! Getting started is easy...
// 
// (1) Quickly scan this file
// (2) Move on to "Patterns" to write your animations
// 
// ---------------------------------------------------------------------------

// Our engine and our model
heronarts.lx.studio.LXStudio lx;
processing.core.PApplet applet;

Field field;

final static String FIXTURES_FILE = "LightFieldWithBases-1.json";

void setup() {

  size(1200, 960, P3D);

  heronarts.lx.studio.LXStudio.Flags flags = new heronarts.lx.studio.LXStudio.Flags(this);
  flags.useGLPointCloud = true;
  flags.startMultiThreaded = true;
  flags.resizable = true;
  applet = this;
  lx = new heronarts.lx.studio.LXStudio(this, flags);

}

void initialize(LX lx) {
  // Add custom components or output drivers here
}

void initializeUI(final heronarts.lx.studio.LXStudio lx, heronarts.lx.studio.LXStudio.UI ui) {
  // Modify the UI theme if you like
}

void onUIReady(heronarts.lx.studio.LXStudio lx, heronarts.lx.studio.LXStudio.UI ui) {

  field = buildField(lx);

  ui.preview.setRadius(80*FEET).setPhi(-PI/18).setTheta(PI/12);
  ui.preview.setCenter(0, 0, 0);

  // Narrow angle lens, for a fuller visualization
  ui.preview.perspective.setValue(30);

  // add the main simulation
  ui.preview.addComponent(new UISimulation(field));

/*
  // Add custom UI components here
  ui.preview.addComponent(new UI3dComponent() {
    public void onDraw(UI ui, PGraphics pg) {
      LXEngine.Frame frame = ui.lx.getUIFrame();
      int[] colors = frame.getColors();
      for (LXPoint p : frame.getModel().points) {
        pg.stroke(colors[p.index]);
        pg.fill(colors[p.index]);
        pg.beginShape();
        pg.curveVertex(p.x, p.y, p.z);
        pg.curveVertex(p.x, p.y+30, p.z);
        pg.curveVertex(p.x, p.y+60, p.z+20);
        pg.curveVertex(p.x, p.y+90, p.z+40);
        pg.endShape();
      }
    }
  });*/
}


void draw() {
  // Nothing needs to happen here, this method just needs to exist for Processing
  // to run a draw loop. You should not need to do anything here.
}

// Helpful global constants
final static float INCHES = 1;
final static float IN = INCHES;
final static float FEET = 12 * INCHES;
final static float FT = FEET;
final static float CM = IN / 2.54;
final static float MM = CM * .1;
final static float M = CM * 100;
final static float METER = M;
