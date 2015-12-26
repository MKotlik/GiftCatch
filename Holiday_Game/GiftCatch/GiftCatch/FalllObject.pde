public class FallObject{
  private int xPos;
  private int yPos;
  private int objWidth;
  private int objHeight;
  private int ySpeed;
  private int value;
  
  public FallObject(){
    objWidth = 20;
    objHeight = 20;
    float objScreenRatio = width/objWidth;
    xPos = (int)(random(objScreenRatio) * objWidth);
    yPos = 0;
    ySpeed = 1;
    value = 1;
  }
  
  public int getX(){
    return xPos;
  }
  
  public int getY(){
    return yPos;
  }
  
  public int getWidth(){
    return objWidth;
  }
  
  public int getHeight(){
    return objHeight;
  }
  
  public int getYSpeed(){
    return ySpeed;
  }
  
  public int getValue(){
    return value;
  }
  
  public void move(){
    yPos += ySpeed;
  }
  
  public boolean collide(int centerX, int centerY, int bagWidth, int bagHeight){
    return (xPos >= (centerX - bagWidth/2) && xPos <= (centerX + bagWidth/2) && (yPos + objHeight) >= (centerY - bagHeight) && (yPos + objHeight) <= (centerY + bagHeight));
  }
  
  public void display(){
    fill(255,0,0);
    rectMode(CENTER);
    rect(xPos,yPos,objWidth,objHeight);
  }
}