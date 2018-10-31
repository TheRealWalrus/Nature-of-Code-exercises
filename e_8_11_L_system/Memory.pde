class Memory {
  PVector location;
  PVector velocity;

  Memory(PVector _location, PVector _velocity) {
    location = _location.copy();
    velocity = _velocity.copy();
  }
  
  PVector getLocation() {
    return location;
  }
  
  PVector getVelocity() {
    return velocity;
  }
}
