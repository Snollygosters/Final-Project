class Player {

  public int plife = 3;
  protected int x;
  protected int y;
  private int s = 5;
  private int d = 20;

  public Player() {
    x = (width / 2);
    y = (height / 2);
  }

  public void tick() {
    if (BlackBox.isKeyDown(BlackBox.VK_A)) {
      x-=s;
    }
    if (BlackBox.isKeyDown(BlackBox.VK_D)) {
      x+=s;
    }
    if (BlackBox.isKeyDown(BlackBox.VK_W)) {
      y-=s;
    }
    if (BlackBox.isKeyDown(BlackBox.VK_S)) {
      y+=s;
    }

    if (x - (d / 2) < 0)
      x = (d / 2);
    if (x + (d / 2) > width)
      x = width - (d / 2);
    if (y - (d / 2) < 0)
      y = (d / 2);
    if (y + (d / 2) > height)
      y = height - (d / 2);

    a=atan2(mouseY-y, mouseX-x);
    pushMatrix();
    translate(x, y);
    if (mouseX != 0) {
      rotate(a);
    }
    rectMode(CENTER);
    fill(0, 0, 255);
    rect(0, 0, d, d);
    popMatrix();
  }

  boolean iTouch() {
    if (dist(x, y, circle.getCX(), circle.getCY()) < circle.getCR()/2) {
      return true;
    }
    else {
      return false;
    }
  }

  public int getX() { 
    return x;
  }
  public int getY() { 
    return y;
  }
}

