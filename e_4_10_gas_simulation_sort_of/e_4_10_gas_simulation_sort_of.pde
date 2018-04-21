ParticleSystem ps;
Lid lid;

void setup() {
  size(280, 360);
  ps = new ParticleSystem();
  lid = new Lid();
}

void draw() {
  background(255);
  //ps.addParticle();

  // Apply gravity force to all Particles
  PVector gravity = new PVector(0, 0.1);
  //PVector gravity = new PVector(0, 0.0);
  ps.applyForce(gravity);
  lid.run();
  //for (int i = 0; i < repellers.length; i++) {
  //  ps.applyRepeller(repellers[i]);

  //  repellers[i].display();
  //}

  ps.run();
}