class settlement{
 int level;//level = 1 is dorm, level = 2 is apartment 
 float x, y; //x and y coordinates for center of settlement
 ArrayList<resource> supplies;
 color c;
 
  
  settlement(int l, float _x, float _y, color _c){
   level = l; 
    x = _x;
    y = _y;
    c = _c;
    supplies = new ArrayList<resource>();
    determineSupplies();
  }
  
  void display(){
    rectMode(CENTER);
    rect(x, y, 30, 30); 
    if(level == 2){//upgraded visual for cities
      fill(c);
      ellipse(x, y, 10, 10);
    }
    fill(color(c));
  }
  
  //populate the supplies array with corresponding resource
  void determineSupplies(){
    square tempS;
    int index;
    //along top of board
    if(y == 100){
      if(x == 100){//top left corner
        tempS = b.Squares[0];
        supplies.add(new resource(tempS.type));
        
      }
      else{
        if(x == 600){//top right corner
          tempS = b.Squares[4];
          supplies.add(new resource(tempS.type));
        }
        else{
          index = int(x/100 - 2);
          for(int i = 0; i < 2; i++){
            tempS = b.Squares[index + i];
            supplies.add(new resource(tempS.type));
          }
        }
      }
    }
    //along bottom of board
    if(y == 600){
      if(x == 100){//bot left corner
        tempS = b.Squares[20];
        supplies.add(new resource(tempS.type));
      }
      else{
        if(x == 600){//bot right corner
          tempS = b.Squares[24];
          supplies.add(new resource(tempS.type));
        }
        else{
          index = int(x/100 + 18);
          for(int i = 0; i < 2; i++){
            tempS = b.Squares[index + i];
            supplies.add(new resource(tempS.type));
          }
        }
      }
    }
    if(100 < y && y < 600){
      //along left edge of board
      if(x == 100){
        index = int(y/100 - 2);
          for(int i = 0; i < 2; i++){
            tempS = b.Squares[5*(index+i)];
            supplies.add(new resource(tempS.type));
          }
      }
      //along right edge of board
      if(x == 600){
        index = int(y/100 - 2);
          for(int i = 0; i < 2; i++){
            tempS = b.Squares[5*(index+i) + 4];
            supplies.add(new resource(tempS.type));
          }
      }
    }
    //middle of board
    if(100 < x && x < 600 && 100 < y && y < 600){
      index = int((y/100 - 2)*5 + x/100) - 2;
        for(int i = 0; i < 2; i++){
          tempS = b.Squares[index + i];
          supplies.add(new resource(tempS.type));
          tempS = b.Squares[index + 5 + i];
          supplies.add(new resource(tempS.type));
        }
      
    }
  }
  
  
  
}