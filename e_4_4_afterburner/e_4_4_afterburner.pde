Ship ship;
 ArrayList<Particle> particles;

void setup() {
  size(640, 480, P2D);
  ship = new Ship(width / 2, height);
  particles = new ArrayList();
}

void draw() {
  background(0);
  ship.display();
  ship.update();
  //println(ship.dir);
}

void keyPressed() {
  ship.setMove(keyCode, true);
}

void keyReleased() {
  ship.setMove(keyCode, false);
}