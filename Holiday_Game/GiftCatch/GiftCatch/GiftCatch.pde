String mode; //MAIN_MENU, GAME, END, PAUSE
nPanel mainMenu;
ArrayList<FallObject> fallObjList;
PFont smallFont;
PFont mediumFont;
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
  //Font loading
  smallFont  = loadFont("ArialMT-16.vlw");
  mediumFont = loadFont("ArialMT-32.vlw");
  largeFont = loadFont("ArialMT-64.vlw");
  //Main menu setup
  mode = "MAIN_MENU";
  mainMenuSetup();
}

void mainMenuSetup() {
  mainMenu = new nPanel();
  background(255);
  //Title setup:
  nLabel title = new nLabel("title", 180, 50, 280, 60);
  title.setLabel("Gift Catch", 64, color(255, 0, 0), largeFont);
  title.hideOutline();
  mainMenu.addElement(title);
  //Play button setup:
  nButton playButton = new nButton("play", 180, 200, 280, 60);
  playButton.setLabel("Play", 42, color(0), mediumFont);
  playButton.showLabel();
  mainMenu.addElement(playButton);
}

void gameSetup() {
  background(255);
  fallObjList  = new ArrayList<FallObject>();
  mainBag = new Bag();
  objCount = 0;
  points = 0;
  timeInitial = currentTime();
  timeElapsed = 0;
  timeRemaining = 30;
}

void draw() {
  if (mode.equals("MAIN_MENU")) {
    mainMenuDraw();
  }
  if (mode.equals("GAME")) {
    gameDraw();
  }
}

void mainMenuDraw() {
  mainMenu.update();
  if (mainMenu.getAction().equals("play-MOUSE_CLICK")) {
    mode = "GAME";
    gameSetup();
  } else {
    mainMenu.display();
  }
}

void gameDraw() {
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
    mainBag.updateBoost(timeElapsed);
    mainBag.move();
    mainBag.display();
    fallCreate();
    fallUpdate();
    fill(0);
    textAlign(LEFT);
    textFont(smallFont, 16);
    text("FPS: " + frameRate, 20, 20);
    text("Objects: " + objCount, 20, 40);
    text("Points: " + points, 20, 60);
    text("Time: " + timeRemaining, 20, 80);
    text("Speed: " + mainBag.getXSpeed(), 20, 100); //Remove this later, and figure out another way of displaying boosts
  }
}

void fallCreate() {
  if (timeElapsed - timePrevious >= 1) {
    if (timeRemaining <= timeElapsed) {
      int randValue = (int)(random(3));
      if (randValue == 0) {
        fallObjList.add(new Coal());
        objCount++;
      } else if (randValue == 1) {
        fallObjList.add(new SpeedBoostx2());
        objCount++;
      } else {
        fallObjList.add(new Gift());
        objCount++;
      }
    } else {
      fallObjList.add(new Gift());
      objCount++;
    }
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
      checkBoost(fallObjList.get(i).getBoostType());
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

void checkBoost(String boostType) {
  //Implement main boosts (ex. time) here
  if (!(boostType.equals("none"))) {
    mainBag.acceptBoost(boostType, timeElapsed);
  }
}

int currentTime() {
  return hour() * 3600 + minute() * 60 + second();
}