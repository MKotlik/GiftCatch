public class nTextElement extends nElement {
  //Label attributes
  private String label;
  private boolean labelVisible;
  private int labelSize;
  private PFont labelFont;
  private color labelColor;
  //private int leftLabelMargin; //Not sure if I want to use margins
  //private int topLabelMargin;
  private int labelHorizontalAlign;
  private int labelVerticalAlign;
  private int labelXPos;
  private int labelYPos;

  //Constructors:
  public nTextElement() {
    super();
    setOutline();
    showOutline();
    label = "";
    labelSize = 16;
    labelHorizontalAlign = CENTER;
    labelVerticalAlign = CENTER;
    labelXPos = getXPixelPos() + getPixelWidth()/2;
    labelYPos = getYPixelPos() + getPixelHeight()/2;
  }

  public nTextElement(String identifier, int xPixelPos, int yPixelPos, int pWidth, int pHeight) {
    super(identifier, xPixelPos, yPixelPos, pWidth, pHeight);
    setOutline();
    showOutline();
    label = "";
    labelSize = 16;
    labelHorizontalAlign = CENTER;
    labelVerticalAlign = CENTER;
    labelXPos = getXPixelPos() + getPixelWidth()/2;
    labelYPos = getYPixelPos() + getPixelHeight()/2;
  }

  //Label methods:
  public boolean isLabelVisible() {
    return labelVisible;
  }

  public void setLabelVisible(boolean newVisibility) {
    labelVisible = newVisibility;
  }

  public void showLabel() {
    labelVisible = true;
  }

  public void hideLabel() {
    labelVisible = false;
  }

  public String getLabel() {
    return label;
  }

  public void setLabel(String newLabel) {
    label = newLabel;
  }

  public void setLabel(String newLabel, int newSize, color newColor, PFont newFont) {
    label = newLabel;
    labelSize = newSize;
    labelColor = newColor;
    labelFont = newFont;
  }

  public void setLabel(String newLabel, int newSize, color newColor) {
    label = newLabel;
    labelSize = newSize;
    labelColor = newColor;
  }

  public void setLabelSize(int newSize) {
    labelSize = newSize;
  }

  public void setLabelColor(color newColor) {
    labelColor = newColor;
  }

  public void setLabelFont(PFont newFont) {
    labelFont = newFont;
  }

  //Not sure if I want to use these
  /*
  public void setLeftLabelMargin(int margin) {
   leftLabelMargin = margin;
   }
   
   public void setTopLabelMargin(int margin){
   topLabelMargin = margin;
   }
   */

  public void setLabelHorizontalAlign (int alignValue) {
    labelHorizontalAlign = alignValue;
    resetDefaultLabelPositions();
  }

  public void setLabelVerticalAlign (int alignValue) {
    labelVerticalAlign = alignValue;
    resetDefaultLabelPositions();
  }

  public void setLabelAlignments(int horizontalAlign, int verticalAlign) {
    labelHorizontalAlign = horizontalAlign;
    labelVerticalAlign = verticalAlign;
    resetDefaultLabelPositions();
  }

  private void resetDefaultLabelPositions() {
    if (labelHorizontalAlign == CENTER && labelVerticalAlign == CENTER) {
      labelXPos = getXPixelPos() + getPixelWidth()/2;
      labelYPos = getYPixelPos() + getPixelHeight()/2;
    } else if (labelHorizontalAlign == LEFT && labelVerticalAlign == CENTER){
      labelXPos = getXPixelPos() + 2;
      labelYPos = getYPixelPos() + getPixelHeight()/2;
    } else {
      println("INFO: We apologize, but alignments other than CENTER, CENTER & LEFT, CENTER, are not supported right now.");
    }
  }

  public void setLabelXPos(int newXPos) {
    labelXPos = newXPos;
  }

  public void setLabelYPos(int newYPos) {
    labelYPos = newYPos;
  }

  //get methods for label size, color, and font

  public void display() {
    if (isOutlineVisible() && getOutlineState() == true) {
      stroke(getOutlineColor());
      strokeWeight(getOutlineWeight());
    } else {
      noStroke();
    }
    if (isBackgroundVisible() && ! getBackgroundState().equals("NONE")) {
      if (getBackgroundState().equals("COLOR")) {
        fill(getBackgroundColor());
      } else if (getBackgroundState().equals("IMAGE")) {
        noFill();
        //Implement background image support here!
      }
    } else {
      noFill();
    }
    rectMode(CORNER);
    rect(getXPixelPos(), getYPixelPos(), getPixelWidth(), getPixelHeight());
    if (labelVisible) {
      if (labelFont != null) {
        textFont(labelFont, labelSize);
      }
      textAlign(labelHorizontalAlign, labelVerticalAlign);
      fill(labelColor);
      textSize(labelSize);
      //text(label, getXPixelPos() + leftLabelMargin, getYPixelPos() + topLabelMargin);
      text(label, labelXPos, labelYPos);
    }
  }

  public boolean checkMouse(int nMouseX, int nMouseY) {
    return (nMouseX >= getXPixelPos() && nMouseX <= (getXPixelPos() + getPixelWidth()) && nMouseY >= getYPixelPos() && nMouseY <= (getYPixelPos() + getPixelHeight()));
  }
}