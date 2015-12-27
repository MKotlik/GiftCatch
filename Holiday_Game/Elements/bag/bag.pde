int speed;
int direction;
int xPos;
int yPos;
int bagWidth;
int bagHeight;
int bagMargin;
int sensitivity;

void setup() {
  size(640, 480);
  background(255);
  rectMode(CENTER);
  xPos = width/2;
  yPos = height * 9/10;
  bagWidth = 50;
  bagHeight = 10;
  rect(xPos, yPos, bagWidth, bagHeight);
  speed = 50;
  direction = 1;
  bagMargin = 1;
  sensitivity = 5;
}

void draw() {
  background(255);
  if (mouseX > xPos + sensitivity) {
    if (xPos + speed + bagWidth/2 > width) {
      xPos = width - bagWidth/2 - bagMargin;
    } else if (mouseX - xPos < speed) {
      xPos = mouseX;
    } else {
      xPos += speed;
    }
  }
  if (mouseX < xPos - sensitivity) {
    if (xPos - speed - bagWidth/2 < 0) {
      xPos = 0 + bagWidth/2 + bagMargin;
    } else if (mouseX - xPos > speed) {
      xPos = mouseX;
    } else {
      xPos -= speed;
    }
  }
  rect(xPos, yPos, bagWidth, bagHeight);
}

/*
void mouseClicked() {
  speed++;
}
*/