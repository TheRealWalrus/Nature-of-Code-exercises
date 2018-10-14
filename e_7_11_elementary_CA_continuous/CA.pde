class CA {
  float[] cells;
  int[] ruleset;
  int res = 400;
  int depth = 200;
  int scl = 640;
  float breakPoint = 0.47;

  //The CA should keep track of how many generations.

  int generation = 0;

  CA() {
    cells = new float[res];
    ruleset = new int[]{0, 1, 0, 1, 1, 0, 1, 0};
    cells[cells.length/2] = 1;
  }

  void display() {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] < breakPoint) fill(107, 142, 35);
      else               fill(255);
      noStroke();

      //Set the y-location according to the generation.


      //rect(i*w, generation*w, w, w);
      float angularSize = TWO_PI / res;

      arc(width / 2, height - scl / 2, 
        scl - (generation * (scl / depth)), 
        scl - (generation * (scl / depth)), 
        PI + HALF_PI + angularSize * i, PI + HALF_PI + angularSize * (i + 1));
    }
  }

  void run() {
    display();
    generate();
  }

  //Function to compute the next generation

  void generate() {
    float[] nextgen = new float[cells.length];
    for (int i = 1; i < cells.length-1; i++) {
      float left   = cells[i-1];
      float me     = cells[i];
      float right  = cells[i+1];
      nextgen[i] = rules(left, me, right);
    }
    cells = nextgen;

    //Increment the generation counter.

    generation++;

    if (generation > depth) {
      println("process finished");
      noLoop();
    }
  }

  float rules(float _a, float _b, float _c) {
    int a;
    int b;
    int c;

    if (_a < breakPoint) a = 1;
    else                 a = 0;

    if (_b < breakPoint) b = 1;
    else                 b = 0;

    if (_c < breakPoint) c = 1;
    else                 c = 0;

    String s = "" + a + b + c;
    int index = Integer.parseInt(s, 2);

    float output;

    if (ruleset[index] == 1) output = _b - 0.2;
    else                     output = _b + 0.2;
    
    output = constrain(output, 0, 1);
    return output;
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