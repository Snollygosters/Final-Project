public Player player;

void setup() {
  BlackBox.init(this);
  size(800,600);
  player = new Player();
}

void draw() {
  println(player.gr);
  background(155);
  player.tick();
}
