

class Player{
  String name;
  //ArrayList< > resources;//list of resources owned by Player
  ArrayList<settlement> built;//list of settlements owned by Player
  ArrayList<road> bRoad;//list of roads owned by Player
  
  Player(String n){
    name = n;
    //resources = ;
    built = new ArrayList<settlement>();
    bRoad = new ArrayList<road>();
   
  }
  
  void turn(){
    
    if(mousePressed){
      switch(key){
        case '1'://build settlement
          if(b.correctX() && b.correctY()){
            this.build(1);
          }
          break;
        case '3'://build road
          if(b.correctX() && !b.correctY()){
            this.build(3);
          }
          if (!b.correctX() && b.correctY()){
            this.build(4);
          }
          break;
        case '4':
          break;
      }
    }
    
  }
  
  void display(){//displays the player's objects and resources owned
    
    for(road r: bRoad){
      r.display();
    }
    for(settlement s: built){
      s.display();
    }
    
  }
  
  void build(int type){
    //build settlement
    if (type == 1){
      built.add(new settlement(1, (round((mouseX + 49)/100)*100), round((mouseY + 49)/100)*100)); 
    }
    //build horizontal road
    if(type == 3){
       bRoad.add(new road(1, (round((mouseX + 49)/100)*100), (round((mouseY)/100)*100) + 50));
    }
    //build vertical road
    if(type == 4){
       bRoad.add(new road(2, (round((mouseX)/100)*100 + 50), round((mouseY + 49)/100)*100));
    }
    
  }
  
}