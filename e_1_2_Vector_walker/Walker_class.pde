class Walker {
  PVector location;
  PVector velocity;
  PVector lastLoc;

  int scatter = 20;
  int green = 0;
  int greenChange = 1;

  Walker() {
    location = new PVector(0, height/2);
    lastLoc = new PVector(0, height/2);
    velocity = new PVector(randomJump(), randomJump());
  }

  void display() {
    stroke(255, green, 0);
    line(lastLoc.x, lastLoc.y, location.x, location.y);
  }

  void update() {
    green += greenChange;
    if (green > 255) {
      greenChange = -1;
    } else if (green < 0) {
      greenChange = 1;
    }
    
    lastLoc.x = location.x;
    lastLoc.y = location.y;
    
    location.add(velocity);
    
    location.x = constrain(location.x, 0, width);
    location.y = constrain(location.y, 0, height);
    
    velocity.x = randomJump();
    velocity.y = randomJump(); 
  }

  float randomJump() {
    return(random(scatter * -1, scatter));
  }
}