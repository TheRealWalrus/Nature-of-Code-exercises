//Random walker that incorporates custom probability "Monte Carlo method"

Walker walker;

void setup() {
  size(640, 480);
  background(0);
  walker = new Walker();
}

void draw() {
  walker.display();
  //walker.recenter();
  walker.update();
}

class Walker {
  float x, y;
  float lastX, lastY;
  float jumpDistance;
  int rng;
  float noiseTime;

  Walker() {
    x = width/2;
    y = height/2;
    jumpDistance = 10;
  }

  void display() {
    stroke(255);
    point(x, y);
  }

  void update() {
    jumpDistance = map(noise(noiseTime), 0, 1, 0, 30);
    noiseTime += 0.1;
    println(jumpDistance);
    rng = int(random(4));
    if (rng == 0) {
      x += jumpDistance;
    } else if (rng == 1) {
      x -= jumpDistance;
    } else if (rng == 2) {
      y += jumpDistance;
    } else {
      y -= jumpDistance;
    }

    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }

  float montecarlo() {
    while (true) {
      float r1 = random(1);
      float probability = r1;
      float r2 = random(1);
      if (r2 * r2 > probability) {
        return r1;
      }
    }
  }

  void recenter() {
    x = width/2;
    y = height/2;
  }
}