import oscP5.*;
import netP5.*;
import controlP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
ControlP5 cp5;

float value;
float zalue;

int frameRate = 100;





void setup() {
  size(500,500);
  frameRate(frameRate);
  smooth();
  
  // start oscP5, listening for incoming messages at port 9001 from Ableton */
  oscP5 = new OscP5(this,8080);
  
  // Initialize The UI object
  cp5 = new ControlP5(this);
  
  // Initial Styles
  background(50,50,50);  
  textSize(12);


}

void draw() {
  
  background(50,50,50);  
  
  // var X
  text("var X", 10, 30);
  text(value, 50, 30);
  rect(100, 20, value, 10);
  
  // var Y
  text("var Y", 10, 45);
  text(zalue, 50, 45);
  rect(100, 30, zalue, 10);
  

   // HUD
   text("frameRate", 10, 450);
   text(frameRate, 100, 450);
  
}

void oscEvent(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern("/varX") ==true){
    value = theOscMessage.get(0).floatValue();
  }
  
  if (theOscMessage.checkAddrPattern("/varY") ==true){
    zalue = theOscMessage.get(0).floatValue();
  }

}
