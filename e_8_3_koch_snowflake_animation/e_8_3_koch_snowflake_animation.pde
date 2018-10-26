KochFlake snowFlake;

void setup() {
  size(640, 480);
  snowFlake = new KochFlake(width / 2, height / 2, height);
}

void draw() {
  background(255);
  snowFlake.render();
}

void mouseClicked() {
  snowFlake.generate();
}

void keyPressed() {
  switch(key) {
  case 'c': 
    setup();
    break;
    case 'r':
    snowFlake.toggleRotation();
    break;
  }
}
