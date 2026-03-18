int globalVariable = 100;
int time = 10000;

float amplitude = 5;
float frequency = 0.3;
float phase = 0;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  background(130);
  
  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  drawSineWave();
  drawCircle();
  
  phase += 0.05;
}

  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
  
void drawCartesianPlane()
{
  stroke(2);
  strokeWeight(2);
  
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i += 10)
  {
    line(i, -2, i, 2); 
    line(-2, i, 2, i);
  }
}

  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

void drawLinearFunction()
{
  color purple = color(128, 0, 128);
  fill(purple);
  noStroke();

  for (int x = -200; x <= 200; x++)
  {
    circle(x, x + 2, 5);
  
  }
}

  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

void drawQuadraticFunction()
{
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);

  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x * 10, (float)Math.pow(x, 2) + (x * 2) - 5, 5);
  }
}

  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

void drawSineWave()
{
  stroke(0, 0, 255);
  noFill();

  float scale = 2.5;

  beginShape();
  for (float x = -300; x <= 300; x += 1)
  {
    float y = amplitude * sin(frequency * x + phase);
    vertex(x * scale * 0.5, -y * scale);
  }
  endShape();
}

  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

void drawCircle()
{
  color red = color(255, 0, 0);
  fill(red);
  stroke(red);
  float radius = 50;
  
  for (int x = 0; x <= 360; x++)
  {
  circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5);
  }
}

  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

void keyPressed()
{
  if (key == 'w') amplitude += 2;
  if (key == 's') amplitude -= 2;

  if (key == 'd') frequency += 0.02;
  if (key == 'a') frequency -= 0.02;
}
