#include "FastLED.h"
#include "lib8tion.h"

#define NUM_LEDS 368

CRGB leds[NUM_LEDS];
#define PIN 7

char dataString[50] = {0};
int a =0;
float t=0; 

void setup()
{
  Serial.begin(9600);              //Starting serial communication
  FastLED.addLeds<WS2813, PIN, RGB>(leds, NUM_LEDS).setCorrection( TypicalLEDStrip );
}
  
void loop() {
//  meteorRain(0x24,0x32,0xff, 10, 64, true, 2, true);
//  meteorRain(0xFF,0x63,0x78, 10, 64, true, 2, false);
  uint8_t level = 64 + (quadwave8(t) / 3);
  t = t + 0.1;
  if (t > 255) t=0;
  
  for (int i=0; i<NUM_LEDS; i++)
  {
    CRGB col = CHSV ((int)t, 0xff, 0xff);
    setPixel(i, col.r, col.g, col.b);
  }
  FastLED.show();
   
  if (Serial.available() > 0) {
    String data = Serial.readStringUntil('\n');
    triggerPortal(20);
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
