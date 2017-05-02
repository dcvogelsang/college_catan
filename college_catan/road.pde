class road{
 int type;//level = 1 is dorm, level = 2 is apartment 
 float x, y; //x and y coordinates for center of settlement
 color c;
  
  road(int l, float _x, float _y, color _c){
   type = l; 
    x = _x;
    y = _y;
    c = _c;
  }
  
  void display(){
    fill(color(c));
    rectMode(CENTER);
    if (type == 1){//horizontal
      rect(x, y, 10, 80); 
    }
    if (type == 2){//vertical
      rect(x, y, 80, 10); 
    }
      
  }
  
}