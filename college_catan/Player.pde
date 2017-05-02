

class Player{
  String name;
  ArrayList<resource> resources;//list of resources owned by Player
  ArrayList<settlement> built;//list of settlements owned by Player
  ArrayList<road> bRoad;//list of roads owned by Player
  ArrayList<city> bCity;//list of roads owned by Player
  //boolean mClick; //false if clicked and action not taken, true if action taken
  int points;
  
  
  Player(String n){
    //mClick = false;
    name = n;
    resources = new ArrayList<resource>();
    built = new ArrayList<settlement>();
    bCity = new ArrayList<city>();
    bRoad = new ArrayList<road>();
    points = 0;
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
  
  void turn(){//concise list of everything that happens
    build();
    
  }
  
  void build(){
    float testX, testY;
    
    if(mousePressed ){ //&& mClick == false){
      switch(key){
        case '1'://build dorm (settlement)
          testX = round((mouseX + 49)/100)*100;
          testY = round((mouseY + 49)/100)*100;
          if(b.correctX() && b.correctY()){
            if(!bExist(testX, testY)){//test whether or not settlement can exist here
              built.add(new settlement(1, testX, testY)); 
              points += 1;
              println("settlement: ", built.size(), "  println in Player/build");
            }
          }
          //mClick = true;
          break;

        case '2'://build apartment (city)
          if(b.correctX() && b.correctY()){
              testX = round((mouseX + 49)/100)*100;
              testY = round((mouseY + 49)/100)*100;
              for(settlement s: built){
                if(testX == s.x && testY == s.y){
                  if(!cExist(testX, testY)){//test whether or not city can exist here
                    bCity.add(new city(2, testX, testY)); 
                    points += 1;
                    println("city: ", bCity.size(), "  println in Player/build");
                  }
                }
              }  
            break;
          }
      
      //build road
      case '3':
        if(b.correctX() && !b.correctY()){ //horizontal
          testX = round((mouseX + 49)/100)*100;
          testY = round((mouseY/100)*100) + 50;
          if(!rExist(testX, testY)){//test whether or not road can exist here
            bRoad.add(new road(1, testX, testY));
            println("road: ", bRoad.size(), "  println in Player/build");
          }
        }
       if (!b.correctX() && b.correctY()){ //vertical
          testX = round((mouseX/100)*100 + 50);
          testY = round((mouseY + 49)/100)*100;
          if(!rExist(testX, testY)){//test whether or not road can exist here
            bRoad.add(new road(2, testX, testY));
            println("road: ", bRoad.size(), "  println in Player/build");
          }
        }
      break;
      }
    }
  }
  
  
  //return true if settlement already exists at location
  boolean bExist(float tX, float tY){
    for(settlement s: built){
      if(s.x == tX && s.y == tY){
        return true;
      }
    }
    return false;
  }
  
  //return true if city already exists at location
  boolean cExist(float tX, float tY){
    for(city c: bCity){
      if(c.x == tX && c.y == tY){
        return true;
      }
    }
    return false;
  }
  
  //return true if road already exists at location
  boolean rExist(float tX, float tY){
    for(road r: bRoad){
      if(r.x == tX && r.y == tY){
        return true;
      }
    }
    return false;
  }
  
}