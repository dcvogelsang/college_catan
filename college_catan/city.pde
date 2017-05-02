class city{
 int level;//level = 1 is dorm, level = 2 is apartment 
 float x, y; //x and y coordinates for center of settlement
 color c;
 
  
  city(int l, float _x, float _y, color _c){
   level = l; 
    x = _x;
    y = _y;
    c = _c;
  }
  
  void display(){
    rectMode(CENTER);
    rect(x, y, 30, 30); 
    if(level == 2){//upgraded visual for cities
      fill(c);
      ellipse(x, y, 10, 10);
    }
    fill(c);
  }
  
}