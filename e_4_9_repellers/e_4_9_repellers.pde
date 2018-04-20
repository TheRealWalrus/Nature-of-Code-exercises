// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com


ParticleSystem ps;
Repeller repellers[];

void setup() {
  size(640, 360);
  ps = new ParticleSystem(new PVector(width/2, 50));
  repellers = new Repeller[3];
  repellers[0] = new Repeller(width/2-20, height/3);
  repellers[1] = new Repeller(width/2+60, height/2);
  repellers[2] = new Repeller(width/2-140, height/3 * 2);
}

void draw() {
  background(255);
  ps.addParticle();

  // Apply gravity force to all Particles
  PVector gravity = new PVector(0, 0.1);
  ps.applyForce(gravity);

  for (int i = 0; i < repellers.length; i++) {
    ps.applyRepeller(repellers[i]);

    repellers[i].display();
  }

  ps.run();
}