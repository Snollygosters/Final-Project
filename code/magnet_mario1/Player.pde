class Player {

  float limit;
  float x;
  float y;
  //X and Y velocity
  float xV = 10;
  float yV = 10;
  //jump
boolean jump = false;
  //size
  float d = 100;
  //gravity variable
  float gr = 0;

  public Player() {
    x = (width / 2);
    y = (height / 2);
  }

  public void tick() {

    pushMatrix();
    translate(x, y);
    rectMode(CENTER);
// if(select == 1)    
    image(aj, -50, -50);
// else if (select == 2)
//  other character
    //rect(0, 0, d, d, 5);
    popMatrix();
    
  

    //    y += yV;
    //    yV += g;

    if (yV > 9.8) {
      yV = 9.8;
    }

    if (xV > 10) {
      xV = 10;
    }

    //    if (y >= height - (d/2)){
    //      yV = (yV - g) * -1;
    //    }

    //************** movement **************

    if (BlackBox.isKeyDown(BlackBox.VK_A)) {
      x-=xV;
    }
    if (BlackBox.isKeyDown(BlackBox.VK_D)) {
      x+=xV;
    }

    //**************** jump *****************

    if (BlackBox.isKeyDown(BlackBox.VK_W)) {  
      if(y>limit){
        gr = 0;
        y-=yV;
      }
    }
    //*************** gravity *************** 
    else {
      gr = 5;
      yV += gr;
      y += yV;
    }

    if (BlackBox.isKeyDown(BlackBox.VK_S)) {
      y+=yV;
    }

    //ceilings    
    if (x - (d / 2) < 0)
      x = (d / 2);
    if (x + (d / 2) > width)
      x = width - (d / 2);
    if (y - (d / 2) < 0)
      y = (d / 2);
    if (y + (d / 2) + 50 > height)
      y = height - (d / 2) - 50;
  }
}

