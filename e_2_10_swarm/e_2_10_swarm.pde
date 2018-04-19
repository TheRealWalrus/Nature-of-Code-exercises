//The index 0 element in the array does not seem to experience repulsion.

Mover m[];

void setup() {
  size(640, 480);
  m = new Mover[10];
  for (int i = 0; i < m.length; i++) {
    m[i] = new Mover(random(width), random(height));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < m.length; i++) {
    m[i].acceleration.mult(0);
  }
  
  for (int i = 0; i < m.length; i++) {
    m[i].display();
    m[i].followMouse();
    for (int j = 0; j < m.length; j++) {
      if (i != j) {
        PVector force = m[i].repel(m[j]);
        m[j].applyForce(force);
      }
    }

    m[i].update();
  }
  println(m[0].velocity.mag());
}