public class Gift extends FallObject {
  public Gift() {
    super(20, 20, 1, 1);
  }

  public Gift(int ySpeed) {
    super(20, 20, ySpeed, 1);
  }

  public boolean collide(int centerX, int centerY, int bagWidth, int bagHeight) {
    return (getX() >= (centerX - bagWidth/2) && getX() <= (centerX + bagWidth/2) && (getY() + getHeight()/2 - getMargin()) >= (centerY - bagHeight/2) && (getY() + getHeight()/2 - getMargin()) <= (centerY + bagHeight/2));
  }

  public void move() {
    setY(getY() + getYSpeed());
  }

  public void display() {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(getX(), getY(), getWidth(), getHeight());
  }
}