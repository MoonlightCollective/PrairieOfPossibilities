#include "FastLED.h"
#include "lib8tion.h"

#define NUM_LEDS 10
CRGBArray<NUM_LEDS> leds;
CRGBArray<NUM_LEDS> from;
CRGBArray<NUM_LEDS> to;

#define LEDPIN 4
#define ROT1 10
#define ROT2 9
#define ROTBUTTON 7

DEFINE_GRADIENT_PALETTE( magenta_pink_gp ) {
  0,    0xF0,  0x93,  0xF9,
100,     0xE7,  0x2C,  0xF6,
200,     0xE7,  0x2C,  0x47,
255,    0xF0,  0xFE,  0xA6};

// CRGBPalette16 currentPalette = magenta_pink_gp;
CRGBPalette16 currentPalette = Rainbow_gp;

char dataString[50] = {0};
uint16_t oldtime = millis();
uint16_t ntime = 0;

static uint16_t x;
static uint16_t z;

uint16_t speed = 1; // speed is set dynamically once we've started up
uint16_t scale = 10; // scale is set dynamically once we've started up
uint8_t noise[NUM_LEDS];
uint8_t       colorLoop = 1;
int cooldownTimer = 0;

// SimpleRotary rotary(10,9,7);
int brightness;
bool onoff;

volatile bool _Push = false;
volatile int _Delta = 0;

void setup()
{
  Serial.begin(9600);              //Starting serial communication
  FastLED.addLeds<WS2812, LEDPIN, RGB>(leds, NUM_LEDS).setCorrection( TypicalLEDStrip );
  FastLED.setBrightness(255);
  fill_solid(leds,leds.size(), CRGB::Black);
 
  x = random16();
  z = random16();

  pinMode(ROT1, INPUT_PULLUP);
  pinMode(ROT2, INPUT_PULLUP);
  pinMode(ROTBUTTON, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(ROT1), triggerRot, FALLING);
  attachInterrupt(digitalPinToInterrupt(ROTBUTTON), triggerPush, FALLING);

  brightness=255;
  onoff=true;
}

void triggerRot() {
  // don't trigger if we're in a cool off period
  if (cooldownTimer <= 0)
  {
    // read Rot2; if Rot2 is also low, one direction; if it's high, the other direction
    bool rot2 = digitalRead(ROT2);
    if (rot2)
    {
      _Delta = -20;
    }
    else
    {
      _Delta = 20;
    }
    cooldownTimer = 100;
  }
}

void triggerPush() {
  if (cooldownTimer <= 0)
    _Push = true;
    cooldownTimer = 100;
}

// Fill the x/y array of 8-bit noise values using the inoise8 function.
void fillnoise8() {
  // If we're runing at a low "speed", some 8-bit artifacts become visible
  // from frame-to-frame.  In order to reduce this, we can do some fast data-smoothing.
  // The amount of data smoothing we're doing depends on "speed".
  uint8_t dataSmoothing = 0;
  if( speed < 50) {
    dataSmoothing = 200 - (speed * 4);
  }
  
  for(int i = 0; i < NUM_LEDS; i++) {
    int ioffset = scale * i;
      
      uint8_t data = inoise8(x + ioffset,z);

      // The range of the inoise8 function is roughly 16-238.
      // These two operations expand those values out to roughly 0..255
      // You can comment them out if you want the raw noise data.
      data = qsub8(data,16);
      data = qadd8(data,scale8(data,39));

      if( dataSmoothing ) {
        uint8_t olddata = noise[i];
        uint8_t newdata = scale8( olddata, dataSmoothing) + scale8( data, 256 - dataSmoothing);
        data = newdata;
      }
      
      noise[i] = data;
  }
  
  z += speed;
  
  // apply slow drift to X and Y, just for visual variation.
  // x += speed / 8;
}

void mapNoiseToLEDsUsingPalette()
{
  static uint8_t ihue=0;
  
  for(int i = 0; i < NUM_LEDS; i++) {
      // We use the value at the (i) coordinate in the noise
      // array for our brightness, and the flipped value from (i)
      // for our pixel's index into the color palette.

      uint8_t index = noise[i];
      uint8_t bri =   noise[NUM_LEDS-i-1];

      // if this palette is a 'loop', add a slowly-changing base value
      if( colorLoop) { 
        index += ihue;
      }

      // brighten up, as the color palette itself often contains the 
      // light/dark dynamic range desired
//      if( bri > 127 ) {
//        bri = 255;
//      } else {
//        bri = dim8_raw( bri * 2);
//      }
      bri = dim8_raw(bri);

      CRGB color = ColorFromPalette( currentPalette, index, bri);
      uint8_t offset = i % 2; // will be either 0 or 1 depending if even or odd
      uint8_t num = i / 2;

//      if (offset == 0) {
//        leds[num] = color;
//      } else {
//        leds[NUM_LEDS-num-1] = color;
//      }
     leds[i] = color;
    }
  
  ihue+=1;
}

void loop() {
  uint16_t t = millis();
  uint16_t dt = t - oldtime;
  ntime += dt / 5;
  oldtime = t;

  if (cooldownTimer > 0)
  {
    cooldownTimer -= dt;
  }

  if (_Delta != 0)
  {
    brightness += _Delta;
    _Delta = 0;
    brightness = max(0, min(brightness, 255));  // clamp between 0 and 255
    Serial.print("Bright ");
    Serial.println(brightness);
  } else if (_Push)
  {
    onoff = !onoff;
    _Push = false;
    Serial.println("Push");
  }

  if (!onoff)
  {
    FastLED.setBrightness(0);
  }
  else
  {
    FastLED.setBrightness(brightness);
  }

  fillnoise8();
  mapNoiseToLEDsUsingPalette();
  FastLED.show();
  FastLED.delay(100);       
}