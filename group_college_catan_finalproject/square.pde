class square {
  float x, y;
  float s;
  String type;
  int total;
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
      //fill(0, 0, 255);
      imageName = "textbooks.jpg";
    } else if (type=="Sleep") {//Sleep
      //fill(0, 0, 255);
      imageName = "sleep.jpg";
    } else if (type=="Money") {//Money
      //fill(0, 255, 0);
      imageName = "money.jpeg";
    } else if (type=="Food") {//Food
      //fill(0, 0, 0);
      imageName = "food.jpg";
    } else {
      //fill(255);
      imageName = "desert.gif";
    }
    rect(x, y, s, s);
    PImage img = loadImage(imageName);
    beginShape();
    texture(img);
    vertex(x+1, y,0,0);
    vertex(x+s-1, y,100,0);
    vertex(x+s-1, y+s,100,100);
    vertex(x+1, y+s,0,100);
    endShape();
    fill(255);
    noStroke();
    ellipse(x+45,y+55,40,40);
    stroke(1);
    fill(colorArray[0]);
    text(total, x+45, y+55);
  }
}