ArrayList<PSystem> pSystems;

void setup() {
  size(640, 480, P2D);
  pSystems = new ArrayList();

  for (int i = 0; i < 5; i++) {
    PVector origo = new PVector(random(width), random(height));
    pSystems.add(new PSystem(origo));
  }
}

void mouseClicked() {
  for (int i = pSystems.size() - 1; i >= 0; i--) {
    PSystem part = pSystems.get(i);

    if (part.isClicked()) {
      part.arm();
    }
  }
}

void draw() {
  background(0);
  for (int i = pSystems.size() - 1; i >= 0; i--) {
    PSystem part = pSystems.get(i);
    part.run();

    if (!part.isAlive) {
      pSystems.remove(i);
    }
  }
  //println(pSystems.size());
}