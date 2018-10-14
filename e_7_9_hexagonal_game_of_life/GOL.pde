//

class GOL {
  float w = 10;
  float h = w / sqrt(3) * 2;
  int columns = (int) (width / w);
  int rows = (int) (height / (h * 0.75));

  int[][] board = new int[columns][rows];

  GOL() {
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {

        //Initialize each cell with a 0 or 1.

        board[x][y] = int(random(2));
      }
    }
  }

  void run() {
    display();
    generate();
  }

  void display() {
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        if (board[i][j] == 1) fill(0, 255, 0);
        else               fill(0);

        stroke(170);
        //noStroke();

        //Set the y-location according to the generation.

        //rect(i*w, j*w, w, w);
        float offset;
        if (j % 2 == 1) offset = w / 2;
        else            offset = 0;

        hexagon(i * w + w / 2 + offset, h * 0.75 * j + h / 2, w);

        //noStroke();
        //fill(255, 0, 0);
        //textSize(12);
        //text("x: " + i, i * w + w / 2 + offset - 11, h * 0.75 * j + h / 2 - 5);
        //text("y: " + j, i * w + w / 2 + offset - 11, h * 0.75 * j + h / 2 + 9);
      }
    }
  }

  void generate() {
    int[][] next = new int[columns][rows];

    for (int x = 1; x < columns - 1; x++) {
      for (int y = 1; y < rows - 1; y++) {

        int neighbors = 0;

        neighbors += board[x][y - 1];
        neighbors += board[x][y + 1];
        neighbors += board[x - 1][y];
        neighbors += board[x + 1][y];

        if (y % 2 == 0) {
          neighbors += board[x - 1][y - 1];
          neighbors += board[x - 1][y + 1];
        } else {
          neighbors += board[x + 1][y - 1];
          neighbors += board[x + 1][y + 1];
        }

        if      ((board[x][y] == 1) && (neighbors <  2)) next[x][y] = 0;
        else if ((board[x][y] == 1) && (neighbors >  2)) next[x][y] = 0;
        else if ((board[x][y] == 0) && (neighbors == 2)) next[x][y] = 1;
        else next[x][y] = board[x][y];
      }
    }
    board = next;
  }

  void hexagon(float x, float y, float w) {
    float a = w / sqrt(3);
    PVector hexagon = PVector.fromAngle(HALF_PI);
    hexagon.setMag(a);

    beginShape();
    for (int i = 0; i < 6; i++) {
      vertex(x + hexagon.x, y + hexagon.y);
      hexagon.rotate(PI / 3);
    }
    endShape(CLOSE);
  }
}