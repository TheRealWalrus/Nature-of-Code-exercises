class Field {

  int scl = 20;
  PVector[][] matrix = new PVector[scl][scl];
  int tileWidth = width / scl;
  int tileHeight = height / scl;
  //int currentTile = 0;

  Field() {
    for (int i = 0; i < scl; i++) {
      for (int j = 0; j < scl; j++) {
        matrix[i][j] = PVector.random2D();
      }
    }
  }

  void display() {
    for (int i = 0; i < scl; i++) {
      for (int j = 0; j < scl; j++) {
        pushMatrix();
        translate(i * tileWidth + tileWidth / 2, j * tileHeight + tileHeight / 2);
        rotate(matrix[i][j].heading());
        line(-10, 0, 10, 0);
        line(10, 0, 7, 3);
        line(10, 0, 7, -3);
        popMatrix();
      }
    }
  }

  //int currentTile(PVector _vLoc) {
  //  for (int i = 0; i < scl; i++) {
  //    for (int j = 0; j < scl; j++) {
  //      if (_vLoc.x >= i * tileWidth && _vLoc.x <= (i + 1) * tileWidth &&
  //        _vLoc.y >= j * tileHeight && _vLoc.y <= (j + 1) * tileHeight) {
  //        noFill();
  //        stroke(255, 0, 0);
  //        rect(i * tileWidth, j * tileHeight, tileWidth, tileHeight);
  //        return matrix[i][j];
  //      }
  //    }
  //  }
  //  return 4;
  //}
}
