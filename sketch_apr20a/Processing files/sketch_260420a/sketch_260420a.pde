import processing.serial.*;

Serial myPort;

float rotX = 0;
float rotY = 0;

void setup(){
  size(800, 600, P3D);
  printArray(Serial.list());
  
  myPort = new Serial(this, Serial.list()[0], 19200);
}

//LDR Control
void draw(){
  background(0);
  lights();
  
  if (myPort.available() > 0){
    String val = myPort.readStringUntil('\n');
    
    if(val != null){
      val = trim(val);
      println("RAW DATA: " + val);
      println("Sensor Data " + val);
      String[] data = split(val, ',');
      
      if (data.length == 2) {
        float ldrLeft = float(data[0]);
        float ldrRight = float(data[1]);
        
        float speedY = 0;
        float speedX = 0;
        
        // LDR1 - Horizontal Control
        if(ldrLeft < 55) {
          speedY = 0.05;
        } else if (ldrLeft > 230) {
          speedY = -0.05;
        }
        
        //LDR2 - Vertical Control
        if (ldrRight < 35) {
          speedX = 0.05;
        } else if (ldrRight > 190) {
          speedX = -0.05;
        }
        
        println("LDR1: " + ldrLeft + " | LDR2: " + ldrRight);
        
        rotY += speedY;
        rotX += speedX;
      }
    }
  }
  
  translate(width/2, height/2, 0);
  
  rotateX(rotY);
  rotateY(rotX);
  
  stroke(0, 255, 0);
  noFill();
  
  box(200);
}
