class Platform {
  int x, pY, w, h, d;
  color c;
  
  Platform(int x, int pY, int w, int h)
  {
    this.x = x;
    this.pY = pY;
    this.w = w;
    this.h = h;
  }

  void display()
  {
    fill(c);
    x = bgx;
    rect(x, pY, w, h);
  }
}

