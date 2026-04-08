public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float scale;
  public float velocityLimit = 10;

  public float r, g, b;
  public float a = 255;

  public float mass;

  Walker(PVector pos, float m)
  {
    position = pos;
    mass = m;
    scale = mass * 15;
  }

  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.velocityLimit);
    this.position.add(this.velocity);

    this.acceleration.mult(0);
  }

  public void render()
  {
    noStroke();
    fill(r, g, b, a);
    circle(position.x, position.y, scale);
  }

public void checkEdges() 
{ 
  if ((position.x >= Window.right) || (position.x <= Window.left))
    {
      velocity.x *= -1;
    }
    if ((position.y >= Window.top) ||  (position.y <= Window.bottom))
    {
      velocity.y *= -1;
  } 
}

  public void setRandomColor()
  {
    r = int(random(255));
    g = int(random(255));
    b = int(random(255));
  }
}
