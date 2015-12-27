public class Gift extends FallObject {
  public Gift() {
    super(20, 20, 1, 1, "none");
  }

  public Gift(int ySpeed) {
    super(20, 20, ySpeed, 1, "none");
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