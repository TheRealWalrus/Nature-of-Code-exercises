ArrayList<ParticleSystem> systems;

void setup() {
  size(640, 480, P2D);
  systems = new ArrayList<ParticleSystem>();
}

void mousePressed() {
  systems.add(new ParticleSystem(new PVector(mouseX, mouseY)));
}

void draw() {
  background(255);
  //println(systems.size());
  //Since we aren’t deleting elements, we can use our enhanced loop!

  for (int i = systems.size() -1; i >= 0; i--) {
    ParticleSystem ps = systems.get(i);
    ps.run();
    ps.addParticle();
    if (ps.toDelete) {
      systems.remove(i);
    }
  }
}