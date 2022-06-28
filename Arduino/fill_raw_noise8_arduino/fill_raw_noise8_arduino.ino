#include <Regexp.h>
#include <FastLED.h>

#define NUM_LEDS 368
#define LED_PIN 4

const uint8_t noiseDataSize = NUM_LEDS/2;
uint8_t noiseData[noiseDataSize];
String strOutput;
const uint8_t chrInputSize = 20;
char chrInput[chrInputSize];
char chrTemp[chrInputSize];
bool newData = false;
bool showOutput = true;
MatchState ms;

uint8_t octaveVal = 1;
uint16_t xVal = 0;
int scaleVal = 10;
uint16_t timeVal = 0;

CRGB leds[NUM_LEDS];

CRGBPalette16 party = PartyColors_p;

void setup() {
  FastLED.addLeds<WS2813, LED_PIN, RGB>(leds, NUM_LEDS);
  FastLED.setBrightness(100);
  Serial.begin(115200);
}

void loop() {
  
  EVERY_N_MILLISECONDS(33){
    memset(noiseData,0,noiseDataSize);
    fill_raw_noise8(noiseData, noiseDataSize, octaveVal, xVal, scaleVal, timeVal);
    printOutputData();
  }

  // Check for new Serial data
  recvWithStartEndMarkers();
  if (newData == true) {
    strcpy(chrTemp, chrInput);
    
    // Check that the data is not malformed, can happen when
    // settings are changed too quickly
    ms.Target(chrTemp);
    char regexResult = ms.Match("%d+,%d+,%d+,%d+");
    if (regexResult == REGEXP_MATCHED) {
      parseInputData();
    }
    
    newData = false;
  }

  // Throw data onto LEDs
  if(showOutput) {
    for (int i = 0; i < NUM_LEDS/2; i++) {
      leds[i*2] = ColorFromPalette(party, noiseData[i], noiseData[NUM_LEDS/2 - i - 1]);
      leds[i*2 + 1] = leds[i*2];
    }
  }
  
  FastLED.show();
}

void recvWithStartEndMarkers() {
  
  static boolean recvInProgress = false;
  static byte ndx = 0;
  char startMarker = '<';
  char endMarker = '>';
  char rc;

  while (Serial.available() > 0 && newData == false) {
    rc = Serial.read();

    if (recvInProgress == true) {
      if (rc != endMarker) {
        chrInput[ndx] = rc;
        ndx++;
        if (ndx >= chrInputSize) {
          ndx = chrInputSize - 1;
        }
      }
      else {
        chrInput[ndx] = '\0'; // terminate the string
        recvInProgress = false;
        ndx = 0;
        newData = true;
      }
    }

    else if (rc == startMarker) {
        recvInProgress = true;
    }
  }
}

void parseInputData() {

  char * strtokIndx;
  
  strtokIndx = strtok(chrTemp,",");
  xVal = atoi(strtokIndx);

  strtokIndx = strtok(NULL, ",");
  scaleVal = atoi(strtokIndx);

  strtokIndx = strtok(NULL, ",");
  octaveVal = atoi(strtokIndx);

  strtokIndx = strtok(NULL, ",");
  timeVal = atoi(strtokIndx);
}

void printOutputData() {

  // Data is sometimes a bit glitchy due to Serial transfer
  // if all data is 255, don't show it on strip or graph
  showOutput = false;
  for (int i = 0; i < noiseDataSize; i++) {
    if (noiseData[i] < 255) showOutput = true;
  }

  if(showOutput) {
    strOutput = "";
    
    for (int i = 0; i < noiseDataSize; i++) {
      strOutput = strOutput + noiseData[i];
      if (i < noiseDataSize - 1) strOutput = strOutput + ",";
    }  
    Serial.println(strOutput);
  }
}
