package dav.vendator.cc;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Sketch extends PApplet {

ArrayList<Particle> pArray;

public void setup() {
  //size(400, 400);
  
  background(0);
  pArray = new ArrayList<Particle>();
  colorMode(HSB);
  
}

public void draw() {
  background(0);
  if (random(1)<0.1f) {
    pArray.add(new Particle(new PVector(random(width), random(height)), 1, (int)random(400), (int)random(5), color(random(255), 255, 255)));
  }

  for (int i=0; i <pArray.size(); i++) {
    for (int j=1; j<pArray.size(); j++) {
      PVector diff = PVector.sub(pArray.get(i).loc, pArray.get(j).loc);
      if (diff.mag() > 0 && diff.mag() < 100) {
        stroke(map(sin(frameRate),-1,1,120,256),255,255);
        line(pArray.get(i).loc.x, pArray.get(i).loc.y, pArray.get(j).loc.x, pArray.get(j).loc.y);
      }
    }
  }
  for (int i=pArray.size()-1; i >= 0; i--) {
    Particle p = pArray.get(i);
     p.update();
    if (p.isDead()) {
      pArray.remove(i);
    }
  }
}
class Particle {
  PVector velocity;
  PVector accn;
  PVector loc;
  float mass;
  int lifeTime;
  int dieStep; //lifeTime -= dieStep
  int pColor;
  Particle(PVector vel, PVector accn, PVector loc, float mass, int lifeTime, int dieStep, int pColor) {
    this.velocity = vel.get();
    this.accn = accn.get();
    this.loc = loc.get();
    this.mass = mass;
    this.lifeTime = lifeTime;
    this.dieStep = dieStep;
    this.pColor = pColor;
  }

  Particle(PVector loc, float mass, int lifeTime, int dieStep, int pColor) {
    this.velocity = PVector.random2D();
    this.accn = PVector.random2D();
    this.loc = loc.get();
    this.mass = mass;
    this.lifeTime = lifeTime;
    this.dieStep = dieStep;
    this.pColor = pColor;
  }

  public void applyForce(PVector p) {
    p.div(mass);// F = mass * accn i.e accn = force/mass
    accn = p.get();
  }

  public void checkEdges() {
    if (loc.x > width || loc.x < 0 || loc.y > height || loc.y < 0) {
        loc.x = random(width);
        loc.y = random(height);
     }
  }

  public void update() {
    this.velocity.add(this.accn);
    this.velocity.normalize();
    this.velocity.mult(4);
    this.loc.add(velocity);
    checkEdges();
    this.lifeTime -= dieStep;
  }

  public void draw() {
    noStroke();
    fill(this.pColor);
    ellipse(loc.x, loc.y, 10, 10);
  }

  public boolean isDead() {
    return this.lifeTime == 0;
  }
}
  public void settings() {  fullScreen(); }
}
