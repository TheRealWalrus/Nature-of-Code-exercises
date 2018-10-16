void setup() {
  size(640, 480);
  background(255);
  
  PVector dir = new PVector(width / 3, 0);
  dir.rotate(0.2);
  drawThing(new PVector(width / 2, height / 2), dir);
  
}


void drawThing(PVector start, PVector scl) {
  line(start.x, start.y, start.x + scl.x, start.y + scl.y);
  line(start.x, start.y, start.x - scl.x, start.y - scl.y);

  if (scl.mag() > 2) {
    PVector newScl = scl.copy();
    newScl.mult(0.68);
    newScl.rotate(HALF_PI);
    
    drawThing(PVector.add(start, scl), newScl);
    drawThing(PVector.sub(start, scl), newScl);
  }
}
