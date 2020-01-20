#include <Stepper.h>

const int stepsPerRevolution = 64;  // change this to fit the number of steps per revolution
// for your motor

// initialize the stepper library on pins 8 through 11:
Stepper myStepper1(stepsPerRevolution, 8, 9, 10, 11);

int stepCount = 0;
float desiredAngle = 50.0;
float stepAngle = 360/64;
float cuurentAngle;

void setup() {
  
  // initialize the serial port:
  Serial.begin(9600);
}

void loop() {
  if (currentAngle < desiredAngle){
    myStepper1.step(1);
    currentAngle = currentAngle + stepAngle;
    stepCount++;
    Serial.print("steps: ");
    Serial.println(stepCount);
    Serial.print("current angle: ");
    Serial.println(currentAngle);
  }
}
