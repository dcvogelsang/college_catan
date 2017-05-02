//class to create buttons
//note: sets rectMode to CENTER
//note: sets textAlign to CENTER, CENTER

class Button {
  color buttonColor; //button's color
  float buttonX; //button's x position
  float buttonY; //button's y position
  float buttonWidth; //button's width
  float buttonHeight; //button's height
  int textSize; //button's text size
  String buttonText; //button's text
  boolean buttonOver = false; //boolean to check if mouse is over button
  boolean visible = false; //boolean to check if button is displayed on screen
  
  //constructor for button class
  Button(color bC, float bX, float bY, float bW, float bH, String bT, int txt) {
    buttonColor = bC;
    buttonX = bX;
    buttonY = bY;
    buttonWidth = bW;
    buttonHeight = bH;
    buttonText = bT;
    textSize = txt;
  }
  
  //method to display button
  void update() {
    isOver();
    rectMode(CENTER); //set rectMode to center
    if (buttonOver) { //if mouse is over button make it black
      fill(0);
    }
    else {
      fill(buttonColor); //if mouse is not over button use specified color
    }
    noStroke();
    rect(buttonX, buttonY, buttonWidth, buttonHeight, 8); //draw rectangular button with round corners
    if (buttonOver) { //if mouse is over button text is white
      fill(255);
    }
    else {
      fill(0); //if mouse is not over button text is black
    }
    textAlign(CENTER, CENTER); //align text to display center, center
    textSize(textSize);
    text(buttonText, buttonX, buttonY); //position text in the center of button
  }
 
  //method to check if mouse is over button
  boolean isOver() {
    if (visible == true) {
      if (mouseX >= (buttonX - (buttonWidth/2)) && mouseX <= (buttonX + (buttonWidth/2)) && mouseY >= (buttonY - (buttonHeight/2)) && mouseY <= (buttonY + (buttonHeight/2))) {
        buttonOver = true;
        return true;
      }
      else {
        buttonOver = false;
        return false;
      }
    }
    else {
      return false;
    }
  }  
 
  //method to check if button is visible
  void changeVisibility(boolean visibility) {
    visible = visibility;
  }
  
}