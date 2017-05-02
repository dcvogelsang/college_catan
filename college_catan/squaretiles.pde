class square {
  float x, y;
  float s;
  String type;
  int total;

  square(float _x, float _y, float _s, String _t, int r1, int r2) {
    x = _x;
    y = _y;
    s = _s;
    type=_t;
    total=r1+r2;
  }

  void display() {
    if (type=="Textbook") {//Textbook
      fill(255, 0, 0);
    } else if (type=="Sleep") {//Sleep
      fill(0, 0, 255);
    } else if (type=="Money") {//Money
      fill(0, 255, 0);
    } else if (type=="Food") {//Food
      fill(0, 0, 0);
    } else {
      fill(255);
    }
    rect(x, y, s, s);
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(header, 30);
    text(total,x+50,y+50);
  }
}