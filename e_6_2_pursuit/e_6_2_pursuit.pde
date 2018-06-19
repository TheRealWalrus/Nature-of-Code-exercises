Vehicle escaper;
Target target;
int boundary = 50;

void setup() {
  size(640, 480, P2D);
  escaper = new Vehicle(width / 2, height / 2);
  target = new Target(0, height / 3);
}

void draw() {
  background(0);
  escaper.update();
  escaper.seek(new PVector(mouseX, mouseY));
  escaper.display();

  //mouse pointer
  fill(255, 100);
  stroke(255);
  ellipse(mouseX, mouseY, 40, 40);
  
  //boundary
  stroke(255, 0, 0);
  noFill();
  rect(boundary, boundary, width - boundary * 2, height - boundary * 2);
  
  //target
  target.update();
  target.display();
}
