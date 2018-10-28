Tree tree;

void setup() {
  size(480, 440);
  spawn();
}

void draw() {
  background(#9DE0AD);
  tree.run();
}

void mouseClicked() {
  spawn();
}

void spawn() {
  tree = new Tree(width / 2, height, 150, 30);
}