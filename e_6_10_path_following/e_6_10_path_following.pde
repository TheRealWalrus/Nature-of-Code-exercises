Vehicle vehicle;
ArrayList<Vehicle> vehicles;
Spawn spawn;

Path path;

void setup() {
  size(640, 480);
  vehicle = new Vehicle(0, height / 2 - 70);
  path = new Path();
  vehicles = new ArrayList<Vehicle>();
  spawn = new Spawn();
}

void draw() {
  background(#228B22);
  
  spawn.run();
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
  path.insertPoint(mouseX, mouseY);
}

void keyPressed() {
  if (key == 32) {
    path.init();
  }
}
