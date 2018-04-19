Crate crates[];
Water water;

PVector gravity;

void setup() {
  size(800, 600);
  water = new Water(0, height / 2, width, height / 2, -1000);
  crates = new Crate[5];
  for (int i = 0; i < crates.length; i++) {
    crates[i] = new Crate(width / crates.length * (i + 0.5), random(0, height / 2), random(22, 60));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < crates.length; i++) {
    gravity = new PVector(0, 0.1 * crates[i].mass);
    crates[i].display();
    crates[i].checkEdges();
    crates[i].accelereation.mult(0);
    crates[i].applyForce(gravity);
    if (crates[i].isInside(water)) {
      crates[i].drag(water);
    }
    crates[i].update();
  }
  water.display();
}