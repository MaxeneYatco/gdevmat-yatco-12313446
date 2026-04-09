int globalVariable = 100;
int time = 10000;

Walker[] walkers = new Walker[10];

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1280, 720, P3D);
 

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();

    walkers[i].position = new PVector(
      random(Window.left, Window.right),
      random(Window.bottom, Window.top));

    walkers[i].mass = random(5, 20);
    walkers[i].scale = walkers[i].mass * 10;

    walkers[i].r = random(150, 255);
    walkers[i].g = random(150, 255);
    walkers[i].b = random(150, 255);
    
    walkers[i].a = 150;
  }
}

void draw()
{
  background(255);

  for (int i = 0; i < walkers.length; i++)
  {
    for (int j = 0; j < walkers.length; j++)
    {
      if (i != j)
      {
        walkers[i].applyForce(walkers[j].calculateAttraction(walkers[i]));
      }
    }

    walkers[i].update();
    walkers[i].checkEdges();
    walkers[i].render();
  }
}
