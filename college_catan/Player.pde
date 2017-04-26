

class Player{
  String name;
  //ArrayList< > resources;
  ArrayList<settlement> built;
  
  Player(String n){
    name = n;
    //resources = ;
    built = new ArrayList<settlement>();
   
  }
  
  void turn(){
    
    if(mousePressed){
      if(b.correctX() && b.correctY()){
        this.build();
      }
    }
    
    this.display();
  }
  
  void display(){//displays the player's objects and resources owned
    for(settlement s: built){
      s.display();
    }
    
  }
  
  void build(){
    built.add(new settlement(1, (round((mouseX + 49)/100)*100), round((mouseY + 49)/100)*100)); 
    
  }
  
}