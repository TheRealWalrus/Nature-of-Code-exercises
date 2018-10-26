CantorSet cantorSet;

void setup() {
  size(640, 480);
  background(255);
  cantorSet = new CantorSet();
}

void draw() {
}

void mouseClicked() {
  //println("moseClicked OK");
  cantorSet.generate();
}
