int globalVariable = 100;
int time = 10000;

Walker[] walkers = new Walker[10];

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();

    walkers[i].mass = i + 1;

    walkers[i].scale = walkers[i].mass * 15;

    walkers[i].position = new PVector(-500, 200);
    
    walkers[i].col = color(random(255), random(255), random(255));
  }
} 
 

void draw() 
{
  background(80);
  
  for (int i = 0; i < walkers.length; i++)
  {
  Walker w = walkers[i];

    w.applyForce(wind);
    w.applyForce(gravity);

    w.update();
    w.checkEdges();
    w.render();
  }
}
