public Player player;
PImage bg, aj, pb;
int bgx = 0, level = 0, score = 0;
Platform[] platforms = new Platform[250];

void setup() {
  BlackBox.init(this);
  size(800,600);
  player = new Player();
  
  bg = loadImage("Magnet.png");
  aj = loadImage("Andrew Jordan.gif");
  pb = loadImage("play_button.png");
  
  for (int i = 0; i < platforms.length; i++) {
    platforms[i] = new Platform((int) random(bg.width), (int) random(250, 450), (int) random(50, 300), 40);
  }
}

void drawBg() {
  imageMode(CORNER);
  if (player.x>(width - 150)) {
    if (BlackBox.isKeyDown(BlackBox.VK_D)) {
      if (bgx <= -38680) {
        bgx = -38680;
        level = 2;
      }
      else {
      bgx-=10;
      }
    }
    image(bg, bgx, 0);
  }
  else {
    image(bg, bgx, 0);
  }
}

void draw() {
  if (level == 0) {
    background(255);
    image(pb, (width/2-193), (height/2 - 46));
    if(mouseX > (width/2-193) && mouseX < (width/2+pb.width - 193)) {
      if(mouseY > (height/2-46) && mouseY < (height/2+pb.height-46)) {
        if(mousePressed == true) {
          level = 1;
        }
      }
    }
  }
  
  if (level == 1) {
    drawBg();
    
    for (Platform p : platforms) {
      fill(0);
      rect(p.x + bgx, p.pY, p.w, p.h);
    }
    
    textSize(24);
    textAlign(RIGHT);
    text("Score:" + score, 750,50);
    
    player.tick();
  }
  
  if (level == 2) {
    fill(0,255,0);
    textSize(64);
    textAlign(CENTER);
    text("You Win!", width/2, height/2 - 100);
    text("Score:" + score, width/2, height/2);
  }
}

