class board{
    
  square[] Squares = new square[25];
  color c1=color(255, 0, 0);
  color c2=color(0, 255, 0);
  color c3=color(0, 0, 255);
  color c4=color(0, 0, 0);
  PFont f1;
  
  board(){
    String[] types= new String[5];
    types[0]="Textbook";
    types[1]="Food";
    types[2]="Money";
    types[3]="Sleep";
    types[4]="Desert";
    int count1=1;
    int count2=0;
    for (int i=0; i<=24; i++) {
      if ((count1-1)%5==0) {
        count2+=1;
      }
      Squares[i]=new square(100+i*100-(count2-1)*500, count2*100, 100, types[int(random(0, 4))],int(random(1,7)),int(random(1,7)));
      count1+=1;
    }
    
  }
  
  void display(){
    for(square a : Squares) {
      a.display();
    }
  }
    
    
  boolean correctX(){
    if((mouseX % 100) < 10 || (mouseX % 100) > 90){
      return true; 
    }
    return false;
  }
  
  boolean correctY(){
    if((mouseY % 100) < 10 || (mouseY % 100) > 90){
      return true; 
    }
    return false;
  }
}