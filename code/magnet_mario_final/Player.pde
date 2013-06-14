class Player {
  private boolean grounded = false;
  private boolean hasReleased = true;
  private float velocityY = 0;
  private float velocityX = 0;
  private int x = 0;
  private int y = 0;

  public Player() {
    x = (width / 2);
    y = (height / 2);
  }

  public void tick() {    
    imageMode(CENTER);   
    image(aj, x, y);

    // Only allow jumping if the player is 'grounded', i.e. on the ground
    if (grounded) {
      if (BlackBox.isKeyDown(BlackBox.VK_W)) {
        if (hasReleased) {
          velocityY -= 35;
          grounded = false;
          hasReleased = false;
        } 
      }
      else {
        hasReleased = true;
      }
    }
    
    // Check for left/right movement
    if (BlackBox.isKeyDown(BlackBox.VK_A)) {
      x -= 10;
    }
    if (BlackBox.isKeyDown(BlackBox.VK_D)) {
      x += 10;
    }
    
    // Prevent moving off the screen
    if (x < 0) {
      x = 0;
      velocityX = 0;
    }
    else if ((x + aj.width) > width) {
      x = (width - aj.width);
      velocityX = 0; 
    }
    if (y < 0) {
      y = 0;
    }
    

    // Add velocities to position for movement
    x += velocityX;
    y += velocityY;

    // Slow down x velocity to prevent infinite movement
    if (velocityX > 0) {
      velocityX--;
    }
    else if (velocityX < 0) {
      velocityX++;
    }

    // Check for grounding against all platforms
    for (Platform p : platforms) {
      if ((x - bgx + (aj.width / 2)) > p.x && (x - bgx - (aj.width / 2)) < (p.x + p.w)) {
        if ((y + (aj.height / 2)) > p.pY && (y + (aj.height / 2)) < (p.pY + p.h)) {
          score++;
          if (velocityY > 0) {
            velocityY = 0;
          }
          grounded = true;
          break;
        }
      }
      grounded = false;
    }
    
    // Check for grounding against ground
    if ((y + aj.height) > height) {
      grounded = true;
      velocityY = 0;
    }

    // Apply gravity
    if (!grounded) {
      velocityY += 3;
      // Limit maximum velocity due to gravity
      if (velocityY > 35) {
        velocityY = 35;
      }
    }
  }
  //end class
}

