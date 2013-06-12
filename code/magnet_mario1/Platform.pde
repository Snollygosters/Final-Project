class Platform{
  int x, y, w, h;

  Platform(int x, int y, int w, int h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display()
  {
    rect(x, y, w, h);
  }

//  boolean below(Player p)
//  {
//    if (p.x+p.s > x && p.x < x+w && abs(p.y-y) < p.s) return true;
//    return false;
//  }
}

