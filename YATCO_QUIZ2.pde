int globalVariable = 100;
int time = 10000;

Walker myWalker = new Walker();
Walker biasedWalker = new Walker();

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
}

  //+++++++++++++++++++++++++++++++++++++++++

void draw()
{ 
  println(myWalker.x, myWalker.y);
  
  myWalker.randomWalk();
  myWalker.render();
  
  biasedWalker.randomWalkBiased();
  biasedWalker.render();
}
