Tree tree;

void setup() {
  size(640, 480);
  tree = new Tree(width / 2, height, 150, 20);
}

void draw() {
  background(255);
  tree.render();
}

void mouseClicked() {
  tree.generate();
}