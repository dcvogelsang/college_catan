class board {
  
  square[] Squares = new square[25];
  color c1=color(255, 0, 0);
  color c2=color(0, 255, 0);
  color c3=color(0, 0, 255);
  color c4=color(0, 0, 0);
  PFont header;

  board() {
    String[] types= new String[5];
    types[0]="Textbook";
    types[1]="Food";
    types[2]="Money";
    types[3]="Sleep";
    types[4]="Desert";
    numbers = new IntList(2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 3, 4, 5, 6, 8, 9, 10, 11, 4, 5, 6, 8, 9, 10);
    boardtype = new StringList("Sleep", "Sleep", "Sleep", "Sleep", "Sleep", "Sleep", "Money", "Money", "Money", "Money", "Money", "Money", "Textbook", "Textbook", "Textbook", "Textbook", "Textbook", "Textbook", "Food", "Food", "Food", "Food", "Food", "Food", "Desert");
    boardtype.shuffle();
    numbers.shuffle();

    int count1=1;
    int count2=0;
    for (int i=0; i<=24; i++) {
      if ((count1-1)%5==0) {
        count2+=1;
      }
      Squares[i]=new square(100+i*100-(count2-1)*500, count2*100, 100, boardtype.get(i), numbers.get(i));
      count1+=1;
    }
  }

  void display() {
    rectMode(CORNER);
    strokeWeight(1);
    stroke(color(0));
    for (square a : Squares) {
      a.display();
    }
  }
 
  boolean correctX() {
    if ((mouseX % 100) < 10 || (mouseX % 100) > 90) {
      return true;
    }
    return false;
  }

  boolean correctY() {
    if ((mouseY % 100) < 10 || (mouseY % 100) > 90) {
      return true;
    }
    return false;
  }
}