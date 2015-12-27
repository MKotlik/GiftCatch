public abstract class FallObject {
  private int xPos;
  private int yPos;
  private int objWidth;
  private int objHeight;
  private int ySpeed;
  private int value;
  private int collisionMargin;
  private String boostType;

  /*
  public FallObject(){
   objWidth = 20;
   objHeight = 20;
   float objScreenRatio = width/objWidth;
   xPos = (int)(random(objScreenRatio)) * objWidth + objWidth/2;
   yPos = 0; 
   ySpeed = 1;
   value = 1;
   collisionMargin = 0;
   }
   */

  public FallObject(int objWidth, int objHeight, int ySpeed, int value, String boostType) {
    this.objWidth = objWidth;
    this.objHeight = objHeight;
    float objScreenRatio = width/objWidth;
    xPos = (int)(random(objScreenRatio)) * objWidth + objWidth/2;
    yPos = 0; 
    this.ySpeed = ySpeed;
    this.value = value;
    collisionMargin = 0;
    this.boostType = boostType;
  }

  public int getX() {
    return xPos;
  }

  public void setX(int newX) {
    xPos = newX;
  }

  public int getY() {
    return yPos;
  }

  public void setY(int newY) {
    yPos = newY;
  }

  public int getWidth() {
    return objWidth;
  }

  public int getHeight() {
    return objHeight;
  }

  public int getYSpeed() {
    return ySpeed;
  }

  public void setYSpeed(int newSpeed) {
    ySpeed = newSpeed;
  }

  public int getValue() {
    return value;
  }

  public int getMargin() {
    return collisionMargin;
  }

  public String getBoostType() {
    return boostType;
  }

  public boolean collide(int centerX, int centerY, int bagWidth, int bagHeight) {
    return (getX() >= (centerX - bagWidth/2) && getX() <= (centerX + bagWidth/2) && (getY() + getHeight()/2 - getMargin()) >= (centerY - bagHeight/2) && (getY() + getHeight()/2 - getMargin()) <= (centerY + bagHeight/2));
  }

  public abstract void move();

  public abstract void display();
}