//Random walker that incorporates vectors
//According to Getting Started with P, best pracrice is to create a new tab for each class

Walker walker;

void setup() {
  size(640, 480);
  background(0);
  walker = new Walker();
}

void draw() {
  walker.display();
  walker.update();
}