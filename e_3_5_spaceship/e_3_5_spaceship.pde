Ship ship;

void setup() {
  size(640, 480);
  ship = new Ship(width / 2, height);
}

void draw() {
  background(0);
  ship.display();
  ship.update();
  println(ship.dir);
}

void keyPressed() {
  ship.setMove(keyCode, true);
}

void keyReleased() {
  ship.setMove(keyCode, false);
}