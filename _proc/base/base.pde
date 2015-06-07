import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;


float value;

void setup() {
  size(250,250);
  frameRate(60);
  
  smooth();
  
  // start oscP5, listening for incoming messages at port 8080 from Ableton */
  oscP5 = new OscP5(this,8080);

}

void draw() {
}

void oscEvent(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern("/varX") == true){
    value = theOscMessage.get(0).floatValue();
    println(value);
  }

}
