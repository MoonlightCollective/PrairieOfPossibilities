// inputs
#define DOOR_SENSOR_PIN 2
#define MICRO_SENSOR_PIN 3
#define IR_SENSOR_PIN 4
#define PROX_SENSOR_PIN 5

// outputs
#define LIGHT_PIN 8
#define PRIVACYFILM_PIN 6
#define OCCUPIED_PIN 7

char dataString[50] = {0};
uint16_t oldtime = millis();
uint16_t ntime = 0;

volatile bool triggerDoor = false;
volatile bool triggerMicro = false;
volatile bool triggerIR = false;
volatile bool triggerProximity = false;
bool triggerPulse = false;

int doorCounter = 0;
int microCounter = 0;
int irCounter = 0;
int proximityCounter = 0;
int state = 0;
int loopCounter = 0;

bool door = false;
bool micro = false;
bool ir = false;
bool proximity = false;

// state machine for heart beat pulse
// 0 = idle
// 1 = first beat
// 2 = fade...
// 3 = second beat
// 4 = fade...

void setup()
{
  Serial.begin(115200);              //Starting serial communication

  pinMode(DOOR_SENSOR_PIN, INPUT);
  pinMode(MICRO_SENSOR_PIN, INPUT);
  pinMode(IR_SENSOR_PIN, INPUT);
  pinMode(PROX_SENSOR_PIN, INPUT);
  pinMode(LIGHT_PIN, OUTPUT);

  analogWrite(LIGHT_PIN, 100);
  
  attachInterrupt(digitalPinToInterrupt(DOOR_SENSOR_PIN), triggerDoorSensor, FALLING);
  attachInterrupt(digitalPinToInterrupt(MICRO_SENSOR_PIN), triggerMicroSensor, RISING);
  attachInterrupt(digitalPinToInterrupt(IR_SENSOR_PIN), triggerIrSensor, FALLING);
  attachInterrupt(digitalPinToInterrupt(PROX_SENSOR_PIN), triggerProxSensor, RISING);
}


void triggerDoorSensor() {
  if (doorCounter <= 0)
    triggerDoor = true;
}

void triggerMicroSensor() {
  if (microCounter <= 0)
    triggerMicro = true;
}

void triggerIrSensor() {
  if (irCounter <= 0)
    triggerIR = true;
}

void triggerProxSensor() {
  if (proximityCounter <= 0)
    triggerProximity = true;
}

void loop() {
  uint16_t t = millis();
  uint16_t dt = t - oldtime;
  oldtime = t;

  // process all the cooldown timers
  // after cooldown time expires, use polling to check if active state has ended
  if (doorCounter > 0)
  {
    doorCounter -= dt;
  } else if (door && digitalRead(DOOR_SENSOR_PIN) == HIGH)   // this is no longer active
  {
    door = false;
    Serial.println("door_off");
  } 

  if (microCounter > 0)
  {
    microCounter -= dt;
  } else if (micro && digitalRead(MICRO_SENSOR_PIN) == LOW)
  {
    micro = false;
    Serial.println("micro_off");
  }
  
  if (irCounter > 0)
  {
    irCounter -= dt;
  } else if (ir && digitalRead(IR_SENSOR_PIN) == HIGH)
  {
    ir = false;
    Serial.println("ir_off");
  }
  
  if (proximityCounter > 0)
  {
    proximityCounter -= dt;
  } else if (proximity && digitalRead(PROX_SENSOR_PIN) == LOW)
  {
    proximity = false;
    Serial.println("proximity_off");
  }


  // process all interrupts to see if any of them have triggered
  // if one triggers, set up 5 second cool down time before it can trigger again
  if (triggerDoor)
  {
    triggerDoor = false;
    door = true;
    doorCounter = 5000;
    Serial.println("door_on");    
  }
  if (triggerMicro)
  {
    triggerMicro = false;
    micro = true;
    microCounter = 5000;
    Serial.println("micro_on");    
  }
  if (triggerIR)
  {
    triggerIR = false;
    ir = true;
    irCounter = 5000;
    Serial.println("ir_on");    
  }
  if (triggerProximity)
  {
    triggerProximity = false;
    proximity = true;
    proximityCounter = 5000;
    Serial.println("proximity_on");    
  }

  // now handle state machine for pulsing the light
  if (state == 0)
  {
    if (triggerPulse)   // trigger heart beat pulse
    {
      triggerPulse = false;
      loopCounter = 5;
      state = 1;
    }
  } else if (state == 1)
  {
    int b = 100 + (20 * (5-loopCounter));
    analogWrite(LIGHT_PIN, b);
    loopCounter--;
    if (loopCounter == 0)
    {
      state = 2;
      loopCounter  = 10;
    }
  } else if (state == 2)
  {
    int b = 100 + (10 * loopCounter);
    analogWrite(LIGHT_PIN, b);
    loopCounter--;
    if (loopCounter == 0)
    {
      state = 3;
      loopCounter  = 5;
    }
  } else if (state == 3)
  {
    int b = 100 + (20 * (5-loopCounter));
    analogWrite(LIGHT_PIN, b);
    loopCounter--;
    if (loopCounter == 0)
    {
      state = 4;
      loopCounter  = 10;
    }
  } else if (state == 4)
  {
    int b = 100 + (10 * loopCounter);
    analogWrite(LIGHT_PIN, b);
    loopCounter--;
    if (loopCounter == 0)
    {
      state = 1;
    }
  }  
    
  // now handle incoming messages via serial 
  if (Serial.available() > 0) {
    String data = Serial.readStringUntil('\n');
    if (data == "beat")
    {
      triggerPulse = true;
    }
  }
}
