Vehicle escaper;
Target target;

void setup() {
  size(640, 480, P2D);
  reset();
}

void draw() {
  background(0);
  escaper.update();
  escaper.seek(calcLead(target));
  escaper.display();

  //target
  target.update();
  target.display();
  
  if (target.location.x - target.r > width)
    reset();
}
   
void mouseClicked() {
   reset();
}

void reset() {
  escaper = new Vehicle(width / 2, height);
  target = new Target(0, height / 3);
}

PVector calcLead(Target _target) {
  PVector destination = _target.location.copy();
  float distance = dist(destination.x, destination.y, escaper.location.x, escaper.location.y);
  PVector lead =  PVector.mult(_target.velocity, distance / 2);

  destination.add(lead);
  return destination;
}
