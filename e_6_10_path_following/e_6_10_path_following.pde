Vehicle vehicle;
Path path;

void setup() {
  size(640, 480, P2D);
  vehicle = new Vehicle(0, height / 2 - 70);
  path = new Path();
}

void draw() {
  background(#228B22);
  
  path.display();
  
  vehicle.update();
  vehicle.follow(path);
  vehicle.display();

  //mouse pointer
  //fill(255, 100);
  //stroke(255);
  //ellipse(mouseX, mouseY, 40, 40);
}
