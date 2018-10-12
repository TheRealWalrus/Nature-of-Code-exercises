class CA {
  ArrayList<int[]> history;
  int[] ruleset;
  int w = 10;

  CA() {
    ruleset = new int[]{0, 1, 0, 1, 1, 0, 1, 0};
    history = new ArrayList<int[]>();

    for (int i = 0; i < height / w; i++) {
      history.add(new int[width / w]);
    }

    int[] cells = history.get(history.size() - 1);
    cells[cells.length/2] = 1;
  }

  void display() {
    for (int i = 0; i < width/w; i++) {
      for (int j = 0; j < history.size(); j++) {
        int[] cells = history.get(j);

        if (cells[i] == 1) fill(0);
        else               fill(255);
        noStroke();
        //Set the y-location according to the generation.

        rect(i*w, j*w, w, w);
      }
    }
  }

  void run() {
    display();
    generate();
  }

  //Function to compute the next generation

  void generate() {
    int[] nextgen = new int[width/w];
    for (int i = 1; i < width/w-1; i++) {
      int[] cells = history.get(history.size() - 1);
      
      int left   = cells[i-1];
      int me     = cells[i];
      int right  = cells[i+1];
      nextgen[i] = rules(left, me, right);
    }
    history.add(nextgen);
    history.remove(0);
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
}
