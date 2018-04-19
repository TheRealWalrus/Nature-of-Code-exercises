// unfinished

Plane plane;
Air air;

PVector gravity;

void setup() {
  size(800, 600);
  air = new Air(0, 0, width, height, -0.02);
  plane = new Plane(width / 2, 0);
  gravity = new PVector(0, 0.1);
}

void draw() {
  background(0);
  plane.display();
  plane.accelereation.mult(0);
  plane.checkEdges();
  plane.thrust();
  plane.applyForce(gravity);
  if (plane.isInside(air)) {
    plane.drag(air);
  }
  plane.update();
  air.display();
  println(plane.velocity.y);
}