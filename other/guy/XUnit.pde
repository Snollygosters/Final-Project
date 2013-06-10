class XUnit {
  int h;
  int w;
  int top_y;
  int unit_x;
  int[] blocks;
  int last_x;
   
  XUnit(int _h, int _w) {
    h = _h;
    w = _w;
    blocks = new int[20];
    for (int i=0;i<20;i++) {
      if (i<=h) {
        blocks[i] = 1;
      } else {
        blocks[i] = 0;
      }
    }
    top_y = int(height-(height*h)/20);
    //println("newunit: (" + w + "," + h + ")");
  }
   
  int drawunit(int x) {
    buffer.stroke(0,255,0);
    buffer.fill(20,220,0);
     
    int i;
    unit_x = x;
    for (i=19;i>=0;i--) {
      if (blocks[i] == 1) {
        int y = int(height-(height*i)/20);
        int blockheight = int(height/20);
        buffer.rect(x,y,w,blockheight);
        //draw the mini unit
        //rect(x,y/5,w/5,blockheight/5);
      }
    }
    //if (guy_x > x+w) && (
    if ((x+w > guy_x) && (x < guy_x + 20)) {
      floor_y = top_y;
    }
     
    return x+w;
  }
   
  int drawlittleunit(int x) {
    stroke(0,255,0);
    fill(20,220,0);
     
    int i;
    for (i=19;i>=0;i--) {
      if (blocks[i] == 1) {
        int y = int(height-(height*i)/20);
        int blockheight = int(height/20);
        rect(x,y/5,w/5,blockheight/5);
      }
    }
    return x+w;
  }
   
}
