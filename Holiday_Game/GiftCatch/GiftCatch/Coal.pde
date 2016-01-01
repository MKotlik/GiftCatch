public class Coal extends FallObject {
  public Coal() {
    super(40, 40, 1, -1, "none");
  }

  public Coal(int ySpeed) {
    super(40, 40, ySpeed, -1, "none");
  }

  public void move() {
    setY(getY() + getYSpeed());
  }

  public void display() {
    fill(0);
    rectMode(CENTER);
    rect(getX(), getY(), getWidth(), getHeight());
  }
}