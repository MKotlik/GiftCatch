String mode;
PFont largeFont;
PFont mediumFont;
PFont smallFont;
void setup() {
  size(640, 480);
  largeFont = loadFont("ArialMT-64.vlw");
  mediumFont = loadFont("ArialMT-32.vlw");
  smallFont = loadFont("ArialMT-16.vlw");
  mode = "start_menu";
  startMenuSetup();
}

/*
void draw() {
 }
 */

void startMenuSetup() {
  background(255);
  textFont(largeFont, 64);
  fill(255, 0, 0);
  textAlign(CENTER);
  text("Gift Catch", width/2, height * 3/23);
}