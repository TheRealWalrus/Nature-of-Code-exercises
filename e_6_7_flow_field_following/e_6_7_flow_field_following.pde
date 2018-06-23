//vehicle array to be created

Field field;
Vehicle vehicle;
boolean debug = true;

void setup() {
  size(640, 480, P2D);
  field = new Field();
}

void draw() {
  background(0);
  if (debug)
    field.display();
    
  vehicle.update();
  vehicle.seek();
  vehicle.display();
}

void mouseClicked() {
  
}

void keyPressed() {
  if (key == 'd')
    debug = !debug;
}
