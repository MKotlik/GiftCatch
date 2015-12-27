public class Coal extends FallObject {
  public Coal() {
    super(20, 20, 1, -1, "none");
  }

  public Coal(int ySpeed) {
    super(20, 20, ySpeed, -1, "none");
  }

  public void move() {
    setY(getY() + getYSpeed());
  }

  public void display() {
    fill(0, 0, 255);
    rectMode(CENTER);
    rect(getX(), getY(), getWidth(), getHeight());
  }
}