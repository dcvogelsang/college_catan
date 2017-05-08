

void cursorDisplay() {
  //PImage cursr = loadImage("pencil.png");
  //cursor(cursr);
  noCursor();
  noStroke();
  for (int i = 0; i<m.length-1; i++) {
    // and shift all the values down one item
    m[i] = m[i+1];
    n[i] = n[i+1]; 

    // set the fill colour to be darker the 
    // lower its index in the array
    fill(colorArray[1]-i/2);
    // and draw the circle at the position
    ellipse(m[i], n[i], i/2, i/2);
  }

  // set the last items in the array to match the mouse position
  m[m.length-1] = mouseX; 
  n[n.length-1] = mouseY;
}