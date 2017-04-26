//font
PFont header; //Roboto Light for headers
PFont reg; //Roboto Thin for everything else

//color array for our colors
public color[] colorArray = {color(112,174,227)};
//key = {[0]background blue}

//setup for screens
final int main_screen = 0; //main menu screen, opens upon run
final int new_screen = 1; //new game with player setup, navigate from main menu
final int pause_screen = 2; //pause screen with instructions for during game
final int game_screen = 3; //screen for game
final int transition_screen = 4; //screen for between players
final int end_screen = 5; //for game results and restart game
int state = game_screen; //CAN TEST STATES HERE, BUT BEFORE WE SUBMIT, CHANGE BACK TO MAIN_SCREEN

//Board
board b;

//players
Competitors compete;
String[] names;

//buttons
Button start; //start new game button
Button exit; //exit game button

void setup() {
  size(900,800); //try not to change the size anymore
  header = loadFont("Roboto-Light-48.vlw");
  reg = loadFont("Roboto-Thin-48.vlw");
  textFont(header, 48);
  
  b = new board();
  names = new String[1];
  compete = new Competitors(names);
  
  //button setups
  start = new Button(colorArray[0], width/2, height/3 * 2, 170, 90, "New Game", 32);
  exit = new Button(colorArray[0], width/2, height /3 * 2.5, 170, 90, "Exit Game", 32);
  
}


void draw() {
  //background(100);
  
  //handle screens here
  switch (state) {
    case main_screen:
      showMain(); //show main menu at the start of every game
      break;
    case new_screen:
      showNew(); //show new menu for player setup
      break;
    case pause_screen:
      showPause(); //show pause screen with instructions
      break;
    case game_screen:
      showGame(); //everything game related here
      break;
    case transition_screen:
      showTransition(); //show transition screen between players
      break;
    case end_screen:
      showEnd(); //show end screen at the end of a game
      break;
  }

}

//everything for main menu
void showMain() {
  background(color(240));
  
  strokeWeight(3);
  stroke(colorArray[0]);
  fill(color(255));
  rect(width/2, height/2, 700, 700);
  
  textAlign(CENTER, CENTER);
  fill(colorArray[0]);
  textFont(header, 50);
  text("COLLEGE CATAN", width/2, height/4);
  fill(color(0));
  textFont(reg, 38);
  text("a collegiate version of\nSettlers of Catan", width/2, height/4 + 150);
  
  textFont(reg);
  start.changeVisibility(true);
  start.update();
  exit.changeVisibility(true);
  exit.update();
   
}

//everything for new game menu
void showNew() {
  start.changeVisibility(false);
  exit.changeVisibility(false);
  background(color(240));
  
  //player setup here
}

//everything for pause screen
void showPause() {
//pause screen with instructions  
}

//everything for actual game play
void showGame() { 
  background(colorArray[0]);
  
  b.display();
  compete.update();
}


//everything for transition screen between players
void showTransition() {
//transition screen with a "I'm ready" button  
}

//everythng for the end screen
void showEnd() {
//results and option to restart or exit  

}


//method for button functions
void mousePressed() {
  if (start.isOver()) {
    state = new_screen;
  }
  if (exit.isOver()) {
    exit();  
  }
}