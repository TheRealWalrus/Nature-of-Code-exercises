Vehicle vehicle;
Path path;

void setup() {
  size(640, 480, P2D);
  vehicle = new Vehicle(width / 2, height / 2);
  path = new Path();
}

void draw() {
  background(#228B22);
  
  path.display();
  
  vehicle.update();
  vehicle.seek(new PVector(mouseX, mouseY));
  vehicle.display();

  //mouse pointer
  fill(255, 100);
  stroke(255);
  ellipse(mouseX, mouseY, 40, 40);
}
