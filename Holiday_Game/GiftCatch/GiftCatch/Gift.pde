public class Gift extends FallObject {
  color redGift = color(255, 0, 0);
  color orangeGift = color(255, 128, 0);
  color yellowGift = color(255, 255, 0);
  color giftColor;
  
  public Gift() {
    super(40, 40, 1, 1, "none");
    int randomColor = (int)(random(3));
    if (randomColor == 0){
      giftColor = redGift;
    } else if (randomColor == 1){
      giftColor = orangeGift;
    } else {
      giftColor = yellowGift;
    }
  }

  public Gift(int ySpeed) {
    super(40, 40, ySpeed, 1, "none");
    int randomColor = (int)(random(3));
    if (randomColor == 0){
      giftColor = redGift;
    } else if (randomColor == 1){
      giftColor = orangeGift;
    } else {
      giftColor = yellowGift;
    }
  }

  public void move() {
    setY(getY() + getYSpeed());
  }

  public void display() {
    fill(giftColor);
    rectMode(CENTER);
    rect(getX(), getY(), getWidth(), getHeight());
  }
}