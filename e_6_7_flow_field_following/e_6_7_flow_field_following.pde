Field field;
ArrayList<Vehicle> vehicles;
boolean debug = false;

void setup() {
  size(640, 480, P2D);
  field = new Field();
  vehicles = new ArrayList();
}

void draw() {
  background(#87CEEB);
  field.update();
  if (debug)
    field.display();

  for (Vehicle element : vehicles) {
    element.update();
    element.seek();
    element.display();
  }
  
  if (mousePressed) {
      vehicles.add(new Vehicle(mouseX, mouseY));
  }
}

void keyPressed() {
  if (key == 'd') {
    debug = !debug;
  } else if (key == 'c') {
    vehicles.clear();
  } else if (key == 'a') {
    field.animate = !field.animate;
  }
}