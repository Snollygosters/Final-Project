class Circle {

  public static final float v = 4;

  public float getCX() { 
    return x;
  }
  public float getCY() { 
    return y;
  }
  public float getCR() { 
    return r;
  }

  protected float x;
  protected float y;
  protected float r;
  private float a;
  color c;

  Circle() {
    x=(width/4);
    y=(height/4);
    r=50;
    a=3;
    c=color(0, 255, 0);
  }

  void display() {
    fill(c);
    ellipse(x, y, r, r);
  }
}

