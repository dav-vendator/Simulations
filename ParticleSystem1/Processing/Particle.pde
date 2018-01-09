class Particle {
  PVector velocity;
  PVector accn;
  PVector loc;
  float mass;
  int lifeTime;
  int dieStep; //lifeTime -= dieStep
  color pColor;
  Particle(PVector vel, PVector accn, PVector loc, float mass, int lifeTime, int dieStep, color pColor) {
    this.velocity = vel.get();
    this.accn = accn.get();
    this.loc = loc.get();
    this.mass = mass;
    this.lifeTime = lifeTime;
    this.dieStep = dieStep;
    this.pColor = pColor;
  }

  Particle(PVector loc, float mass, int lifeTime, int dieStep, color pColor) {
    this.velocity = PVector.random2D();
    this.accn = PVector.random2D();
    this.loc = loc.get();
    this.mass = mass;
    this.lifeTime = lifeTime;
    this.dieStep = dieStep;
    this.pColor = pColor;
  }

  void applyForce(PVector p) {
    p.div(mass);// F = mass * accn i.e accn = force/mass
    accn = p.get();
  }

  void checkEdges() {
    if (loc.x > width || loc.x < 0 || loc.y > height || loc.y < 0) {
        loc.x = random(width);
        loc.y = random(height);
     }
  }

  void update() {
    this.velocity.add(this.accn);
    this.velocity.normalize();
    this.velocity.mult(4);
    this.loc.add(velocity);
    checkEdges();
    this.lifeTime -= dieStep;
  }

  void draw() {
    noStroke();
    fill(this.pColor);
    ellipse(loc.x, loc.y, 10, 10);
  }

  boolean isDead() {
    return this.lifeTime == 0;
  }
}