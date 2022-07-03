#include "FastLED.h"
#include "lib8tion.h"

#define NUM_LEDS 364

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
  
void loop()
{
  fill_solid(leds,leds.size(), CRGB::Black);
  int height=0;
  int length = 4;
  while (height < NUM_LEDS/2)  
  {
    // make each blob "fall" from the top to its place at the bottom
    // one LED starts at (NUM_LEDS/2)-1; the other starts at NUM_LEDS/2
    // they fall down until they reach their spot: i and NUM_LEDS-i
    int start_pos=(NUM_LEDS/2)-1;
    int pos = start_pos;
    int pos2 = start_pos+1;
    
    unsigned long start_time = millis();
    while (pos > height)
    {
      leds(pos,pos+length) = CRGB(255,255,255);
      leds(pos2-length,pos2) = CRGB(255,255,255);
      FastLED.show();

      int dt = millis() - start_time;
      leds(pos,pos+length) = CRGB(0,0,0);
      leds(pos2-length,pos2) = CRGB(0,0,0);

      int delta = floor(0.5 * 0.001 * dt * dt); // 1/2 * a * t^2 --- high school physics
      pos = start_pos - delta;
      pos2 = start_pos + 1 + delta;
      delay(1);
    }
    // light up the final stack
    leds(height,height+length) = CRGB(255,255,255);
    leds(NUM_LEDS-length-height-1,NUM_LEDS-height-1) = CRGB(255,255,255);
    height += length;
  }


  // now we need to drain all the lights back out...
  int start_pos=(NUM_LEDS/2)-1;
  int pos = start_pos;
  int pos2 = start_pos+1;

  // meaningful pause....
  delay(2000);
  unsigned long start_time = millis();
  while (pos > 0)
  {
    for (int i=pos; i<=start_pos; i++)
    {
      leds[i] = CRGB::Black;
      leds[NUM_LEDS-i-1] = CRGB::Black;
    }
    FastLED.show();

    int dt = millis() - start_time;
    int delta = floor(0.5 * 0.0005 * dt * dt); // 1/2 * a * t^2 --- high school physics
    pos = start_pos - delta;
    pos2 = start_pos + 1 + delta;
    delay(1);
  }

  // meaningful pause....
  fill_solid(leds,leds.size(), CRGB::Black);
  FastLED.show();
  delay(2000);

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
