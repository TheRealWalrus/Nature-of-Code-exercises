Mover m[];
Attractor a;

void setup() {
  size(640, 480);
  a = new Attractor();
  m = new Mover[1];
  for (int i = 0; i < m.length; i++) {
    m[i] = new Mover(random(width), random(height));
  }
}

void mousePressed() {
  m = (Mover[]) append(m, new Mover(mouseX, mouseY)); // PROPER SYNTAX FOR APPEND!!! How to deal with empty arrays needs further research
}

void draw() {
  background(0);
  a.display();
  for (int i = 0; i < m.length; i++) {
    m[i].display();
    m[i].acceleration.mult(0);
    PVector force = a.exertForce(m[i]);
    m[i].applyForce(force);
    m[i].update();
  }
}