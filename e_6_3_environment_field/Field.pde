class Field {

  int verticalScl = 10;
  int horizontalScl = 8;
  int[][] matrix = new int[verticalScl][horizontalScl];
  int tileWidth = width / verticalScl;
  int tileHeight = height / horizontalScl;
  //int currentTile = 0;

  Field() {
    for (int i = 0; i < verticalScl; i++) {
      for (int j = 0; j < horizontalScl; j++) {
        matrix[i][j] = floor(random(4));
      }
    }
  }

  void display() {
    for (int i = 0; i < verticalScl; i++) {
      for (int j = 0; j < horizontalScl; j++) {
        noStroke();

        if (matrix[i][j] == 0) {
          fill(#1E90FF);
        } else if (matrix[i][j] == 1) {
          fill(#228B22);
        } else if (matrix[i][j] == 2) {
          fill(#8B4513);
        } else {
          fill(#778899);
        }
        rect(i * tileWidth, j * tileHeight, tileWidth, tileHeight);
      }
    }
  }

  int currentTile(PVector _vLoc) {
    for (int i = 0; i < verticalScl; i++) {
      for (int j = 0; j < horizontalScl; j++) {
        if (_vLoc.x >= i * tileWidth && _vLoc.x <= (i + 1) * tileWidth &&
          _vLoc.y >= j * tileHeight && _vLoc.y <= (j + 1) * tileHeight) {
          noFill();
          stroke(255, 0, 0);
          rect(i * tileWidth, j * tileHeight, tileWidth, tileHeight);
          return matrix[i][j];
        }
      }
    }
    return 4;
  }
}
