int globalVariable = 100;
int time = 10000;

Walker[] myWalker = new Walker[10];
Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

PVector wind = new PVector(0.1, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  float spacing = (Window.right - Window.left) / 11.0;

  for (int i = 0; i < 10; i++) 
  {
    float posX = Window.left + spacing * (i + 1);
    float posY = Window.top + 50;

    myWalker[i] = new Walker();

    myWalker[i].position = new PVector(posX, posY);
    myWalker[i].mass = random(1, 5);
    myWalker[i].scale = myWalker[i].mass * 10;

    myWalker[i].r = random(255);
    myWalker[i].g = random(255);
    myWalker[i].b = random(255);
  }
}

void draw()
{
  background(255);

  ocean.render();

  for (int i = 0; i < myWalker.length; i++)
  {
    Walker w = myWalker[i];

    w.applyForce(wind);

    PVector gravity = new PVector(0, -0.15 * w.mass);
    w.applyForce(gravity);

    if (ocean.isCollidingWith(w))
    {
      PVector drag = ocean.calculateDragForce(w);
      w.applyForce(drag);
    }

    w.update();
    w.render();
    w.checkEdges();
  }
}
