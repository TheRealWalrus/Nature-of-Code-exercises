class Crate {
  PVector position;
  PVector velocity;
  PVector accelereation;

  float scale;
  float mass;

  Crate(float x, float y, float s) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    accelereation = new PVector(0, 0);

    mass = s * s * s;
    scale = s;
  }

  void display() {
    rectMode(CENTER);
    stroke(90, 40, 30);
    strokeWeight(3);
    fill(180, 80, 60);
    rect(position.x, position.y, scale, scale);
  }

  void update() {
    velocity.add(accelereation);
    position.add(velocity);
  }

  void applyForce(PVector force) {
    PVector f = force.copy();
    f.div(mass);
    velocity.add(f);
  }

  void checkEdges() {
    if (position.y + scale / 2 > height) {
      position.y = height - scale / 2;
      velocity.mult(-1);
    }
  }

  boolean isInside(Water object) {
    if (position.x - scale / 2 > object.x && position.x + scale / 2 < object.x + object.w && position.y + scale / 2 > object.y && position.y + scale / 2 < object.y + object.h) {
      return(true);
    } else {
      return(false);
    }
  }


  void drag(Water object) {
    float speed = velocity.mag();
    PVector force = velocity.copy();
    force.setMag(object.c * speed * speed);
    applyForce(force);
  }
}