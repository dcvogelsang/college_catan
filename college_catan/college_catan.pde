//font
PFont header; //Roboto Light for headers
PFont reg; //Roboto Thin for everything else

//color array for our colors
public color[] colorArray = {color(112,174,227), color(240,44,24), color(17,37,144), color(255,210,108)};
//key = {[0]background blue, catan red, catan blue, catan yellow}

//setup for screens
final int main_screen = 0; //main menu screen, opens upon run
final int new_screen = 1; //new game with player setup, navigate from main menu
final int pause_screen = 2; //pause screen with instructions during game
final int game_screen = 3; //screen for game
final int transition_screen = 4; //screen for between players
final int end_screen = 5; //for game results and restart game
int state = main_screen; //CAN TEST STATES HERE, BUT BEFORE WE SUBMIT, CHANGE BACK TO MAIN_SCREEN

boolean setup_done = false; //will be changed to true once setup is done

//Board
board b;

//players
Competitors compete;
String[] names;


//buttons
Button start; //start new game button
Button exit; //exit game button
Button instr_new; //instructions button from new screen

void setup() {
  size(900,800); //try not to change the size anymore
  header = loadFont("Roboto-Light-48.vlw");
  reg = loadFont("Roboto-Thin-48.vlw");
  textFont(header, 48);
  
  b = new board();
  names = new String[1];
  compete = new Competitors(names);
  
  //button setups
  start = new Button(colorArray[0], width/2, height/3 * 2, 180, 90, "New Game", 32);
  exit = new Button(colorArray[0], width/2, height /3 * 2.5, 180, 90, "Exit Game", 32);
  instr_new = new Button(colorArray[0], width/2, height/4 * 3, 180, 90, "Instructions", 32);
  
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
  
  //inner rectangle
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
  
  instr_new.changeVisibility(true);
  instr_new.update();
}

//everything for pause screen
void showPause() {
  instr_new.changeVisibility(false);
  
  strokeWeight(3);
  stroke(colorArray[0]);
  fill(color(255));
  rect(width/2, height/2, 750, 750);
  
  //instruction text
  textAlign(CENTER, CENTER);
  fill(colorArray[0]);
  textFont(header, 50);
  text("HOW TO PLAY", width/2, height/8);
  fill(color(0));
  textFont(header, 34);
  text("Setup:", width/2, height/8 + 60);
  textFont(reg, 24);
  text("1. Each player enters a name and selects a color.\n2. Players each place 2 roads + 2 dorms in a random order.\n3. Players receive resources for the dorms they place.", width/2, height/8 + 130);
  textFont(header, 34);
  text("Gameplay By Turn:", width/2, height/8 * 3 + 10);
  textFont(reg, 24);
  text("1. Roll die.\n2. Collect resources for the dorms + apartments.\n3. [OPTIONAL] Trade 4 of the same resource for 1 from the bank.\n4. [OPTIONAL] Build according to the resource card.", width/2, height/8 * 4);
  textFont(header, 34);
  text("Rules:", width/2, height/8 * 5);
  textFont(reg, 24);
  text("Dorms + apartments must be at least 2 roads away from each other.\nBuildings have different Victory Point values.\nThe first player to collect 10 Victory Points wins!", width/2, height/8 * 5 + 70);
  textFont(header, 34);
  text("Note:", width/2, height/8 * 6.5);
  textFont(reg, 24);
  text("When 7 is rolled, the player places the Midterm.\nResources under the Midterm cannot be collected.", width/2, height/8 * 7);
  
  
  //back button!! 
  if (setup_done == true) {
    //back goes to the game  
  }
  if (setup_done == false) {
    //back takes you to setup screen  
  }
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
  if (instr_new.isOver()) {
    instructions();   
  }
}

//method for instructions
void instructions() {
  state = pause_screen;  
}