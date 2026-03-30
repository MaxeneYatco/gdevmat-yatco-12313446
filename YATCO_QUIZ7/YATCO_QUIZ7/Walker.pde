public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  
  public Walker()
  {
  }
  
  public void update()
  {

    float mx = mouseX - Window.widthPx / 2.0;
    float my = -(mouseY - Window.heightPx / 2.0);

    PVector mouse = new PVector(mx, my);

    PVector direction = PVector.sub(mouse, this.position);


    if (direction.mag() > 0)
    {
      direction.normalize();
      direction.mult(0.2);
    }

    this.acceleration = direction;
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.velocityLimit);
    this.position.add(this.velocity);
  }
  
  public void render()
  {
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges()
  {
    if (this.position.x > Window.right)
      this.position.x = Window.left;
    else if (this.position.x < Window.left)
      this.position.x = Window.right;
    
    if (this.position.y > Window.top)
      this.position.y = Window.bottom;
    else if (this.position.y < Window.bottom)
      this.position.y = Window.top;
  }
}
