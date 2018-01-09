ArrayList<Particle> pArray;

void setup() {
  //size(400, 400);
  fullScreen();
  background(0);
  pArray = new ArrayList<Particle>();
  colorMode(HSB);
  
}

void draw() {
  background(0);
  if (random(1)<0.1) {
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