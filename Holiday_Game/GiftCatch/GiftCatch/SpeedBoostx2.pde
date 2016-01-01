public class SpeedBoostx2 extends FallObject {
  public SpeedBoostx2() {
    super(40, 40, 1, 0, "speed_x2");
  }

  public SpeedBoostx2(int ySpeed) {
    super(40, 40, ySpeed, 0, "speed_x2");
  }

  public void move() {
    setY(getY() + getYSpeed());
  }

  public void display() {
    fill(0, 255, 0);
    rectMode(CENTER);
    rect(getX(), getY(), getWidth(), getHeight());
  }
}