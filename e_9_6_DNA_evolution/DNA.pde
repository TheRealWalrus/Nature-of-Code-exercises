class DNA {
  String target = "to be or not to be";
  char[] genes = new char[target.length()];
  float mutationRate = 0.2;
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

    // TODO: overload constructor
    DNA child = new DNA();

    for (int i = 0; i < target.length(); i++) {

      if (random(1) < 0.5) {
        child.genes[i] = this.genes[i];
      } else {
        child.genes[i] = partner.genes[i];
      }
    }

    return child;
  }

  void mutate() {
    // Looking at each gene in the array
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < mutationRate) {
        // Mutation, a new random character
        genes[i] = (char) random(32, 128);
      }
    }
  }

  @Override
    String toString() {
    return(new String(genes) + " " + fitness);
  }
}
