class Bomb {

  public static final float VELOCITY = 2;    

  private float x = 0;
  private float y = 0;
  private float a;
  private float s = 50;

  public Bomb() {
    x = player.getX();
    y = player.getY();
    a = atan((((float) mouseY) - (float) (player.getY())) / (((float) mouseX) - (float) (player.getX())));
    if (mouseX < player.getX()) {
      a += PI;
    }
  }

  public void firee() {
    x += VELOCITY * cos(a);
    y += VELOCITY * sin(a);
    fill(255, 0, 0);
    ellipse(x, y, s, s);
    if (x < 0-(s/2) || x > width+(s/2) || y < 0-(s/2) || y > height+(s/2)) {
      bombs.remove(this);
    }
  }
}

