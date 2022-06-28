#include "FastLED.h"
#include "lib8tion.h"

#define NUM_LEDS 368

DEFINE_GRADIENT_PALETTE( sunset_gp ) {
  0,     255,  0,  0,   //magenta
255,   0,  0,  255 };   //violet

DEFINE_GRADIENT_PALETTE( blob_gp ) {
  0,     0,  0,  64,
  128,     255,  0,  255,
255,   0,  0,  64 };



CRGBArray<NUM_LEDS> leds;
#define PIN 4

char dataString[50] = {0};
int a =0;
float t=0;
float timer = 0; 

//CRGBPalette16 myPal = blob_gp;
//CRGBPalette16 myPal = CloudColors_p;
CRGBPalette16 myPal = ForestColors_p; 
//CRGBPalette16 myPal = LavaColors_p; 
//CRGBPalette16 myPal = Rainbow_gp ; 
CRGBSet top(leds(140,220));
CRGBSet side1(leds(0,139));
CRGBSet side2(leds(221,NUM_LEDS-1));

int lengths[10]; // blob lengths
float p[10]; // position of each blob
int colors[10]; // blob colors

void initBlobs()
{
  for (int i=0; i<10; i++)
  {
    removeBlob(i);
  }
}

int findEmptyBlob()
{
  // find first empty blob
  for (int i=0; i<10; i++)
  {
    if (p[i] == -1)
    {
      return i;
    }
  }
  return -1; 
}

int addBlob()
{
  int i = findEmptyBlob();
  if (i >= 0)
  {
//    lengths[i] = random(30) + 5;
    lengths[i] = 2;
    p[i] = 0;
    colors[i] = random(255);
    return lengths[i];
  }
  else
    return 0;
}

void removeBlob(int i)
{
  p[i] = -1;
  lengths[i] = 0;
}

void updateBlobs(float dt)
{
  timer -= dt;
  if (timer <= 0)
  {
    timer = 10 + addBlob();
  }
  
  for (int i=0; i<10; i++)
  {
    // draw each blob
    if (p[i] >= 0)
    {
      // active blob
      p[i] += dt * 32.0;      // increment position
      int pos = p[i] / 16;
      uint8_t frac = int(p[i]) & 0x0F;
      uint8_t firstpixelbrightness = (frac * 16);
      uint8_t lastpixelbrightness  = 255 - firstpixelbrightness;
      
      if (pos - lengths[i] >= NUM_LEDS/2)
      {
        removeBlob(i);
      }
      else
      {
        for (int j=0; j<=lengths[i]; j++)
        {
          uint8_t bright;
          int n = pos - j;
          if (n >= 0 && n < NUM_LEDS/2)
          {
            if (j==0)
            {
              bright = firstpixelbrightness;
            } else if (j==lengths[i]) {
              bright = lastpixelbrightness;
            } else {
              bright = 128;
            }
// leds[n] = ColorFromPalette(myPal, j * 255.0 / lengths[i] );
//            leds[NUM_LEDS/2 - n - 1] = ColorFromPalette(myPal, 0);
//            leds[NUM_LEDS/2 + n] = ColorFromPalette(myPal, 0);
            leds[NUM_LEDS/2 - n - 1] = ColorFromPalette(myPal, colors[i], bright);
            leds[NUM_LEDS/2 + n] = ColorFromPalette(myPal, colors[i], bright);
          }
        }
      }
    }
  }
}

void fill_palette_circular(CRGB* L, uint16_t N, uint8_t startIndex,
                           const CRGBPalette16& pal, uint8_t brightness=255, TBlendType blendType=LINEARBLEND,
                           bool reversed=false)
{
    if (N == 0) return;  // avoiding div/0

    const uint16_t colorChange = 65535 / N;              // color change for each LED, * 256 for precision
    uint16_t colorIndex = ((uint16_t) startIndex) << 8;  // offset for color index, with precision (*256)
 
   for (uint16_t i = 0; i < N; ++i) {
        L[i] = ColorFromPalette(pal, (colorIndex >> 8), brightness, blendType);
        if (reversed) colorIndex -= colorChange;
        else colorIndex += colorChange;
    }
}

