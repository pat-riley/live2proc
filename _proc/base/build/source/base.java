import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import oscP5.*; 
import netP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class base extends PApplet {




OscP5 oscP5;
NetAddress myRemoteLocation;

float value;
HEllipse r1;
HCanvas c1;


public void setup() {
  size(1000,1000);
  frameRate(120);
  // start oscP5, listening for incoming messages at port 9001 from Ableton */
  oscP5 = new OscP5(this,8080);

  H.init(this).background(0xff202020);
  smooth();

  r1 = new HEllipse(100);
  c1 = new HCanvas().autoClear(false).fade(0);


  HRotate hr1 = new HRotate();
  hr1.target(r1).speed(2);
}

public void draw() {

    H.drawStage();

  H.add(c1);
  c1.add(r1)
    .anchor(50,125)
    .noFill()
    .loc(width/2,height/2)
    .strokeWeight(1)
    .stroke(0xffffffff)
    .size(value*50,value*50)
  ;
}

public void oscEvent(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern("/varX") ==true){
    value = theOscMessage.get(0).floatValue();
    println(value);
  }

}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "base" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
