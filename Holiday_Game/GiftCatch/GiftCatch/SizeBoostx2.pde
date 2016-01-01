public class SizeBoostx2 extends FallObject {
  public SizeBoostx2() {
    super(40, 40, 1, 0, "size_x2");
  }

  public SizeBoostx2(int ySpeed) {
    super(40, 40, ySpeed, 0, "size_x2");
  }

  public void move() {
    setY(getY() + getYSpeed());
  }

  public void display() {
    fill(255, 0, 255);
    rectMode(CENTER);
    rect(getX(), getY(), getWidth(), getHeight());
  }
}