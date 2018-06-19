class Target {
  PVector location;
  PVector velocity;

  Target(float _x, float _y) {
    location = new PVector(_x, _y);
    velocity = new PVector(1, 0);
  }

  void update() {
    location.add(velocity);
    
  }

  void display() {
    fill(255, 100);
    stroke(255);
    ellipse(location.x, location.y, 40, 40);
  }
}
