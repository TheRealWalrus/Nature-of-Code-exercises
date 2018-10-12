class GOL {
  int w = 10;
  int columns = width / w;
  int rows = height / w;

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
        if (board[i][j] == 1) fill(0);
        else               fill(255);

        //Set the y-location according to the generation.

        rect(i*w, j*w, w, w);
      }
    }
  }

  void generate() {
    int[][] next = new int[columns][rows];

    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {

        int neighbors = 0;


          for (int i = -1; i <= 1; i++) {
            for (int j = -1; j <= 1; j++) {

              //Add up all the neighbors’ states.
              int toCheckX = x+i;
              int toCheckY = y+j;

              if (toCheckX < 0) {
                toCheckX = columns - 1;
              } else if (toCheckX > columns - 1) {
                toCheckX = 0;
              }

              if (toCheckY < 0) {
                toCheckY = rows - 1;
              } else if (toCheckY > rows - 1) {
                toCheckY = 0;
              }

              neighbors += board[toCheckX][toCheckY];
            }
          }

        neighbors -= board[x][y];

        if      ((board[x][y] == 1) && (neighbors <  2)) next[x][y] = 0;
        else if ((board[x][y] == 1) && (neighbors >  3)) next[x][y] = 0;
        else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1;
        else next[x][y] = board[x][y];
      }
    }
    board = next;
  }
}
