

class Player{
  String name;
  //ArrayList< > resources;//list of resources owned by Player
  ArrayList<settlement> built;//list of settlements owned by Player
  //ArrayList<road> bRoad;//list of roads owned by Player
  
  Player(String n){
    name = n;
    //resources = ;
    built = new ArrayList<settlement>();
   
  }
  
  void turn(){
    
    if(mousePressed){
      switch(key){
        case '1':
          if(b.correctX() && b.correctY()){//build settlement
            this.build(1);
          }
          break;
        case '3':
          break;
      }
    }
    
  }
  
  void display(){//displays the player's objects and resources owned
    for(settlement s: built){
      s.display();
    }
    
  }
  
  void build(int type){
    //build settlement
    if (type == 1){
      built.add(new settlement(1, (round((mouseX + 49)/100)*100), round((mouseY + 49)/100)*100)); 
    }
    
    
  }
  
}