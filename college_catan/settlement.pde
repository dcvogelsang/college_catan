class settlement{
 int level;//level = 1 is dorm, level = 2 is apartment 
 float x, y; //x and y coordinates for center of settlement
  
  settlement(int l, float _x, float _y){
   level = l; 
    x = _x;
    y = _y;
  }
  
  void display(){
    rectMode(CENTER);
    rect(x, y, 30, 30); 
    
  }
  
}