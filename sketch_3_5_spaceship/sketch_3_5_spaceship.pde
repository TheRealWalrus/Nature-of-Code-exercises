Ship ship;

void setup() {
  size(640, 480);
  ship = new Ship(width / 2, height / 2);
}

void draw() {
  background(0);
  ship.display();
}

class Ship {
  float x;
  float y;

  Ship(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void display() {
    stroke(255);
    line(x, y - 15, x - 10, y + 15);
    line(x, y - 15, x + 10, y + 15);
    line(x - 8, y + 10, x + 8, y + 10);
  }

  void update() {

    if (keyPressed && (key == CODED)) { // If it’s a coded key
      if (keyCode == LEFT) { // If it’s the left arrow
        angVelocity = -0.1;
      } else if (keyCode == RIGHT) { // If it’s the right arrow
        angVelocity = 0.1;
      }
    } else {
      angVelocity = 0;
    }
    
    
  }
}