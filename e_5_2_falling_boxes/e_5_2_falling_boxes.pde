// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;
Box2DProcessing box2d;

void setup() {
  size(640, 480, P2D);
  boxes = new ArrayList<Box>();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
}

void draw() {
  background(255);
  box2d.step();

  // When the mouse is clicked, add a new Box object
  if (mousePressed) {
    Box p = new Box(mouseX, mouseY);
    boxes.add(p);
  }
  
  for (int i = boxes.size() - 1; i >= 0; i--) {
    Box currentBox = boxes.get(i);
    
    if (currentBox.isFinished()) {
      boxes.remove(currentBox);
    }
  }

  // Display all the boxes
  for (Box b : boxes) {
    b.display();
  }

  printBoxesLength();
}

void printBoxesLength() {
  fill(0);
  text("Number of boxes: " + boxes.size(), 20, 20);
}
