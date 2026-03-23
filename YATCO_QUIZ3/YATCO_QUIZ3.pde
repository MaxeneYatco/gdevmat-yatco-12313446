int globalVariable = 100;
int time = 10000;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
   // Clear every 300 frames
 if (frameCount == 300)
{
  background(200);
}
  
  //  X
  float gaussianX = randomGaussian();
  float meanX = width / 2;
  float sdX = 200;
  float x = sdX * gaussianX + meanX;

  //  Y
  float y = random(0, height);

 
  float gaussianSize = randomGaussian();
  float meanSize = 20;
  float sdSize = 10;
  float diameter = abs(sdSize * gaussianSize + meanSize);

  //  Color (Random RGB + Alpha)
  float r = random(0, 255);
  float g = random(0, 255);
  float b = random(0, 255);
  float a = random(10, 100);

  noStroke();
  fill(r, g, b, a);

  circle(x, y, diameter);
}
