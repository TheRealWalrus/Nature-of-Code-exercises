Vehicle vehicle;
ArrayList<Vehicle> vehicles;


Path path;

void setup() {
  size(640, 480);
  vehicle = new Vehicle(0, height / 2 - 70);
  path = new Path();
  vehicles = new ArrayList<Vehicle>();
  
  path.addPoint(0, height / 2);
  path.addPoint(width * 1 / 3, height * 2 / 3);
  path.addPoint(width * 2 / 3, height * 1 / 3);
  path.addPoint(width, height / 2);
}

void draw() {
  background(#228B22);

  path.display();

  for (int i = 0; i < vehicles.size(); i++) {
    Vehicle vehicle = vehicles.get(i);
    
    vehicle.update();
    vehicle.follow(path);
    vehicle.display();
  }
  
  for (int i = vehicles.size() - 1; i >= 0; i--) {
    Vehicle vehicle = vehicles.get(i);
    if (vehicle.isAlive())
      vehicles.remove(i);
  }
}

void mouseClicked() {
  vehicles.add(new Vehicle(mouseX, mouseY));
}
