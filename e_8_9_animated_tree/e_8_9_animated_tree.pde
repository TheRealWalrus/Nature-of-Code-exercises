Tree tree;

void setup() {
  size(480, 440);
  spawn();
}

void draw() {
  background(#9DE0AD);
  tree.run();

  //if (frameCount < 900) {
  //  if (frameCount % 3 == 0)
  //    saveFrame("output/at_####.png");
  //} else {
  //  println("render finished");
  //  noLoop();
  //}
}

void mouseClicked() {
  spawn();
}

void spawn() {
  tree = new Tree(width / 2, height, 150, 30);
}