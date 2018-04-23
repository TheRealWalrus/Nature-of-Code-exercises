// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector pos;
  PVector startPos;
  PVector vel;
  PVector acc;
  float lifespan;
  PImage img;
  float hue;

  Particle(PVector l, PImage img_) {
    acc = new PVector(0, 0);
    float vx = randomGaussian()*0.3;
    float vy = randomGaussian()*0.3 - 1.0;
    vel = new PVector(vx, vy);
    pos = l.copy();
    startPos = pos.copy();
    lifespan = 100.0;
    img = img_;
  }

  void run() {
    update();
    render();
  }

  // Method to apply a force vector to the Particle object
  // Note we are ignoring "mass" here
  void applyForce(PVector f) {
    acc.add(f);
  }  

  // Method to update position
  void update() {
    vel.add(acc);
    pos.add(vel);
    lifespan -= 2.5;
    acc.mult(0); // clear Acceleration
  }

  // Method to display
  void render() {
    
    int rainRes = 100;
    hue = pos.y - startPos.y;
    while (hue > rainRes) {
      hue -= 100;
    }
    
    
    hue = map(hue, rainRes, 0, 360, 0);
    //hue = random(360);

    imageMode(CENTER);
    colorMode(HSB, 360, 100, 100);
    tint(hue, 100, 100, lifespan);
    image(img, pos.x, pos.y);
    colorMode(RGB, 255, 255, 255);
    // Drawing a circle instead
    //fill(255,lifespan);
    //noStroke();
    //ellipse(pos.x,pos.y,img.width,img.height);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
  
  //test
  void test() {
    pos.x = mouseX;
    pos.y = mouseY;
    println(hue);
  }
}