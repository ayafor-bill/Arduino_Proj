const int xPin = A0;
const int yPin = A1;

int xRaw = 0;
int yRaw = 0;

float xSmooth = 0;
float ySmooth = 0;

const float alpha = 0.15;

void setup() {
  // put your setup code here, to run once:
Serial.begin(19200);
}

void loop() {
  // put your main code here, to run repeatedly:

//Serial.println("100,100");
 xRaw = analogRead(xPin);
 yRaw = analogRead(yPin);

// If the change is less than 10, don't update the value
if(abs(xRaw -xSmooth) > 10) {
 xSmooth = (1 - alpha) * xSmooth + alpha * xRaw;
}
if(abs(yRaw - ySmooth) > 10) {
 ySmooth = (1 - alpha) * xSmooth + alpha * yRaw;
}

 Serial.print(xSmooth);
 Serial.print(",");
 Serial.println(ySmooth);

  delay(20);
}
