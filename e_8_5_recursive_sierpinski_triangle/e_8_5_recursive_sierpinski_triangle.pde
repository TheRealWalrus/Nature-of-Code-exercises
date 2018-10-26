void setup() {
  size(640, 480);
  background(255);
  PVector A = new PVector(width / 10, height - 30);
  PVector B = new PVector(width - width / 10, height - 30);
  PVector side = PVector.sub(A, B);
  side.rotate(PI / 3);
  PVector C = PVector.add(B, side);
  sierpinski(A, B, C);
}

void draw() {
}

void sierpinski(PVector A, PVector B, PVector C) {
  noStroke();
  fill(0);
  triangle(A.x, A.y, B.x, B.y, C.x, C.y);

  PVector AB = PVector.sub(B, A);
  if (AB.mag() > 10) {
    PVector BC = PVector.sub(C, B);
    PVector CA = PVector.sub(A, C);

    AB.div(2);
    BC.div(2);
    CA.div(2);

    AB.add(A);
    BC.add(B);
    CA.add(C);

    fill(255);
    triangle(AB.x, AB.y, BC.x, BC.y, CA.x, CA.y);

    sierpinski(A, AB, CA);
    sierpinski(AB, B, BC);
    sierpinski(CA, BC, C);
  }
}
