String mode; //MAIN_MENU, GAME, END, PAUSE
nPanel mainMenu;
nPanel pauseMenu;
nPanel endMenu;
PFont smallFont;
PFont mediumFont;
PFont largeFont;
ArrayList<FallObject> fallObjList;
Bag mainBag;
int objCount;
int points;
int timeInitial;
int timeElapsed; //Don't need both timeElapsed and timeRemaining. Choose timer-type before finishing.
int timePrevious;
int timeRemaining; //seconds
int keyTimeout; //This is in draw cycles/frames

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
  clear();
  background(255);
  mainMenu = new nPanel();
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
  clear();
  background(255);
  fallObjList  = new ArrayList<FallObject>();
  mainBag = new Bag();
  objCount = 0;
  points = 0;
  timeInitial = currentTime();
  timeElapsed = 0;
  timeRemaining = 20;
}

void pauseMenuSetup() {
  clear();
  background(255);
  pauseMenu = new nPanel();
  //Title setup:
  nLabel title = new nLabel("title", 180, 50, 280, 60);
  title.setLabel("Gift Catch", 64, color(255, 0, 0), largeFont);
  title.hideOutline();
  pauseMenu.addElement(title);
  //Resume button setup:
  nButton resumeButton = new nButton("resume", 180, 210, 280, 60);
  resumeButton.setLabel("Resume", 42, color(0), mediumFont);
  resumeButton.showLabel();
  resumeButton.setKeyClickable(true);
  resumeButton.setKeyBind('p');
  pauseMenu.addElement(resumeButton);
  //Main menu button setup:
  nButton mainMenuButton = new nButton("mainMenu", 180, 330, 280, 60);
  mainMenuButton.setLabel("Main Menu", 42, color(0), mediumFont);
  mainMenuButton.showLabel();
  mainMenuButton.setKeyClickable(true);
  mainMenuButton.setKeyBind('m');
  pauseMenu.addElement(mainMenuButton);
}

void endMenuSetup(){
  clear();
  background(255);
  endMenu = new nPanel();
  //Title setup:
  nLabel title = new nLabel("title", 180, 50, 280, 60);
  title.setLabel("Gift Catch", 64, color(255, 0, 0), largeFont);
  title.hideOutline();
  endMenu.addElement(title);
  //GameOver setup:
  nLabel gameOver = new nLabel("gameOver", 180, 130, 280, 60);
  gameOver.setLabel("Game Over", 42, color(255, 0, 0), mediumFont);
  gameOver.hideOutline();
  endMenu.addElement(gameOver);
  //Score setup:
  nLabel score = new nLabel("score", 180, 200, 280, 60);
  score.setLabel("Score: " + points, 42, color(0), mediumFont);
  score.hideOutline();
  endMenu.addElement(score);
  //Play again button setup:
  nButton playButton = new nButton("play", 180, 280, 280, 60);
  playButton.setLabel("Play Again", 42, color(0), mediumFont);
  playButton.showLabel();
  playButton.setKeyClickable(true);
  playButton.setKeyBind('p');
  endMenu.addElement(playButton);
  //Main menu button setup:
  nButton mainMenuButton = new nButton("mainMenu", 180, 360, 280, 60);
  mainMenuButton.setLabel("Main Menu", 42, color(0), mediumFont);
  mainMenuButton.showLabel();
  mainMenuButton.setKeyClickable(true);
  mainMenuButton.setKeyBind('m');
  endMenu.addElement(mainMenuButton);
}

void draw() {
  if (mode.equals("MAIN_MENU")) {
    mainMenuDraw();
  }
  if (mode.equals("GAME")) {
    gameDraw();
  }
  if (mode.equals("PAUSE")) {
    pauseMenuDraw();
  }
  if (mode.equals("END")){
    endMenuDraw();
  }
}

void mainMenuDraw() {
  clear();
  background(255);
  mainMenu.update();
  if (mainMenu.getAction().equals("play-MOUSE_CLICK")) {
    mode = "GAME";
    gameSetup();
  } else {
    mainMenu.display();
  }
}

void gameDraw() {
  if (! focused || (keyPressed && key == 'p')) {
    mode = "PAUSE";
    keyTimeout = 10; //keyTimeout for double 'p' press prevention is set here!
    pauseMenuSetup();
  }
  timePrevious = timeElapsed;
  timeElapsed = currentTime() - timeInitial;
  if (timeElapsed - timePrevious >= 1) {
    timeRemaining--;
  }
  if (timeRemaining <= 0) {
    mode = "END";
    endMenuSetup();
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

void pauseMenuDraw() {
  clear();
  background(255);
  if (keyTimeout > 0){
    keyTimeout--;
  }
  pauseMenu.update();
  if (pauseMenu.getAction().equals("resume-MOUSE_CLICK") || keyTimeout <= 0 && pauseMenu.getAction().equals("resume-KEY_CLICK")) {
    mode = "GAME";
  } else if (pauseMenu.getAction().equals("mainMenu-MOUSE_CLICK") || keyTimeout <= 0 && pauseMenu.getAction().equals("mainMenu-KEY_CLICK")) {
    mode = "MAIN_MENU";
    mainMenuSetup();
  } else {
    pauseMenu.display();
  }
}

void endMenuDraw(){
  clear();
  background(255);
  endMenu.update();
  if (endMenu.getAction().equals("play-MOUSE_CLICK") || endMenu.getAction().equals("play-KEY_CLICK")) {
    mode = "GAME";
    gameSetup();
  } else if (endMenu.getAction().equals("mainMenu-MOUSE_CLICK") || keyTimeout <= 0 && endMenu.getAction().equals("mainMenu-KEY_CLICK")) {
    mode = "MAIN_MENU";
    mainMenuSetup();
  } else {
    endMenu.display();
  }
}

void fallCreate() {
  if (timeElapsed - timePrevious >= 1) {
    if (timeRemaining <= timeElapsed) {
      int randValue = (int)(random(4));
      if (randValue == 0) {
        fallObjList.add(new Coal((int)(random(3)) + 2));
        objCount++;
      } else if (randValue == 1) {
        fallObjList.add(new SpeedBoostx2((int)(random(3)) + 2));
        objCount++;
      } else if (randValue == 2) {
        fallObjList.add(new SizeBoostx2((int)(random(3)) + 2));
        objCount++;
      } else {
        fallObjList.add(new Gift((int)(random(3)) + 2));
        objCount++;
      }
    } else {
      fallObjList.add(new Gift((int)(random(3)) + 1));
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
  if (!(boostType.equals("none")) && ! mainBag.getBoost().equals(boostType)) {
    mainBag.acceptBoost(boostType, timeElapsed);
  }
}

int currentTime() {
  return hour() * 3600 + minute() * 60 + second();
}