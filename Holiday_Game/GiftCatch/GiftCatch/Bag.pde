public class Bag {
  private int xPos;
  private int yPos;
  private int bagWidth;
  private int bagHeight;
  private int xSpeed;

  public Bag() {
    bagWidth = 80;
    bagHeight = 10;
    xPos = width/2; //Start with x in middle of screen
    yPos = height * 9/10; //Start with y 9/10 of screen down
    xSpeed = 5;
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


  public void move2() {
    if (mouseX > xPos) {
      if (xPos + xSpeed + bagWidth/2 > width) { //Bag out-of-window prevention
        xPos = width - bagWidth/2;
      } else if (xPos + xSpeed > mouseX) {
        xPos = mouseX;
      } else {
        xPos += xSpeed;
      }
    }
    if (mouseX < xPos) {
      if (xPos - xSpeed - bagWidth/2 < 0) { //Bag out-of-window prevention
        xPos = bagWidth/2;
      } else if (xPos - xSpeed < mouseX) {
        xPos = mouseX;
      } else {
        xPos -= xSpeed;
      }
    }
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
      if (xPos - xSpeed < mouseX){ //Jump-ahead-of-mouse prevention
        if (mouseX - bagWidth/2 < 0){ //Bag out-of-window prevention
          xPos = bagWidth/2;
        } else {
          xPos = mouseX;
        }
      } else if (!(xPos - xSpeed - bagWidth/2 < 0)){
        xPos -= xSpeed;
      } else {
        xPos = xPos;
      }
    }
  }


  public void display() {
    fill(0);
    rectMode(CENTER);
    rect(xPos, yPos, bagWidth, bagHeight);
  }
}