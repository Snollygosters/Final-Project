private Ball ball;
private Player thePlayer;
private Player bot;

void setup(){
  size(800,600);
  ball = new Ball();
  thePlayer = new Player();
  bot = new BotPlayer(ball);
  ball.setPlayer(thePlayer);
  ball.setBot(bot);
  frameRate(120);
}

void draw(){
  background(0);
  thePlayer.handle();
  bot.handle();
  ball.handle();
  fill(255);
  ellipse(ball.getPosX(), ball.getPosY(), 18, 18);
  rect(thePlayer.getX(), thePlayer.getY(), 10, 60); 
  rect(bot.getX(), bot.getY(), 10, 60);
  
}
class Ball {
    
    private int direction;
    private float topDown;
  
    private int posBX;
    private int posBY;
    
    private Player bot;
    private Player player;
    
    public Ball() {
        reset();
    }
    
    public void setPlayer(Player player) { this.player = player; }
    public void setBot(Player bot) { this.bot = bot; }
    
    public int getPosX() { return posBX; }
    public int getPosY() { return posBY; }
    
    public void reset() {
        this.direction = (int) random(-2,2);
        this.topDown = (float) random(-2,2);
        while (this.direction == 0) {
            this.direction = (int) random(-2,2);
            this.topDown = (float) random(-2,2);
        }
        this.posBX = width / 2;
        this.posBY = height / 2; 
    }
    
    /*
     * if direction = -1
     *     moving left
     * if top direction = -1
     *     moving up
     */
    
    public void handle() {
        posBX += 2 * direction;
        posBY += 2 * topDown;
        if (posBY < 9)
            topDown = 1.1;
        else if (posBY > height - 9)
            topDown = -1.1;
        if (posBX < 19) {
            if (posBY > player.getY() && posBY < player.getY() + 60) {
                 direction *= -1;
                 topDown *= -1.1;
            }
            else {
                reset();
                println("gg no re");
            }
        }
        else if (posBX > width - 19) {
           if (posBY > bot.getY() && posBY < bot.getY() + 60) {
              direction *= -1;
           }
           else {
               reset();
               println("gg no re");
           }
        }
    }
}
class Player {
    
    protected int direction;
    protected int posX;
    protected int posY;
    
    public Player() {
        this(0, 0);
    }
    
    public Player(int posX, int posY) {
        this.direction = 0;
        this.posX = posX;
        this.posY = posY;
    }
    
    public void handle() {
       posY = mouseY;
    }
    
    public int getX() { return this.posX; }
    public int getY() { return this.posY; }
}
class BotPlayer extends Player {
    
    private Ball ball;
  
    public BotPlayer(Ball ball) {
        super(width - 10, 0);
        this.ball = ball;
    }
    
    @Override
    public void handle() {
        posY = ball.getPosY() - 30;
    }
}
