ArrayList<PSystem> pSystems;

void setup() {
  size(640, 480);
  pSystems = new ArrayList();
  PVector origo = new PVector(width / 2, height / 2);
  pSystems.add(new PSystem(origo));
}

void draw() {
  background(0);
  for (int i = pSystems.size() - 1; i >= 0; i--) {
    PSystem part = pSystems.get(i);
    part.run();
  }
}