class DNA {
  String target = "to be or not to be";
  char[] genes = new char[target.length()];

  float fitness;

  DNA() {
    for (int i = 0; i < genes.length; i++) {
      genes[i] = (char) random(32, 128);
    }
  }

  void fitness () {
    int score = 0;
    for (int i = 0; i < genes.length; i++) {
      if (genes[i] == target.charAt(i)) {
        score++;
      }
    }

    // Fitness is the percentage correct.
    fitness = float(score)/target.length();
  }

  DNA crossover(DNA partner) {

    // Note that the DNA is generated randomly in the constructor,
    // but we will overwrite it below with DNA from parents.
    DNA child = new DNA();

    //TODO:

    return child;
  }

  @Override
    String toString() {
    return(new String(genes) + " " + fitness);
  }
}
