class road{
 int type;//level = 1 is dorm, level = 2 is apartment 
 float x, y; //x and y coordinates for center of settlement
  
  road(int l, float _x, float _y){
   type = l; 
    x = _x;
    y = _y;
  }
  
  void display(){
    rectMode(CENTER);
    if (type == 1){//horizontal
      rect(x, y, 10, 80); 
    }
    if (type == 2){//vertical
      rect(x, y, 80, 10); 
    }
      
  }
  
}