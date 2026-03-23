int globalVariable = 100;
int time = 10000;



void setup() 
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}


PVector mousePos()
{
  float x = mouseX - Window.widthPx / 2;
  float y = -(mouseY - Window.heightPx / 2);
  
  return new PVector(x, y);
}


void draw() 
{
  background(130); 
  
  PVector mouse = mousePos();
  //mouse.mult(2);
  mouse.normalize().mult(500);
  //line(0, 0, mouse.x, mouse.y);
  
  // handle
  strokeWeight(20);
  stroke(0);
  line(0, 0, -50, 0);
  
  // outter red glow
  strokeWeight(15);
  stroke(255, 0, 0);
  line(0, 0, mouse.x, mouse.y);
  
  // inner white glow
  strokeWeight(4);
  stroke(255);
  line(0, 0, mouse.x, mouse.y);
 
  
  println("Blade magnitude: " + mouse.mag());
}
