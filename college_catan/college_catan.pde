//libraries
import controlP5.*;
ControlP5 cp5; //setup

//font
PFont header; //Roboto Light for headers
PFont reg; //Roboto Thin for everything else

//settlers logo
PImage logo;

//color array for our colors
public color[] colorArray = {color(240,44,24), color(17,37,144), color(255,210,108)};
//key = {[0]catan red, [1]catan blue, [2]catan yellow}

//setup for screens
final int main_screen = 0; //main menu screen, opens upon run
final int new_screen = 1; //new game with player setup, navigate from main menu
final int pause_screen = 2; //pause screen with instructions during game
final int game_screen = 3; //screen for game
final int transition_screen = 4; //screen for between players
final int end_screen = 5; //for game results and restart game
int state = game_screen; //CAN TEST STATES HERE, BUT BEFORE WE SUBMIT, CHANGE BACK TO MAIN_SCREEN

boolean setup_done = false; //will be changed to true once setup is done

//Board
board b;
IntList numbers;
StringList boardtype;

//players
Competitors compete;
String[] names;

//buttons
Button start; //start new game button
Button exit; //exit game button
Button instr_new; //instructions button from new screen
Button back; //back button from instructions screen
Button smol_exit; //smol exit button
Button play; //button from new screen to start game
Button instr_game; //instructions button from game screen
Button next_turn; //next turn button from game screen

RadioButton numPlayers; //radio button list for number of players

//music
// Import Minim for sound 
import ddf.minim.*;
AudioPlayer player;
Minim minim;//audio context


void setup() {
  size(900,800); //try not to change the size anymore
  header = loadFont("Roboto-Light-48.vlw");
  reg = loadFont("Roboto-Thin-48.vlw");
  textFont(header, 48);
  logo = loadImage("settlers.png");
  
  b = new board();
  names = new String[1];
  compete = new Competitors(names);
  
  //button setups
  start = new Button(colorArray[0], width/2, height/3 * 2, 180, 90, "New Game", 32);
  exit = new Button(colorArray[0], width/2, height /3 * 2.5, 180, 90, "Exit Game", 32);
  instr_new = new Button(colorArray[0], width/2, height/4 * 3, 180, 90, "Instructions", 32);
  back = new Button(colorArray[0],400, 750, 80, 50, "Back", 25);
  smol_exit = new Button(colorArray[0], 500, 750, 80, 50, "Exit", 25);
  play = new Button(colorArray[0], width/2, height/4 * 3.5, 180, 90, "Play Game", 32);
  instr_game = new Button(colorArray[0], 750, 700, 150, 60, "Instructions", 28);
  next_turn = new Button(colorArray[0], 750, 625, 150, 60, "Next Player", 28);
  
   cp5 = new ControlP5(this);
   numPlayers = cp5.addRadioButton("Players")
            .setId(1)
            .setNoneSelectedAllowed(false)
            .setSize(150, 50)
            .setSpacingColumn(0)
            .setPosition(200, 120)
            .setItemsPerRow(4)
            .setColorLabel(colorArray[0])
            .addItem("1 Player",0)
            .addItem("2 Players",1)
            .addItem("3 Players",2)
            .addItem("4 Players",3);
  for (Toggle t:numPlayers.getItems()) {
    t.getCaptionLabel().align(CENTER,CENTER);
    t.getCaptionLabel().setFont(reg);
    t.getCaptionLabel().setSize(28);
    t.setSize(130, 40);
    t.setColorBackground(color(200));
    t.setColorActive(color(255));
    t.setColorForeground(color(255));
  }
  
  //music
  // Play music 
  minim = new Minim(this);
  player = minim.loadFile("SpringDay.mp3");
  player.play();
  player.loop();
}


