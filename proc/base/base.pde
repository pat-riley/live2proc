import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

float value;
HEllipse r1;
HCanvas c1;


void setup() {
  size(1000,1000);
  frameRate(120);
  // start oscP5, listening for incoming messages at port 9001 from Ableton */
  oscP5 = new OscP5(this,8080);

  H.init(this).background(#202020);
  smooth();

  r1 = new HEllipse(100);
  c1 = new HCanvas().autoClear(false).fade(0);
  

  HRotate hr1 = new HRotate();
  hr1.target(r1).speed(2);
}

void draw() {
  
    H.drawStage();

  H.add(c1);
  c1.add(r1)
    .anchor(50,125)
    .noFill()
    .loc(width/2,height/2)
    .strokeWeight(1)
    .stroke(#ffffff)
    .size(value*50,value*50)
  ;
}

void oscEvent(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern("/varX") ==true){
    value = theOscMessage.get(0).floatValue();
    println(value);
  }

}
