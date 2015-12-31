public class nButton extends nTextElement{
  
  //Constructors
  public nButton(){
    super();
    setMouseClickable(true);
    //Other interaction values can also be set to true
    //Label is nonexistant and hidden by default
  }
  
  public nButton(String identifier, int xPixelPos, int yPixelPos, int pWidth, int pHeight){
    super(identifier, xPixelPos, yPixelPos, pWidth, pHeight);
    setMouseClickable(true);
    //Other interaction values can also be set to true
    //Label is nonexistant and hidden by default
  }
}