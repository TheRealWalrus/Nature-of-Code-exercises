class Field {

  int scl = 20;
  PVector[][] matrix = new PVector[scl][scl];
  int tileWidth = width / scl;
  int tileHeight = height / scl;
  //int currentTile = 0;
  float zoff = 0;
  boolean animate = true;
  
  Field() {
  }
  
  void update() {
    float xoff = 0;
    for (int i = 0; i < scl; i++) {
      float yoff = 0;
      for (int j = 0; j < scl; j++) {
        float theta = map(noise(xoff, yoff, zoff), 0, 1, 0, TWO_PI);
        matrix[i][j] = new PVector(cos(theta), sin(theta));   //Polar to Cartesian coordinate transformation to get x and y components of the vector
        yoff += 0.1;
      }
      xoff += 0.1;
    }
    if (animate)
      zoff += 0.02;
  }
  
  void display() {
    for (int i = 0; i < scl; i++) {
      for (int j = 0; j < scl; j++) {
        pushMatrix();
        translate(i * tileWidth + tileWidth / 2, j * tileHeight + tileHeight / 2);
        rotate(matrix[i][j].heading());
        stroke(0);
        line(-10, 0, 10, 0);
        line(10, 0, 7, 3);
        line(10, 0, 7, -3);
        popMatrix();
      }
    }
  }

  PVector currentTile(PVector _vLoc) {
    PVector vLoc = _vLoc.copy();
    vLoc.x = constrain(vLoc.x, 0, width);
    vLoc.y = constrain(vLoc.y, 0, height);

    for (int i = 0; i < scl; i++) {
      for (int j = 0; j < scl; j++) {
        if (vLoc.x >= i * tileWidth && vLoc.x <= (i + 1) * tileWidth &&
          vLoc.y >= j * tileHeight && vLoc.y <= (j + 1) * tileHeight) {
          if (debug) {
            noFill();
            stroke(255, 0, 0);
            rect(i * tileWidth, j * tileHeight, tileWidth, tileHeight);
          }
          return matrix[i][j].copy();
        }
      }
    }
    return vLoc;
  }
}