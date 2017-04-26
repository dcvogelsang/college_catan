

class Player{
  String name;
  //ArrayList< > resources;//list of resources owned by Player
  ArrayList<settlement> built;//list of settlements owned by Player
  ArrayList<road> bRoad;//list of roads owned by Player
  ArrayList<city> bCity;//list of roads owned by Player
  boolean mClick; //false if clicked and action not taken, true if action taken
  
  
  Player(String n){
    mClick = false;
    name = n;
    //resources = ;
    built = new ArrayList<settlement>();
    bCity = new ArrayList<city>();
    bRoad = new ArrayList<road>();
   
  }
  
  
  void turn(){
    //println(mClick);
    if(mousePressed && mClick == false){
      switch(key){
        case '1'://build dorm
          if(b.correctX() && b.correctY()){
            this.build(1);
            mClick = true;
          }
          break;
        case '2'://build apartment
          if(b.correctX() && b.correctY()){
            float testX = round((mouseX + 49)/100)*100;
            float testY = round((mouseY + 49)/100)*100;
            for(settlement s: built){
              if(testX == s.x && testY == s.y){
                this.build(2);
              }
            }
            break;
          }
        case '3'://build road
          if(b.correctX() && !b.correctY()){
            this.build(3);
          }
          if (!b.correctX() && b.correctY()){
            this.build(31);
          }
          break;
        case '4':
          break;
      }
      
    }
    mClick = false;
   
    
  }
  
  void display(){//displays the player's objects and resources owned
    
    for(road r: bRoad){
      r.display();
    }
    for(settlement s: built){
      s.display();
    }
    for(city c: bCity){
      c.display();
    }
    
  }
  
  void build(int type){
    //build settlement
    if (type == 1){
      built.add(new settlement(1, (round((mouseX + 49)/100)*100), round((mouseY + 49)/100)*100)); 
    }
    //build city
    if (type == 2){
      bCity.add(new city(2, (round((mouseX + 49)/100)*100), round((mouseY + 49)/100)*100)); 
      println(built.size());
    }
    //build horizontal road
    if(type == 3){
       bRoad.add(new road(1, (round((mouseX + 49)/100)*100), (round((mouseY)/100)*100) + 50));
       println(bRoad.size());
    }
    //build vertical road
    if(type == 31){
       bRoad.add(new road(2, (round((mouseX)/100)*100 + 50), round((mouseY + 49)/100)*100));
    }
    
    
    //mClick = true;
  }
  
  //void mouseClicked() {
  //  mClick = false;
  
  //}
  
  
  
}