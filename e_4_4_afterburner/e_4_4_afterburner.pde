import java.util.*;

Ship ship;
ArrayList<Particle> particles;

void setup() {
  size(640, 480, P2D);
  ship = new Ship(width / 2, height / 2);
  particles = new ArrayList();
  //Iterator<Particle> it = particles.iterator();
}

void draw() {
  background(0);
  //for (Particle part : particles) {
  //  part.run();
  //}
  Iterator<Particle> it = particles.iterator();
  while (it.hasNext()) {
    Particle p = it.next();
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }

  ship.display();
  ship.update();


  //println(ship.dir);
}

void keyPressed() {
  ship.setMove(keyCode, true);
}

void keyReleased() {
  ship.setMove(keyCode, false);
}