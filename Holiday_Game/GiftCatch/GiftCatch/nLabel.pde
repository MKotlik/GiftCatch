public class nLabel extends nTextElement{
  
  //Constructors
  public nLabel(){
    super();
    setLabel("text");
    showLabel();
    //Label defaults to "text", and is shown by default
    //All interactivity is disabled by default
  }
  
  public nLabel(String identifier, int xPixelPos, int yPixelPos, int pWidth, int pHeight){
    super(identifier, xPixelPos, yPixelPos, pWidth, pHeight);
    setLabel("text");
    showLabel();
    //Label defaults to "text", and is shown by default
    //All interactivity is disabled by default
  }
  
  public nLabel(String identifier, int xPixelPos, int yPixelPos, int pWidth, int pHeight, String labelText){
    super(identifier, xPixelPos, yPixelPos, pWidth, pHeight);
    setLabel(labelText);
    showLabel();
    //Label is specified in constructor, and is shown by default
    //All interactivity is disabled by default
  }
}