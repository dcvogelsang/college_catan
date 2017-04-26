

class Player{
  String name;
  //ArrayList< > resources;
  //ArrayList< > built;
  
  Player(String n){
    name = n;
    //resources = ;
    //build = ;
   
  }
  
  void turn(){
    this.build();
    
    
    this.display();
  }
  
  /*
  void display(){//displays the player's objects and resources owned
    //for 
    
    
    
  }
  
  void build(){
    if(mousePressed){
      if(b.correctX() && b.correctY()){
        rectMode(CENTER);
        rect((round((mouseX + 49)/100)*100), round((mouseY + 49)/100)*100, 30, 30);
        
      }
      
    }
    
  }
  
}