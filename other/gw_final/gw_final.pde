//GOAL: Recreate the game "Geometry Wars"
//Player is a square that shoots other shapes that either move randomly or chase the player. shapes do not "fight back" but contact with the shape = death
//using an array of shapes that generate at random times throughout the game       

public ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
public ArrayList<Bomb> bombs = new ArrayList<Bomb>();
public Player player;
public Circle circle;
float a;
PImage bg;

void setup() {
  BlackBox.init(this);
  //size(1280, 720);
  size(displayWidth, displayHeight);
  player = new Player();   
  bg = loadImage("bg.jpg");
}

void draw() {

  cursor(CROSS);
  for (int b = 0; b < width; b+=150) { // && g = 0; g < height; g+=150) 
    for (int g = 0; g < height; g+=150)
      image(bg, b, g);
  }
  //for (int g = 0; g < height; g+=150)  
  //image(bg, 0, g);
  player.tick();
  circle.display();
  for (int i = 0; i < projectiles.size(); i++) {
    projectiles.get(i).fire();
  }
  for (int i = 0; i < bombs.size(); i++) {
    bombs.get(i).firee();
  }
}

void player(int posX, int posY) {

  a=atan2(mouseY-height/2, mouseX-width/2);
  pushMatrix();
  translate(posX, posY);
  if (mouseX != 0)
    rotate(a);
  rectMode(CENTER);
  rect(0, 0, 20, 20);

  popMatrix();
}

void mousePressed() {
  if (mousePressed && (mouseButton == LEFT))
    projectiles.add(new Projectile());
  if (mousePressed && (mouseButton == RIGHT))
    bombs.add(new Bomb());
}

