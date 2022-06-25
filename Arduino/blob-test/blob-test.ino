#include "FastLED.h"
#include "lib8tion.h"

#define NUM_LEDS 73
CRGB leds[NUM_LEDS];
#define PIN 7

char dataString[50] = {0};

float v[10]; // velocity
float p[10]; // position
int hues[10]; // color

void initBlobs()
{
  for (int i=0; i<10; i++)
  {
    v[i] = (((float)random(100) / 100.0) - 0.5) / 500.0;
    p[i] = (float)random(100) / 100.0;
    hues[i] = random(255);
  }
}

void updateBlobs()
{
  setAll(0,0,0);
  for (int i=0; i<10; i++)
  {
    p[i] = p[i] + v[i];
    if (p[i] > 1.0) p[i] -= 1.0;
    if (p[i] < 0) p[i] += 1.0;
    float pos = p[i] * (float)NUM_LEDS;
    //Serial.println(pos);
    int n = floor(pos);
    float frac = pos - (float)n;
    int dim = frac * 256.0;
    //Serial.println (dim);
    leds[n] = CHSV (hues[i], 0xff, 256-dim);
    if (n+1 < NUM_LEDS)
      leds[n+1] = CHSV (hues[i], 0xff, dim);;
  }
}

void setup()
{
  Serial.begin(9600);
  randomSeed(analogRead(0));
  FastLED.addLeds<WS2813, PIN, RGB>(leds, NUM_LEDS).setCorrection( TypicalLEDStrip );
  initBlobs();
}
  
void loop() {
  updateBlobs();
  FastLED.show();
}

void showStrip() {
   FastLED.show();
}

void setPixel(int Pixel, byte red, byte green, byte blue) {
   leds[Pixel].r = red;
   leds[Pixel].g = green;
   leds[Pixel].b = blue;
}

void setAll(byte red, byte green, byte blue) {
  for(int i = 0; i < NUM_LEDS; i++ ) {
    setPixel(i, red, green, blue);
  }
  showStrip();
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
     
      showStrip();
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
     
      showStrip();
      delay(SpeedDelay);
    }
  }
}

void fadeToBlack(int ledNo, byte fadeValue) {
   leds[ledNo].fadeToBlackBy( fadeValue );
}
