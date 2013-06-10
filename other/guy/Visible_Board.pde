class VisibleBoard {
  ArrayList xunits;
   
  VisibleBoard() {
    xunits = new ArrayList();
    int unitheight = 5;
    for (int i=0;i<50;i++) {
      xunits.add(new XUnit(unitheight,20));
      if (random(1) < .10) {
        if (random(1) < .5) {
          if (unitheight > 0) unitheight--;
        } else {
          if (unitheight < 15) unitheight++;
        }
      }
    }
  }
   
  int stepforward() {
     
    int unitheight;
    unitheight = ((XUnit)xunits.get(xunits.size()-1)).h;
    if (random(1) < .10) {
      if (random(1) < .5) {
        if (unitheight > 1) unitheight--;
      } else {
        if (unitheight < 15) unitheight++;
      }
      xunits.add(new XUnit(unitheight,20));
      xunits.remove(0);
      return ((XUnit)xunits.get(xunits.size()-1)).w;
    } else if (random(1) < .1) {
      xunits.add(new XUnit(0,20));
      xunits.add(new XUnit(0,20));
      xunits.add(new XUnit(0,20));
      xunits.add(new XUnit(0,20));
      xunits.add(new XUnit(unitheight,20));
      xunits.remove(0);
      xunits.remove(0);
      xunits.remove(0);
      xunits.remove(0);
      xunits.remove(0);
      return 100;
      //xunits.add(new XUnit(unitheight,40));
      //xunits.remove(0);
      //return ((XUnit)xunits.get(xunits.size()-1)).w;
    } else {
      xunits.add(new XUnit(unitheight,20));
      xunits.remove(0);
      return ((XUnit)xunits.get(xunits.size()-1)).w;
    }
    //return the width of the right-most unit
    //return ((XUnit)xunits.get(xunits.size()-1)).w;
  }
   
  void drawboard_leftright(int offset) {
    XUnit unit;
    int x=offset;
    for (int i=10;i<xunits.size();i++) {
      unit = (XUnit)xunits.get(i);
      x = unit.drawunit(x);
    } 
  }
   
  void drawboard(float position,int offset) {
    XUnit unit;
    int x=width+offset;
    for (int i=(xunits.size()-1);i>1;i--) {
      unit = (XUnit)xunits.get(i);
      unit.drawunit(x);
      unit = (XUnit)xunits.get(i-1);
      //fill(255);
      //text(i,x,height/2);
      x = x-unit.w;
    }
  }
  void drawlittleboard(int offset) {
    XUnit unit;
    int x=width+offset;
    for (int i=xunits.size()-1;i>0;i--) {
      unit = (XUnit)xunits.get(i);
      unit.drawlittleunit(x);
      x = x-int(unit.w/5);
    }
  }
  int widthoflastunit() {
    return ((XUnit)xunits.get(0)).w;
//    return ((XUnit)xunits.get(xunits.size()-1)).w;
  }
   
   
  float find_floor(float x1, float w) {
     
    //the purpose of this function is to find the highest point
    //betwee x and x+w (those represent the feet of the character)
    x1 -= 100;
    float x2 = x1+w;
    float the_floor = height*2;
    XUnit unit;
    int x=width+offset;
    boolean show = false;
    if (random(1) > .98) show = true;
     
    for (int i=(xunits.size()-1);i>1;i--) {
      unit = (XUnit)xunits.get(i);
       
      //falls off a forward edge too soon
      //  if ((x >= x1) && (x <= x2)) {
      // x - start of square
      if (((x >= x1-unit.w) && (x <= x2))) {
        if (unit.top_y < the_floor) {
          the_floor = unit.top_y;
        }
      }
      x = x-unit.w;
    }
    return the_floor; 
  }
   
   
}
