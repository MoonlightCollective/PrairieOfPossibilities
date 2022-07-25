#include "FastLED.h"
#include "lib8tion.h"

#define NUM_LEDS 364

DEFINE_GRADIENT_PALETTE( sunset_gp ) {
  0,     255,  0,  0,   //magenta
255,   0,  0,  255 };   //violet

CRGBArray<NUM_LEDS> leds;
#define PIN 4

char dataString[50] = {0};
int a =0;
float t=0; 

//CRGBPalette16 myPal = blob_gp;
CRGBPalette16 myPal = CloudColors_p;
//CRGBPalette16 myPal = ForestColors_p; 
//CRGBPalette16 myPal = LavaColors_p; 
//CRGBPalette16 myPal = Rainbow_gp ; 

CRGBSet top(leds(140,220));
CRGBSet side1(leds(0,139));
CRGBSet side2(leds(221,NUM_LEDS-1));

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
}
  
void loop() {
  uint8_t level = 64 + (quadwave8(t) / 3);
  t = t + 0.1;
  if (t > 255.0) t -= 255.0;
  float x = 5.0 * t;
  uint8_t index = (uint8_t)x;

  fill_solid(top, top.size(), ColorFromPalette(myPal, index));
  fill_palette_circular(side1, side1.size(), index, myPal,64,LINEARBLEND,false);
  fill_palette_circular(side2, side2.size(), index, myPal,64,LINEARBLEND,true);
  
  FastLED.show();
   
  if (Serial.available() > 0) {
    String data = Serial.readStringUntil('\n');
    flashPortal(200);
//    if (data == "forward")
//      meteorRain(0x24,0x32,0xff, 10, 64, true, 2, true);
//    else if (data == "backward")
//      meteorRain(0xFF, 0x63, 0x78, 10, 64, true, 2, false);
  }
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
  for (int k=0; k<3; k++)
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
