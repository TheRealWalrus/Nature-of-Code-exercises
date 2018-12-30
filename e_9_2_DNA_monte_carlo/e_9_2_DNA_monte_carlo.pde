DNA[] population = new DNA[100];

void setup() {
  for (int i = 0; i < population.length; i++) {
    // Initializing each member of the population
    population[i] = new DNA();
  }
}

void draw() {

  for (int i = 0; i < population.length; i++) {
    population[i].fitness();
  }
}