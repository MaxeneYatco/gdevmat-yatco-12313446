class Walker
{
  float x;
  float y;
  
    Walker()
  {
    x = width / 2.0;
    y = height / 2.0;
  }
  
  void render()
  {
    float r = random(0, 255);
    float g = random(0, 255);
    float b = random(0, 255);
    float a = random(50, 100);

    fill(r, g, b, a);
    noStroke();
    
    circle(x, y, 30);
  }
  
   void randomWalk()
   {
      int rng = int(random(8));

    if (rng == 0)      y += 20;        // down
    else if (rng == 1) y -= 20;        // up
    else if (rng == 2) x += 20;        // right
    else if (rng == 3) x -= 20;        // left
    else if (rng == 4) { x += 20; y += 20; } // bottom-right
    else if (rng == 5) { x -= 20; y += 20; } // bottom-left
    else if (rng == 6) { x += 20; y -= 20; } // top-right
    else if (rng == 7) { x -= 20; y -= 20; } // top-left
  }
  
  //+++++++++++++++++++++++++++++++++++++++++
  
    void randomWalkBiased()
  {
    float rng = random(1);

    if (rng < 0.4)          x += 20;   // 20% RIGHT
    else if (rng < 0.6)     x -= 40;   // 40% LEFT
    else if (rng < 0.8)     y += 20;   // 20% DOWN
    else                    y -= 20;   // 20% UP
    
    circle(x, y, 20);
    
  }
}
