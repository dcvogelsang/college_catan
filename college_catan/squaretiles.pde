class square {
  float x, y;
  float s;
  String type;
  int total;
  PImage img;
  String imageName;

  square(float _x, float _y, 
    float _s, String _t, int _total) {
    x = _x;
    y = _y;
    s = _s;
    type=_t;
    total=_total;
  }

  void display() {
    if (type=="Textbook") {//Textbook
      fill(255, 0, 0);
      //imageName = "textbooks.jpg";
    } else if (type=="Sleep") {//Sleep
      fill(0, 0, 255);
      //imageName = "sleep.jpg";
    } else if (type=="Money") {//Money
      fill(0, 255, 0);
      //imageName = "money.jpeg";
    } else if (type=="Food") {//Food
      fill(0, 0, 0);
      //imageName = "food.jpg";
    } else {
      fill(255);
      //imageName = "desert.jpg";
    }
    //img = loadImage(imageName);
    //image(img,x,y,s,s);
    rect(x, y, s, s);
    fill(255);
    text(total,x+45,y+55);
  }
}