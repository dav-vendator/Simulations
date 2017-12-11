//@Author : Dav Vendator

PVector loc;
PVector velocity;
PVector accn;
PVector mouseLoc;
PVector randomLoc;
PVector difference;
PFont f;
void setup() {
  f = createFont("monaco", 20, true);
  size(640, 480);
  background(0,25);
  loc = new PVector(random(width), random(height));
  randomLoc = loc.copy();
  velocity =  PVector.random2D();
}


void draw() {
  background(0);
  fill(0, 255, 0);
  
  //20% chance of changing direction
  if (random(1) < 0.02) {
    //comment this and decomment the next line for mouse following
    randomLoc = new PVector(random(width), random(height-150));
    // randomLoc = new PVector(mouseX,mouseY);
   }
    
    mouseLoc = randomLoc;
    PVector diff = PVector.sub(mouseLoc, loc);
    println(diff);
    //stroke(255,136,0);
    //strokeWeight(2);
   // line(loc.x, loc.y, mouseLoc.x, mouseLoc.y);
    noStroke();
    fill(0,123,255);
    ellipse(mouseLoc.x,mouseLoc.y,10,10);
    difference = diff.copy();
    diff.normalize();
    println("Normalized: "+diff);
    diff.mult(0.5);
    println("Scaled: "+diff);
    accn = diff;
    velocity.add(accn);
    velocity.limit(random(1,5));
    loc.add(velocity);
    noStroke();
    fill(255,0,0);
    ellipse(loc.x, loc.y, 20, 20);
    stroke(255);
    line(0,height-50,difference.mag(),height-50);
    textFont(f, 15);
    fill(255,234,0);
    text("Distance: "+difference.mag(),difference.mag(),height-45);
    fill(255);
    text("Follower by Dav Vendator",0,height-10);
 }