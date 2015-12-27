ArrayList<FallObject> fallObjList;
PFont smallFont;
PFont largeFont;
int objCount;
Bag mainBag;
int points;
int timeInitial;
int timeElapsed; //Don't need both timeElapsed and timeRemaining. Choose timer-type before finishing.
int timePrevious;
int timeRemaining;

void setup() {
  size(640, 480);
  background(255);
  fallObjList  = new ArrayList<FallObject>();
  mainBag = new Bag();
  smallFont  = loadFont("ArialMT-16.vlw");
  largeFont  = loadFont("ArialMT-64.vlw");
  objCount  = 0;
  points = 0;
  timeInitial = currentTime();
  timeElapsed = 0;
  timeRemaining = 5;
}

void draw() {
  timePrevious = timeElapsed;
  timeElapsed = currentTime() - timeInitial;
  if (timeElapsed - timePrevious >= 1) {
    timeRemaining--;
  }
  if (timeRemaining <= 0) {
    clear();
    background(255);
    fill(255, 0, 0);
    textFont(largeFont, 64);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    noLoop();
  } else {
    clear();
    background(255);
    mainBag.move();
    mainBag.display();
    fallCreate();
    fallUpdate();
    fill(0);
    textFont(smallFont,16);
    text("FPS: " + frameRate, 20, 20);
    text("Objects: " + objCount, 20, 40);
    text("Points: " + points, 20, 60);
    text("Time: " + timeRemaining, 20, 80);
  }
}

void mousePressed() { 
  fallObjList.add(new FallObject());
  objCount++;
}

int currentTime() {
  return hour() * 3600 + minute() * 60 + second();
}

void fallCreate() {
  if (timeElapsed - timePrevious >= 1) {
    fallObjList.add(new FallObject());
    objCount++;
  }
}

void fallUpdate() {
  for (int i = 0; i < fallObjList.size(); i++) {
    fallObjList.get(i).move();
    int bagX = mainBag.getX();
    int bagY = mainBag.getY();
    int bagWidth = mainBag.getWidth();
    int bagHeight = mainBag.getHeight();
    if (fallObjList.get(i).collide(bagX, bagY, bagWidth, bagHeight)) {
      points += fallObjList.get(i).getValue();
      fallObjList.remove(i);
      objCount--;
      i--;
    } else if (fallObjList.get(i).getY() > height) {
      fallObjList.remove(i);
      objCount--;
      i--;
    } else {
      fallObjList.get(i).display();
    }
  }
}