int globalVariable = 100;
int time = 10000;

ArrayList<Mover> particles = new ArrayList<Mover>();
Mover blackHole;
int resetInterval = 400;

void setup() {
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < 100; i++) {
    float px = (float) (randomGaussian() * 200 + width/2);
    float py = (float) (randomGaussian() * 200 + height/2);
    Mover p = new Mover(px, py);
    p.scale = random(5, 20);
    p.setColor(random(255), random(255), random(255), 200 + random(55));
    particles.add(p);
  }

  blackHole = new Mover(random(width), random(height));
  blackHole.scale = 50;
  blackHole.setColor(0, 0, 0, 255);
}

void draw() {
  background(255);

  blackHole.position = new PVector(mouseX, mouseY);
  blackHole.render();

  for (Mover p : particles) {
    PVector dir = PVector.sub(blackHole.position, p.position);
    dir.normalize();
    dir.mult(2);
    p.position.add(dir);
    p.render();
  }

  if (frameCount % resetInterval == 0) {
    particles.clear();
    for (int i = 0; i < 100; i++) {
      float px = (float) (randomGaussian() * 200 + width/2);
      float py = (float) (randomGaussian() * 200 + height/2);
      Mover p = new Mover(px, py);
      p.scale = random(5, 20);
      p.setColor(random(255), random(255), random(255), 200 + random(55));
      particles.add(p);
    }

    blackHole = new Mover(random(width), random(height));
    blackHole.scale = 50;
    blackHole.setColor(0, 0, 0, 255);
  }
}

//hawak mo ang beat sir?
