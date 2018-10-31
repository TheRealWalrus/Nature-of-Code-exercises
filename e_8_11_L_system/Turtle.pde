class Turtle {
  float angle;
  PVector location;
  PVector velocity;
  ArrayList<Memory> stack;

  Turtle(float speed, float _angle) {
    angle = _angle;
    location = new PVector(width / 2 + 50, height);
    velocity = new PVector(0, -speed);
    stack = new ArrayList<Memory>();
  }

  void instruction(char instruction) {
    switch(instruction) {
    case 'F':
      PVector prev = location.copy();
      location.add(velocity);
      line(prev.x, prev.y, location.x, location.y);
      break;
    case '-':
      velocity.rotate(angle);
      break;
    case '+':
      velocity.rotate(-angle);
      break;
    case '[':
      stack.add(new Memory(location, velocity));
      break;
    case ']':
      Memory m = stack.get(stack.size() - 1);
      location = m.location;
      velocity = m.velocity;
      stack.remove(stack.size() - 1);
      break;
    }
  }
}
