#include "FastLED.h"
#include "lib8tion.h"

#define NUM_LEDS 364
CRGBArray<NUM_LEDS> leds;
CRGBArray<NUM_LEDS> from;
CRGBArray<NUM_LEDS> to;

#define PIN 4
#define SENSOR_PIN1 5
#define SENSOR_PIN2 9

DEFINE_GRADIENT_PALETTE( magenta_pink_gp ) {
  0,    0xF0,  0x93,  0xF9,
100,     0xE7,  0x2C,  0xF6,
200,     0xE7,  0x2C,  0x47,
255,    0xF0,  0xFE,  0xA6};

CRGB emotionColors[4];

CRGBPalette16 currentPalette = magenta_pink_gp;

char dataString[50] = {0};
uint16_t oldtime = millis();
uint16_t ntime = 0;
volatile bool triggerEnter = false;
volatile bool triggerExit = false;
byte state = 0;
int loopCounter = 0;
int cooldownTimer = 0;
int pulseCount = 0;

static uint16_t x;
static uint16_t z;

uint16_t speed = 2; // speed is set dynamically once we've started up
uint16_t scale = 6; // scale is set dynamically once we've started up
uint8_t noise[NUM_LEDS];
uint8_t       colorLoop = 1;

void setup()
{
  Serial.begin(115200);              //Starting serial communication
  FastLED.addLeds<WS2813, PIN, RGB>(leds, NUM_LEDS).setCorrection( TypicalLEDStrip );
  fill_solid(leds,leds.size(), CRGB::Black);
  pinMode(SENSOR_PIN1, INPUT);
  pinMode(SENSOR_PIN2, INPUT);
  attachInterrupt(digitalPinToInterrupt(SENSOR_PIN1), triggerEnterISR, FALLING);
  attachInterrupt(digitalPinToInterrupt(SENSOR_PIN2), triggerExitISR, FALLING);

  x = random16();
  z = random16();

  emotionColors[0] = CRGB(255, 222, 0);
  emotionColors[1] = CRGB(0, 65, 255);
  emotionColors[2] = CRGB(219, 7, 0);
  emotionColors[3] = CRGB(69, 255, 104);
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
  x += speed / 8;
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
      if( bri > 127 ) {
        bri = 255;
      } else {
        bri = dim8_raw( bri * 2);
      }

      CRGB color = ColorFromPalette( currentPalette, index, bri);
      leds[i] = color;
    }
  
  ihue+=1;
}

void triggerEnterISR() {
  // don't trigger if we're in a cool off period
  if (cooldownTimer <= 0)
    triggerEnter = true;
}

void triggerExitISR() {
  // don't trigger if we're in a cool off period
  if (cooldownTimer <= 0)
    triggerExit = true;
}

// we have a few basic states
// 0 == basic noise function
// 1 == someone entered through; trigger sound and pulse light
// 2 == someone exited throgh; trigger sound and pulse light
// 3 == reset back to noise function

void loop() {
  uint16_t t = millis();
  uint16_t dt = t - oldtime;
  oldtime = t;
  if (cooldownTimer > 0)
  {
    cooldownTimer -= dt;
  }
  
  if (state == 0)
  {
    CRGB emotion = emotionColors[random(4)];
    if (pulseCount > 0)
    {
      // start another pulse
      state = 1;

      for (int i=0; i<NUM_LEDS; i++)
      {
        from[i] = leds[i];
        to[i] = emotion;
      }
      return;
    }
    
    if (triggerEnter)
    {
      // someone passed through...
      triggerEnter = false;
      pulseCount = 1;
      state = 1;

      for (int i=0; i<NUM_LEDS; i++)
      {
        from[i] = leds[i];
        to[i] = emotion;
      }
      Serial.println("enter");           
      // send message about state change
      return;
    } else if (triggerExit)
    {
      // someone exited
      triggerExit = false;
      state = 1;

      for (int i=0; i<NUM_LEDS; i++)
      {
        from[i] = leds[i];
        to[i] = CRGB::Red;
      }
      Serial.println("exit");           
      // send message about state change
      return;
    }

    // othrewise continue processing noise function
    ntime += dt / 5;
    fillnoise8();
    mapNoiseToLEDsUsingPalette();
    FastLED.show();
  }
  else if (state == 1)  // doing a pulse effect
  {
    // do the pulse
    if (loopCounter < 5)
    {
      blend(from, to, leds, NUM_LEDS, loopCounter*50);
      FastLED.show();
      loopCounter++;
    }
    else
    {
      // we're done with the pulse
      loopCounter = 0;
      state = 2;
      for (int i=0; i<NUM_LEDS; i++)
      {
        to[i] = from[i];
        from[i] = leds[i];
      }
    }
  }
  else if (state == 2)
  {
    // now reset back to normal
    if (loopCounter < 128)
    {
      blend(from, to, leds, NUM_LEDS, loopCounter*2);
      FastLED.show();
      loopCounter++;
    }
    else
    {
      // we're done restoring; back to normal state
      oldtime = millis(); // as if no time had passed
      state = 0; // go back to resting state
      loopCounter = 0;
      cooldownTimer = 3000;  // don't let gate trigger again for 3 seconds;
      triggerEnter = false;
      triggerExit = false;
      pulseCount--;
    }
  }
       
  if (Serial.available() > 0) {
    String data = Serial.readStringUntil('\n');
  }
}
