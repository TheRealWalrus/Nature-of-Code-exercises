Vehicle escaper;

void setup() {
  size(640, 480);
  escaper = new Vehicle(width / 2, height / 2);
}

void draw() {
  background(0);
  escaper.update();
  escaper.seek(new PVector(mouseX, mouseY));
  escaper.display();
}