void draw() {
  background(color(240));

  
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
  
  cp5.hide();
  
  //inner red square
  noStroke();
  fill(colorArray[0]);
  rect(width/2, height/2, 775, 775);
  
  //inner yellow square
  strokeWeight(4);
  stroke(colorArray[1]);
  fill(colorArray[2]);
  rect(width/2, height/2, 725, 725);
  
  imageMode(CENTER);
  logo.resize(550, 0);
  image(logo, width/2, height/4 + 20);
  
  strokeWeight(10);
  stroke(color(0));
  line(300, 180, 625, 155);
  
  textAlign(CENTER, CENTER);
  fill(color(0));
  textFont(header, 70);
  text("STUDENTS", width/2, 85);
  fill(color(0));
  textFont(reg, 38);
  text("a collegiate version of\nSettlers of Catan", width/2, height/4 + 180);
  
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
  back.changeVisibility(false);
  smol_exit.changeVisibility(false);
  
  //inner red square
  noStroke();
  fill(colorArray[0]);
  rect(width/2, height/2, 775, 775);
  
  //inner yellow square
  strokeWeight(4);
  stroke(colorArray[1]);
  fill(colorArray[2]);
  rect(width/2, height/2, 725, 725);
  
  //setup text
  textAlign(CENTER, CENTER);
  fill(colorArray[0]);
  textFont(header, 50);
  text("GAME SETUP", width/2, height/8 - 20);
  
  textFont(reg);
  textSize(20);
  cp5.show();
  instr_new.changeVisibility(true);
  instr_new.update();
  play.changeVisibility(true);
  play.update();
  
}

//everything for pause screen
void showPause() {
  cp5.hide();
  instr_new.changeVisibility(false);
  play.changeVisibility(false);
  instr_game.changeVisibility(false);
  next_turn.changeVisibility(false);
  
  //inner red square
  noStroke();
  fill(colorArray[0]);
  rect(width/2, height/2, 775, 775);
  
  //inner yellow square
  strokeWeight(4);
  stroke(colorArray[1]);
  fill(colorArray[2]);
  rect(width/2, height/2, 725, 725);
  
  //instruction text
  textAlign(CENTER, CENTER);
  fill(colorArray[0]);
  textFont(header, 50);
  text("HOW TO PLAY", width/2, height/8 - 20);
  fill(color(0));
  textFont(header, 32);
  text("Setup:", width/2, height/8 + 35);
  textFont(reg, 24);
  text("1. Each player enters a name and selects a color.\n2. Players each place 2 roads + 2 dorms in a random order.\n3. Players receive resources for the dorms they place.", width/2, height/8 + 105);
  textFont(header, 32);
  text("Gameplay By Turn:", width/2, height/8 * 3 - 15);
  textFont(reg, 24);
  text("1. Roll die.\n2. Collect resources for the dorms + apartments.\n3. [OPTIONAL] Trade 4 of the same resource for 1 from the bank.\n4. [OPTIONAL] Build according to the resource card.", width/2, height/8 * 4 - 25);
  textFont(header, 32);
  text("Rules:", width/2, height/8 * 5 - 25);
  textFont(reg, 24);
  text("Dorms + apartments must be at least 2 roads away from each other.\nBuildings have different Victory Point values.\nThe first player to collect 10 Victory Points wins!", width/2, height/8 * 5 + 45);
  textFont(header, 32);
  text("Note:", width/2, height/8 * 6.5 - 25);
  textFont(reg, 24);
  text("When 7 is rolled, the player places the Midterm.\nResources under the Midterm cannot be collected.", width/2, height/8 * 7 - 25);
  
  textFont(reg);
  back.changeVisibility(true);
  back.update();
  smol_exit.changeVisibility(true);
  smol_exit.update();
 
}

//everything for actual game play
void showGame() { 
  background(color(240));
  
  cp5.hide();
  instr_new.changeVisibility(false);
  play.changeVisibility(false);
  back.changeVisibility(false);
  smol_exit.changeVisibility(false);
  
  textFont(reg);
  instr_game.changeVisibility(true);
  instr_game.update();
  next_turn.changeVisibility(true);
  next_turn.update();
  
  
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
    state = pause_screen;   
  }
  if (back.isOver()) {
    if (setup_done == false) {
      state = new_screen;    
    }
    if (setup_done == true) {
      state = game_screen;  
    }
  }
  if (smol_exit.isOver()) {
    exit();  
  }
  if (play.isOver()) {
    setup_done = true;
    state = game_screen;  
  }
  if (instr_game.isOver()) {
    state = pause_screen;  
  }
  if (next_turn.isOver()) {
    state = transition_screen;  
  }
}

//method for extraneous key Presses
void keyPressed(){
  
  //music
  if(key == 'm'){
    if(player.isPlaying()){
      player.pause();
    }
    else{ 
     player.loop(); 
    }  
  }
}