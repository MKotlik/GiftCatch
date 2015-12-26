ArrayList<FallObject> fallObjList;
PFont mainFont;
int objCount;
Bag mainBag;
int points;

void setup() {
  size(640, 480);
  background(255);
  fallObjList  = new ArrayList<FallObject>();
  mainFont  = loadFont("ArialMT-16.vlw");
  textFont(mainFont,16);
  objCount  = 0;
  points = 0;
  //fallObjList.add(new FallObject());
  //fallObjList.get(0).move();
  //fallObjList.get(0).display();
  mainBag = new Bag();
}

void draw() {
  clear();
  background(255);
  mainBag.move();
  mainBag.display();
  fallUpdate();
  fill(0);
  text(frameRate, 20, 20);
  text(objCount, 20, 40);
  text(points, 20, 60);
}

void mousePressed() {
  fallObjList.add(new FallObject());
  objCount++;
}

void fallUpdate(){
  for (int i = 0; i < fallObjList.size(); i++) {
    fallObjList.get(i).move();
    int bagX = mainBag.getX();
    int bagY = mainBag.getY();
    int bagWidth = mainBag.getWidth();
    int bagHeight = mainBag.getHeight();
    if (fallObjList.get(i).collide(bagX,bagY,bagWidth,bagHeight)){
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