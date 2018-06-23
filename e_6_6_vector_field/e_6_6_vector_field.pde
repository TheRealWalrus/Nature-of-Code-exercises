Field field;

void setup() {
  size(640, 480, P2D);
  field = new Field();
}

void draw() {
  background(255);
  field.display();
}
