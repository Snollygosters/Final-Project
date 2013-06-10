
VisibleBoard board;
int offset;
int cycles_running;
float step_size;
float position;
PFont font;

boolean key_forward;
boolean key_back;
float floor_y;
float guy_x;
Guy goodguy;
PGraphics buffer;
PImage img;
float running_time;
float start_time;
float stop_time;
float now;
float distance_covered;

void setup() {
  size(600,400,P2D);

  stroke(255);
  background(0);
   
  board = new VisibleBoard(); 
  offset = 0;
  font = createFont("verdana",14);
  textFont(font);
   
  goodguy = new Guy(width*.33);
  guy_x = width*.33;
  buffer = createGraphics(width, height, P2D);
  start_time = millis();
  //frameRate(30);
}
void keyPressed() {
  if (keyCode==RIGHT) {
    key_forward = true;
    //println("RIGHT");
  } else if (keyCode == UP) {
    key_back = true;
  } else if (key == ' ') {
    goodguy.jump();
  }
}
void keyReleased() {
  if (keyCode==RIGHT) {
    key_forward = false;
    step_size = 0;
    cycles_running = 0;
  } else if (keyCode == LEFT) {
    key_back = false;
  }
}
void draw() {
  if (key_forward && !key_back) {
    if (goodguy.dead == false) {
      goodguy.forward();   
    }
  }
   
  step_size = goodguy.doguy();
  distance_covered += step_size;
   
  offset = int(offset - step_size);
     
  if (offset <= -1 * board.widthoflastunit()) {
    offset = offset + board.stepforward();
  }
  buffer.beginDraw();
  buffer.background(0);
  board.drawboard(position,offset+100);
  goodguy.drawguy();
  if (goodguy.dead == false) {
    now = millis() - start_time;
  } else if (millis() - stop_time > 3000) {
    start_time = millis();
    distance_covered = 0;
    goodguy = new Guy(width*.33);
  }
  buffer.text(now,20,20);
  buffer.text(distance_covered,20,50);
   
  buffer.endDraw();
   
  img = buffer.get(0, 0, buffer.width, buffer.height);
  image(img, 0, 0);
}
   

