class Player {
  String name;
  color player_color;
  int[] resources = {2, 2, 2, 2};//list of resources owned by Player
  ArrayList<settlement> built;//list of settlements owned by Player
  ArrayList<road> bRoad;//list of roads owned by Player
  ArrayList<city> bCity;//list of roads owned by Player
  //boolean mClick; //false if clicked and action not taken, true if action taken
  int points;


  Player(String n, color c) {
    //mClick = false;
    player_color = c;
    name = n;
    built = new ArrayList<settlement>();
    bCity = new ArrayList<city>();
    bRoad = new ArrayList<road>();
    points = 0;
  }

  void display() {//displays the player's objects and resources owned



    for (road r : bRoad) {
      r.display();
    }
    for (settlement s : built) {
      s.display();
    }
    for (city c : bCity) {
      c.display();
    }
  }

  void turn() {//concise list of everything that happens
    build();
  }

  void build() {
    float testX, testY;

    if (mousePressed ) { //&& mClick == false){
      switch(key) {
      case '1'://build dorm (settlement)
        testX = round((mouseX + 49)/100)*100;
        testY = round((mouseY + 49)/100)*100;
        if (b.correctX() && b.correctY()) {
          if (!bExist(testX, testY)) {//test whether or not settlement can exist here
            settlement tempSettle = new settlement(1, testX, testY, player_color);
            built.add(tempSettle); 
            points += 1;
            resources[0] -= 1;
            resources[1] -= 1;
            resources[2] -= 1;
          }
        }
        //mClick = true;
        break;

      case '2'://build apartment (city)
        if (b.correctX() && b.correctY()) {
          testX = round((mouseX + 49)/100)*100;
          testY = round((mouseY + 49)/100)*100;
          for (settlement s : built) {
            if (testX == s.x && testY == s.y) {
              if (!cExist(testX, testY)) {//test whether or not city can exist here
                bCity.add(new city(2, testX, testY, player_color)); 
                points += 1;
                resources[0] -= 2;
                resources[1] -= 3;
              }
            }
          }  
          break;
        }

        //build road
      case '3':
        if (b.correctX() && !b.correctY()) { //horizontal
          testX = round((mouseX + 49)/100)*100;
          testY = round((mouseY/100)*100) + 50;
          if (!rExist(testX, testY)) {//test whether or not road can exist here
            bRoad.add(new road(1, testX, testY, player_color));
            resources[2] -= 1;
            resources[3] -= 1;
          }
        }
        if (!b.correctX() && b.correctY()) { //vertical
          testX = round((mouseX/100)*100 + 50);
          testY = round((mouseY + 49)/100)*100;
          if (!rExist(testX, testY)) {//test whether or not road can exist here
            bRoad.add(new road(2, testX, testY, player_color));
            resources[2] -= 1;
            resources[3] -= 1;
          }
        }
        break;
      }
    }
  }


  //return true if settlement already exists at location
  boolean bExist(float tX, float tY) {
    if (resources[0]<1 || resources[1]<1 || resources[2]<1) {
      return true;
    } else {
      for (settlement s : built) {
        if (s.x == tX && s.y == tY) {
          return true;
        }
      }
    }
    return false;
  }

  //return true if city already exists at location
  boolean cExist(float tX, float tY) {
    if (resources[0]<2 || resources[1]<3) {
      return true;
    } else {
      for (city c : bCity) {
        if (c.x == tX && c.y == tY) {
          return true;
        }
      }
    }
    return false;
  }

  //return true if road already exists at location
  boolean rExist(float tX, float tY) {
    if (resources[2]<1 || resources[3]<1) {
      return true;
    } else {
      for (road r : bRoad) {
        if (r.x == tX && r.y == tY) {
          return true;
        }
      }
    }
    return false;
  }
}