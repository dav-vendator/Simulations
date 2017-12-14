var attractors = [];
var particles = [];

function setup() {
  let cnv = createCanvas(400, 400);
  cnv.parent("p5Canavs");
  for (var i = 0; i < 100; i++) {
//    attractors.push(createVector(random(width), random(height)));
    particles.push(new Particle(random(width), random(height)));
  }
//  background(50);
}

function mousePressed() {
  attractors.push(createVector(mouseX, mouseY));
}

function draw() {
  background(50);
  stroke(255);
  strokeWeight(4);
  particles.push(new Particle(random(width), random(height)));
  attractors.push(createVector(map(sin(random(width)),1,-1,0,width),
                               map(cos(random(width)),1,-1,0,height) ));
  if (particles.length > 100) {
    particles.splice(0, 1);
  }
  if (attractors.length > 100) {
    attractors.splice(0, 1);
  }

  for (var i = 0; i < attractors.length; i++) {
    stroke(0, 255, 0);
    point(attractors[i].x, attractors[i].y);
  }
  for (var i = 0; i < particles.length; i++) {
    var particle = particles[i];
    for (var j = 0; j < attractors.length; j++) {
      particle.attracted(attractors[j]);
    }
    particle.update();
    particle.show();
  }

}
