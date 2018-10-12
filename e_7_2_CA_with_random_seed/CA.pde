class CA {
  int[] cells;
  int[] ruleset;
  int w = 10;

  //The CA should keep track of how many generations.

  int generation = 0;

  CA() {
    cells = new int[width/w];
    ruleset = new int[]{0, 1, 0, 1, 1, 0, 1, 0};
    cells[cells.length/2] = 1;
  }

  void display() {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) fill(0);
      else               fill(255);

      //Set the y-location according to the generation.

      rect(i*w, generation*w, w, w);
    }
  }

  void run() {
    display();
    generate();
  }

  //Function to compute the next generation

  void generate() {
    int[] nextgen = new int[cells.length];
    for (int i = 1; i < cells.length-1; i++) {
      int left   = cells[i-1];
      int me     = cells[i];
      int right  = cells[i+1];
      nextgen[i] = rules(left, me, right);
    }
    cells = nextgen;

    //Increment the generation counter.

    generation++;

    if (generation * w > height) {
      background(255);
      cells = new int[width/w];
      generation = 0;
      randomizeSeed();
    }
  }

  int rules(int a, int b, int c) {
    String s = "" + a + b + c;
    int index = Integer.parseInt(s, 2);
    return ruleset[index];
  }

  void randomizeRules() {
    for (int i = 0; i < ruleset.length; i++) {
      ruleset[i] = floor(random(2));
    }
    println(Arrays.toString(ruleset));
  }

  void randomizeSeed() {
    for (int i = 0; i < cells.length; i++) {
      cells[i] = floor(random(2));
    }
  }
}
