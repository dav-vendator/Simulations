//import peasy.*;

final float sigma = 10;
final float rho = 28;
final float beta = 8.0/3.0;

float x = 0.01;
float y = 0;
float z = 0;
float dt = 0.01;
  float hu = 0;
ArrayList<PVector> history;
//PeasyCam cam;
void setup(){
  //size(640,480,P3D);
  fullScreen(P3D);
  history = new ArrayList<PVector>();
 colorMode(HSB);
  //cam = new PeasyCam(this, 500);
}

float angle  = 0.01;
void draw(){
  background(0);
 
  float dx = (sigma*(y-x) )* dt;
  float dy =  (x*(rho-z)-y) * dt;
  float dz = (x*y - beta*z)*dt;
  x += dx;
  y += dy;
  z += dz;
  history.add(new PVector(x,y,z));
  
  translate(width/2, height/2, -70);
  scale(5);
  noFill();
  stroke(255);
  rotateY(map(angle*0.5,0,60,0,360));
  beginShape();
  for(PVector b : history){
    stroke(hu,255,255);
    vertex(b.x,b.y,b.z);
    hu += 0.001;
    if (hu > 255) {
      hu = 0;
    }
  }
  endShape();
  stroke(150,255,255);
  if(history.size()>6){
    pushMatrix();
    translate(history.get(history.size()-2).x,history.get(history.size()-2).y,history.get(history.size()-2).z);
    ellipse(0,0,10,10);
    popMatrix();
  }
  
 angle+=0.01; 
    
}