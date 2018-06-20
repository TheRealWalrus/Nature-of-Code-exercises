Vehicle escaper;
Field field;

void setup() {
  size(640, 480, P2D);
  escaper = new Vehicle(width / 2, height / 2);
  field = new Field();
}

void draw() {
  background(0);
  field.display();
  
  escaper.update();
  escaper.seek(new PVector(mouseX, mouseY));
  escaper.display();

  //mouse pointer
  fill(255, 100);
  stroke(255);
  ellipse(mouseX, mouseY, 40, 40);
}
