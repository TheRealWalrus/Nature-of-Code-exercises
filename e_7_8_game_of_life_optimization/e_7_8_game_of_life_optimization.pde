GOL gol;

void setup() {
  //frameRate(15);
  size(640, 480);
  gol = new GOL();
}

void draw() {
  gol.run();
}