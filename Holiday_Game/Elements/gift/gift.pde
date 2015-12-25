import java.util.Random;
int speed;
int xPos;
int yPos;
int giftWidth;
int giftHeight;
Random randGen = new Random();

void setup(){
  size(640,480);
  background(255);
  rectMode(CENTER);
  xPos = randGen.nextInt(32) * 20;
  yPos = 0;
  giftWidth = 20;
  giftHeight = 20;
  fill(0);
  rect(xPos,yPos,giftWidth,giftHeight);
  speed = 4;
}


void draw(){
  background(255);
  yPos += speed;
  fill(0);
  rect(xPos,yPos,giftWidth,giftHeight);
}