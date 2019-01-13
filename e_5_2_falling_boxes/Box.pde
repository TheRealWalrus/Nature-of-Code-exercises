// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Box {
  float w, h;
  Body body;

  Box(float x_, float y_) {

    w = 16;
    h = 16;

    // 1. DEFINING THE BODY
    BodyDef bd = new BodyDef();

    // 2. CONFIGURING BODY DEFINITION
    bd.type = BodyType.DYNAMIC;
    Vec2 location = box2d.coordPixelsToWorld(x_, y_);
    bd.position.set(location);

    //bd.fixedRotation = true;

    // simulates fricion
    bd.linearDamping = 0.8;
    bd.angularDamping = 0.9;

    // for fast moving objects, more prceise collision detection
    //bd.bullet = true;

    // 3. CREATING THE BODY
    body = box2d.createBody(bd);

    // 4. SET STARTING STATE
    body.setLinearVelocity(new Vec2(0, 3));
    body.setAngularVelocity(1.2);

    // 5. DEFINING THE SHAPE
    PolygonShape ps = new PolygonShape();
    // Box2D considers the width and height of a rectangle to be the distance from the center to the edge.
    // So half of what we normally think of as width or height.
    float box2Dw = box2d.scalarPixelsToWorld(w / 2);
    float box2Dh = box2d.scalarPixelsToWorld(h / 2);
    ps.setAsBox(box2Dw, box2Dh);

    // 6. CREATING A FIXTURE
    // defininng the fixture
    FixtureDef fd = new FixtureDef();
    // assigning the fixture to the shape
    fd.shape = ps;
    // setting fixture parameters
    fd.friction = 0.3;
    fd.restitution = 0.5; // elasticity
    fd.density = 1.0;

    // 7. ATTACHING THE SHAPE TO THE BODY WITH THE FIXTURE
    body.createFixture(fd);
  }
  
  boolean isFinished() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height + 30) {
      return true;
    }
    
    return false;
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a); // Box2D coordinate system considers rotation in the opposite direction

    colorMode(HSB, 360, 100, 100);
    float hue = map(pos.y, 0, height, 0, 360);
    fill(hue, 100, 100);
    colorMode(RGB, 255, 255, 255);
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER);
    rect(0, 0, w, h);

    popMatrix();
  }
}
