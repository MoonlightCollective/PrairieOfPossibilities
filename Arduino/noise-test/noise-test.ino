#include "FastLED.h"
#include "lib8tion.h"

#define NUM_LEDS 368
CRGBArray<NUM_LEDS> leds;
#define PIN 4

char dataString[50] = {0};
int a =0;

void setup()
{
  Serial.begin(9600);              //Starting serial communication
  FastLED.addLeds<WS2813, PIN, RGB>(leds, NUM_LEDS).setCorrection( TypicalLEDStrip );
  fill_solid(leds,leds.size(), CRGB::Black);
}
  
void loop() {
  uint8_t octaves = 1;
  uint16_t x = 0;
  int scale = 100;
  uint8_t hue_octaves = 2;
  uint16_t hue_x = 1;
  int hue_scale = 10;
  uint16_t ntime = millis() / 5;
  uint8_t hue_shift = 5;
  
  fill_noise16 (leds, NUM_LEDS/2, octaves, x, scale, hue_octaves, hue_x, hue_scale, ntime, hue_shift);
  for (int i=0; i<NUM_LEDS/2; i++)
  {
    leds[NUM_LEDS/2 + i] = leds[i];
  }
//  fill_noise8 (leds, NUM_LEDS, octaves, x, scale, hue_octaves, hue_x, hue_scale, ntime);
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
    leds[posL] = CRGB(0,0,0);
    leds[posR] = CRGB(0,0,0);
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
