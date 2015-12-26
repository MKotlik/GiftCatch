public class FallObject{
  private int xPos;
  private int yPos;
  private int objWidth;
  private int objHeight;
  private int ySpeed;
  
  public FallObject(){
    objWidth = 20;
    objHeight = 20;
    float objScreenRatio = width/objWidth;
    xPos = (int)(random(objScreenRatio) * objWidth);
    yPos = 0;
    ySpeed = 1;
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
  
  public void move(){
    yPos += ySpeed;
  }
  
  public void display(){
    fill(255,0,0);
    rectMode(CENTER);
    rect(xPos,yPos,objWidth,objHeight);
  }
}