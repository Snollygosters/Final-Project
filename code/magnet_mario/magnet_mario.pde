public Player player;
PImage bg;
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
    }
  }

void draw() {
  image(bg, 0, 0);
  println(player.gr);
  //background(155);
  player.tick();

}
