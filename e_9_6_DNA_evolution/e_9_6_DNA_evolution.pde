import java.util.*; //<>//

float mutationRate = 0.05;
int totalPopulation = 150;
ArrayList<DNA> population = new ArrayList<DNA>();
String target = "Follow the white rabbit.";

DNA record;
int totalGenerations = 0;

void setup() {
  size(640, 480);
  initializePopulation();
  record = population.get(0);
}

void draw() {
  // SELECTION
  updateFitness();
  ArrayList<DNA> matingPool = new ArrayList<DNA>();

  Collections.sort(population, new DNAComparator());

  for (int i = 0; i < population.size(); i++) {
    for (int j = 0; j <= i; j++) {
      matingPool.add(population.get(i));
    }
  }

  // REPRODUCTION
  ArrayList<DNA> newGeneration = new ArrayList<DNA>();

  for (int i = 0; i < population.size(); i++) {
    int a = int(random(matingPool.size()));
    DNA parentA = matingPool.get(a);

    int b = int(random(matingPool.size()));
    DNA parentB  = matingPool.get(b);

    DNA child = parentA.crossover(parentB);

    child.mutate();

    newGeneration.add(child);
  }

  population = newGeneration;
  updateFitness();

  // VISUALUZATION
  background(0);
  fill(0, 255, 0);

  Collections.sort(population, new DNAComparator());

  DNA bestFromGeneration = population.get(population.size() - 1);

  if (bestFromGeneration.fitness > record.fitness) {
    record = bestFromGeneration;
  }

  //println(population.size());
  float margin = 30;
  textSize(16);
  text("Best phrase:", margin, 30);
  textSize(30);
  text(record.toString(), margin, 80);


  textSize(16);
  text("Total generations: " + totalGenerations + System.lineSeparator() +
    "Avarage fitness: " + calcAvarageFitness() + System.lineSeparator() +
    "Total population: " + totalPopulation + System.lineSeparator() +
    "Mutation rate: " + mutationRate, margin, height - 200);
    
  textSize(14);
  text(populationToString(), width / 2 + 120, 30);

  if (record.toString().equals(target)) {
    noLoop();
  }

  totalGenerations++;
}

String populationToString() {
  StringBuilder builder = new StringBuilder("Current generation:");

  for (int i = population.size() - 1; i >= 0; i--) {
    builder.append(System.lineSeparator());
    builder.append(population.get(i));
  }

  return builder.toString();
}

float calcAvarageFitness() {
  float sum = 0;

  for (int i = 0; i < population.size(); i++) {
    sum += population.get(i).fitness;
  }

  return sum / population.size();
}

void updateFitness() {
  for (int i = 0; i < population.size(); i++) {
    population.get(i).fitness();
  }
}

void initializePopulation() {
  for (int i = 0; i < totalPopulation; i++) {
    population.add(new DNA());
  }
}

void printList(List list) {
  for (int i = 0; i < list.size(); i++) {
    println(i + ". " + list.get(i));
  }
}
