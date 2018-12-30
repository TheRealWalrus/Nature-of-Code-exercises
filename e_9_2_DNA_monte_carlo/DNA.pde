class DNA {
  char[] genes = new char[18];

  DNA() {
    for (int i = 0; i < genes.length; i++) {
      // Picking randomly from a range of characters
      // with ASCII values between 32 and 128.
      // For more about ASCII:
      // http://en.wikipedia.org/wiki/ASCII[ASCII]
      genes[i] = (char) random(32,128);
    }
    
      // We are adding another variable to the
  // DNA class to track fitness.
  float fitness;

  // Function to score fitness
  void fitness () {
    int score = 0;
    for (int i = 0; i < genes.length; i++) {
      // Is the character correct?
      if (genes[i] == target.charAt(i)) {
        // If so, increment the score.
        score++;
      }
    }
    // Fitness is the percentage correct.
    fitness = float(score)/target.length();
  }
  }
}