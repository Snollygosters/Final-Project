public Player player;
PImage bg;
int bgx = 0;
PImage aj;

void setup() {
  BlackBox.init(this);
  size(800,600);
  player = new Player();
  bg = loadImage("Magnet.png");
  aj = loadImage("Andrew Jordan.gif");
}
  void keyPressed() {
    if (key == 'w'){
      player.limit = player.y-200;
      if(player.y<player.limit) {
        player.jump = false;
      }
      else
        player.jump = true;
    }
  }
  
  void drawBg(){
    image(bg, bgx, 0);
  }

void draw() {
//**********background*************
   if(player.x>width-200){
    if (BlackBox.isKeyDown(BlackBox.VK_D))
      bgx-=15;
     if (bgx<-7200)
       bgx = 0 + width;
       drawBg();
   }
   else
     drawBg();
  
  println(player.gr);
  //background(155);
  player.tick();

}
