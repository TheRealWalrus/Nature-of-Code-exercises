GOL gol;

void setup() {
  frameRate(10);
  size(640, 480);
  gol = new GOL();
}

void draw() {
  gol.run();
}