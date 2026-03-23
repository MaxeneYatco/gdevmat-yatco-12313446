int globalVariable = 100;
int time = 10000;

Walker w;

void setup() 
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  w = new Walker();
}

void draw() 
{
  background(255);
  w.moveAndBounce();
  w.render();
}

public class Walker {
  PVector position = new PVector();
  PVector speed = new PVector(5, 8);
  color currentColor;

  Walker() {
    currentColor = color(182, 52, 100);
  }

  void render() {
    noStroke();
    fill(currentColor);
    circle(position.x, position.y, 50);
  }

  void moveAndBounce() {
    
    position.add(speed);

    // bounce on X
    if (position.x > Window.right || position.x < Window.left) {
      speed.x *= -1;
      currentColor = color(random(255), random(255), random(255));
    }

    // bounce on Y
    if (position.y > Window.top || position.y < Window.bottom) {
      speed.y *= -1;
      currentColor = color(random(255), random(255), random(255));
    }
  }
}
