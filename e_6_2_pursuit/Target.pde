class Target {
  PVector location;
  PVector velocity;
  int r = 20;

  Target(float _x, float _y) {
    location = new PVector(_x, _y);
    velocity = new PVector(random(1, 2.0), 0);
  }

  void update() {
    location.add(velocity);
    
  }

  void display() {
    color strokeColor = collides() ? color(255, 0, 0) : color(255);
    fill(255, 100);
    stroke(strokeColor);
    ellipse(location.x, location.y, r * 2, r * 2);
  }
  
  boolean collides() {
    float eDistance = dist(escaper.location.x, escaper.location.y, location.x, location.y);
    return eDistance <= r ? true : false;
  }
}
