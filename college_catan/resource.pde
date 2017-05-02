class resource{
  PImage card;
  String type; //if type null, refering to a place not on board and should do nothing
  
  resource(String t){
    type = t;
    String cardName = type + ".gif";
    card = loadImage(cardName);
    
  }
  
  void display(float x){
    //x = index of card in Player's resource deck
    image(card, 100*x + 20, height - 150, 75, 100);
    
    
  }
  
}