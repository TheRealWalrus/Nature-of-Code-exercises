Mover m[];
Attractor a[];

void setup() {
  size(800, 600);
  background(0);
  a = new Attractor[5];
  for (int i = 0; i < a.length; i++) {
    a[i] = new Attractor(random(width), random(height));
  }
  m = new Mover[100];
  for (int i = 0; i < m.length; i++) {
    m[i] = new Mover(random(width), random(height));
  }
}

void draw() {
  smooth();
  for (int i = 0; i < m.length; i++) {
    m[i].acceleration.mult(0);
  }
  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < m.length; j++) {
      PVector force = a[i].attract(m[j]);
      m[j].applyForce(force);
    }
    a[i].display();
  }
  for (int i = 0; i < m.length; i++) {
    m[i].update();
    m[i].display();
  }
}