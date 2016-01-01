public class Bag {
  private int xPos;
  private int yPos;
  private int bagWidth;
  private int bagHeight;
  private int xSpeed;
  private int originalWidth;
  private int originalSpeed;
  private String boosted;
  private int initializedBoostTime;
  private color bagColor;

  public Bag() {
    bagWidth = 100;
    bagHeight = 50;
    xPos = width/2; //Start with x in middle of screen
    yPos = height * 9/10; //Start with y 9/10 of screen down
    xSpeed = 5;
    originalWidth = bagWidth;
    originalSpeed = xSpeed;
    boosted = "no";
    initializedBoostTime = 0;
    bagColor = color(237, 0, 55);
  }

  public int getX() {
    return xPos;
  }

  public int getY() {
    return yPos;
  }

  public int getWidth() {
    return bagWidth;
  }

  public int getHeight() {
    return bagHeight;
  }

  public int getXSpeed() {
    return xSpeed;
  }

  public void move() {
    if (mouseX > xPos) {
      if (xPos + xSpeed > mouseX) { //Jump-ahead-of-mouse prevention
        if (mouseX + bagWidth/2 > width) { //Bag out-of-window prevention
          xPos = width - bagWidth/2;
        } else {
          xPos = mouseX;
        }
      } else if (!(xPos + xSpeed + bagWidth/2 > width)) {
        xPos += xSpeed;
      } else {
        xPos = xPos;
      }
    }
    if (mouseX < xPos) {
      if (xPos - xSpeed < mouseX) { //Jump-ahead-of-mouse prevention
        if (mouseX - bagWidth/2 < 0) { //Bag out-of-window prevention
          xPos = bagWidth/2;
        } else {
          xPos = mouseX;
        }
      } else if (!(xPos - xSpeed - bagWidth/2 < 0)) {
        xPos -= xSpeed;
      } else {
        xPos = xPos;
      }
    }
  }


  public void display() {
    fill(bagColor);
    rectMode(CENTER);
    rect(xPos, yPos, bagWidth, bagHeight);
  }
  
  public String getBoost(){
    return boosted;
  }

  public void acceptBoost(String boostType, int initialTime) {
    if (boostType.equals("speed_x2")) {
      boosted = boostType;
      initializedBoostTime = initialTime;
      xSpeed = xSpeed * 2;
    } else if (boostType.equals("size_x2")) {
      boosted = boostType;
      initializedBoostTime = initialTime;
      bagWidth = bagWidth * 2;
    }
  }

  public void updateBoost(int currentTime) {
    if (boosted.equals("speed_x2")) {
      if (currentTime - initializedBoostTime >= 5) {
        xSpeed = originalSpeed;
        initializedBoostTime = 0;
        boosted = "no";
      }
    } else if (boosted.equals("size_x2")) {
      if (currentTime - initializedBoostTime >= 5) {
        bagWidth = originalWidth;
        initializedBoostTime = 0;
        boosted = "no";
      }
    }
  }
}