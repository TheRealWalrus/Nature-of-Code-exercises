float xoff = 0;

void setup() {
  size(640, 480);
}

void draw() {
  background(255);
  float n = noise(xoff);
  xoff += 0.005;
  n = map(n, 0, 1, -0.2, 0.2);
  branch(width / 2, height, 150, 20, n);
}

void branch(float x, float y, float len, float weight, float noise) {
  translate(x, y);

  if (x != 0) x = 0;
  if (y != 0) y = 0;

  strokeWeight(weight);
  line(0, 0, 0, -len);
  translate(0, -len);

  final float theta = PI / 6; 

  //Each branch’s length shrinks by two-thirds.
  len *= 0.66;
  weight *= 0.66;

  if (len > 2) {
    pushMatrix();
    rotate(theta + noise);

    //Subsequent calls to branch() include the length argument.
    branch(x, y, len, weight, noise);
    popMatrix();

    pushMatrix();
    rotate(-theta + noise);
    branch(x, y, len, weight, noise);
    popMatrix();
  }
}