void setup()
{
  Serial.begin(9600);              //Starting serial communication
  FastLED.addLeds<WS2813, PIN, RGB>(leds, NUM_LEDS).setCorrection( TypicalLEDStrip );
  fill_solid(leds,leds.size(), CRGB::Black);
  initBlobs();
}
  
void loop() {
  t = t + 0.2;
  if (t > 255.0) t -= 255.0;

  fill_solid(leds,leds.size(), CRGB(0,0,0));
  updateBlobs(0.3);
  FastLED.show();
   
  if (Serial.available() > 0) {
    String data = Serial.readStringUntil('\n');
    flashPortal(200);
//    if (data == "forward")
//      meteorRain(0x24,0x32,0xff, 10, 64, true, 2, true);
//    else if (data == "backward")
//      meteorRain(0xFF, 0x63, 0x78, 10, 64, true, 2, false);
  }
  delay(0.1);
}

void setPixel(int Pixel, byte red, byte green, byte blue) {
  if (Pixel >= 0 && Pixel < NUM_LEDS)
  {
    leds[Pixel].r = red;
    leds[Pixel].g = green;
    leds[Pixel].b = blue;
  }
}

void setAll(byte red, byte green, byte blue) {
  for(int i = 0; i < NUM_LEDS; i++ ) {
    setPixel(i, red, green, blue);
  }
   FastLED.show();
}

void flashPortal(int delayTime)
{
  for (int i=0; i<10; i++)
  {
    for (int j=0; j<NUM_LEDS; j++)
    {
      leds[j] += CRGB(32,32,32);
    }
    FastLED.show();
  }
  delay(delayTime);
  for (int i=0; i<25; i++)
  {
    leds.fadeToBlackBy(10);
    FastLED.show();
  }
}

void triggerPortal(int size)
{
  CRGB restoreColor = leds[0];
  int mid = NUM_LEDS/2; // = 184 because 368 pixels

  for (int i=0; i < mid+size; i++)
  {
    int posL = mid - i - 1;
    int posR = mid + i;
    setPixel(posL, 0, 0, 0);
    setPixel(posR, 0, 0, 0);
    if (posL + size < mid)
    {
      leds[posL + size] = restoreColor;
    }
    if (posR - size >= mid)
    {
      leds[posR - size] = restoreColor;
    }
    FastLED.show();
  }
}

void meteorRain(byte red, byte green, byte blue, byte meteorSize, byte meteorTrailDecay, boolean meteorRandomDecay, int SpeedDelay, boolean forward) {  
  setAll(0,0,0);

  if (forward)
  {
    for(int i = 0; i < NUM_LEDS+NUM_LEDS; i++) {
     
     
      // fade brightness all LEDs one step
      for(int j=0; j<NUM_LEDS; j++) {
        if( (!meteorRandomDecay) || (random(10)>5) ) {
          fadeToBlack(j, meteorTrailDecay );        
        }
      }
     
      // draw meteor
      for(int j = 0; j < meteorSize; j++) {
        if( ( i-j <NUM_LEDS) && (i-j>=0) ) {
          setPixel(i-j, red, green, blue);
        }
      }
     
      FastLED.show();
      delay(SpeedDelay);
    }
  }
  else
  {
    for(int i = NUM_LEDS-1; i > -NUM_LEDS; i--) {
     
     
      // fade brightness all LEDs one step
      for(int j=0; j<NUM_LEDS; j++) {
        if( (!meteorRandomDecay) || (random(10)>5) ) {
          fadeToBlack(j, meteorTrailDecay );        
        }
      }
     
      // draw meteor
      for(int j = 0; j < meteorSize; j++) {
        if( ( i+j < NUM_LEDS) && (i+j>=0) ) {
          setPixel(i+j, red, green, blue);
        }
      }
     
      FastLED.show();
      delay(SpeedDelay);
    }
  }
}

void fadeToBlack(int ledNo, byte fadeValue) {
   leds[ledNo].fadeToBlackBy( fadeValue );
}
