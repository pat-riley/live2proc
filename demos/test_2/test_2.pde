import oscP5.*;
import netP5.*;
import controlP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
ControlP5 cp5;



// GLOBAL VARIABLES
int frameRate = 100;

//AUDIO VARIABLES
float volumeOneLeft;
float volumeOneRight;
int   pitchOne;
int   velocityOne;


void setup() {
  size(800,500);
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
  text(volumeOneLeft, 50, 30);
  text("Track 01 L",  100, 30);
  rect(200, 20, volumeOneLeft, 10);
  
  // var Y
  text(volumeOneRight, 50, 45);
  text("Track 01 R", 100, 45);
  rect(200, 30, volumeOneRight, 10);
  
  //  Midi Pitch 1
  text(pitchOne, 50, 60);
  text("pitchOne", 100, 60);
  
  //  Midi Velocity 1
  text(velocityOne, 50, 76);
  text("velocityOne", 100, 75);
  rect(200, 65, velocityOne, 10);

   // HUD
   text("frameRate", 10, 450);
   text(frameRate, 100, 450);
  
}

void oscEvent(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern("/varX") ==true){
    volumeOneLeft = theOscMessage.get(0).floatValue();
    //println(theOscMessage);
    //println(volumeOneLeft);
  }
  
  if (theOscMessage.checkAddrPattern("/varY") ==true){
    volumeOneRight = theOscMessage.get(0).floatValue();
  }
  
  if (theOscMessage.checkAddrPattern("/pitch") ==true){
    pitchOne = theOscMessage.get(0).intValue();
    println(pitchOne);
  }
  
  if (theOscMessage.checkAddrPattern("/velocity") ==true){
    velocityOne = theOscMessage.get(0).intValue();
    println(velocityOne);
  }


}
