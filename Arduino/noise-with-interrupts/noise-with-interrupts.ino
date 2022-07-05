#include "FastLED.h"
#include "lib8tion.h"

#define NUM_LEDS 364
CRGBArray<NUM_LEDS> leds;
CRGBArray<NUM_LEDS> from;
CRGBArray<NUM_LEDS> to;

#define PIN 4
#define SENSOR_PIN1 5
#define SENSOR_PIN2 9


char dataString[50] = {0};
uint16_t oldtime = millis();
uint16_t ntime = 0;
volatile bool triggerEnter = false;
volatile bool triggerExit = false;
byte state = 0;
int loopCounter = 0;
int cooldownTimer = 0;
int pulseCount = 0;

void setup()
{
  Serial.begin(115200);              //Starting serial communication
  FastLED.addLeds<WS2813, PIN, RGB>(leds, NUM_LEDS).setCorrection( TypicalLEDStrip );
  fill_solid(leds,leds.size(), CRGB::Black);
  pinMode(SENSOR_PIN1, INPUT);
  pinMode(SENSOR_PIN2, INPUT);
  attachInterrupt(digitalPinToInterrupt(SENSOR_PIN1), triggerEnterISR, FALLING);
  attachInterrupt(digitalPinToInterrupt(SENSOR_PIN2), triggerExitISR, FALLING);
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
    if (pulseCount > 0)
    {
      // start another pulse
      state = 1;

      for (int i=0; i<NUM_LEDS; i++)
      {
        from[i] = leds[i];
        to[i] = CRGB::White;
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
        to[i] = CRGB::White;
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
    fill_noise16 (leds, NUM_LEDS/2, 1, 0, 100, 1, 1, 6, ntime, 5);
    for (int i=0; i<NUM_LEDS/2; i++)
    {
      leds[NUM_LEDS-i-1] = leds[i];
    }
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
