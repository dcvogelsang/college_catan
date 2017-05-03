//libraries
import controlP5.*;
ControlP5 cp5; //setup

//font
PFont header; //Roboto Light for headers
PFont reg; //Roboto Thin for everything else

//settlers logo
PImage logo;

//color array for our colors
public color[] colorArray = {color(240,44,24), color(17,37,144), color(255,210,108), color(255,63,53), color(0,166,224), color(255,144,67), color(255)};
//key = {[0]catan red, [1]catan blue, [2]catan yellow, [3]user red, [4]user blue, [5]user orange, [6]user white}

//setup for screens
final int main_screen = 0; //main menu screen, opens upon run
final int new_screen = 1; //new game with player setup, navigate from main menu
final int pause_screen = 2; //pause screen with instructions during game
final int game_screen = 3; //screen for game
final int transition_screen = 4; //screen for between players
final int end_screen = 5; //for game results and restart game
int state = main_screen; //CAN TEST STATES HERE, BUT BEFORE WE SUBMIT, CHANGE BACK TO MAIN_SCREEN

boolean setup_done = false; //will be changed to true once setup is done
int roll_value; //for the dice roll

//Board
board b;
IntList numbers;
StringList boardtype;

//players
Competitors compete;
String[] names;
color[] playerColors;


//buttons
Button start; //start new game button
Button exit; //exit game button
Button instr_new; //instructions button from new screen
Button back; //back button from instructions screen
Button smol_exit; //smol exit button
Button play; //button from new screen to start game
Button instr_game; //instructions button from game screen
Button next_turn; //next turn button from game screen
Button roll; //roll button for next player

RadioButton numPlayers; //radio button list for number of players
RadioButton player1color; //radio button list for player1 color
RadioButton player2color; //radio button list for player2 color
RadioButton player3color; //radio button list for player3 color
RadioButton player4color; //radio button list for player4 color
Textfield player1; //text field for player1
Textfield player2; //text field for player2
Textfield player3; //text field for player3
Textfield player4; //text field for player4

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
  names = new String[4];
  playerColors = new color[4];
  compete = new Competitors(names, playerColors);
  
  //button setups
  start = new Button(colorArray[0], width/2, height/3 * 2, 180, 90, "New Game", 32);
  exit = new Button(colorArray[0], width/2, height /3 * 2.5, 180, 90, "Exit Game", 32);
  instr_new = new Button(colorArray[0], width/2, height/4 * 3, 180, 90, "Instructions", 32);
  back = new Button(colorArray[0],400, 750, 80, 50, "Back", 25);
  smol_exit = new Button(colorArray[0], 500, 750, 80, 50, "Exit", 25);
  play = new Button(colorArray[0], width/2, height/4 * 3.5, 180, 90, "Play Game", 32);
  instr_game = new Button(colorArray[0], 750, 700, 150, 60, "Instructions", 28);
  next_turn = new Button(colorArray[0], 750, 625, 150, 60, "Next Player", 28);
  roll = new Button(colorArray[0], width/2, height/3 * 2, 180, 90, "Roll", 32);
  
   cp5 = new ControlP5(this);
   numPlayers = cp5.addRadioButton("Players")
            .setNoneSelectedAllowed(false)
            .setSize(160, 40)
            .setSpacingColumn(0)
            .setPosition(130, 130)
            .setItemsPerRow(4)
            .setColorLabel(color(255))
            .addItem("1 Player", 0)
            .addItem("2 Players", 1)
            .addItem("3 Players", 2)
            .addItem("4 Players", 3);
  for (Toggle t:numPlayers.getItems()) {
    t.getCaptionLabel().align(CENTER,CENTER);
    t.getCaptionLabel().setFont(reg);
    t.getCaptionLabel().setSize(28);
    t.setSize(160, 40);
    t.setColorBackground(colorArray[0]);
    t.setColorActive(colorArray[1]);
    t.setColorForeground(colorArray[1]);
  }
  
  player1 = cp5.addTextfield("Player 1")
          .setPosition(130, 205)
          .setSize(160, 40)
          .setFont(reg)
          .setAutoClear(false)
          .setColorBackground(colorArray[0])
          .setColor(colorArray[0])
          .setColorValueLabel(color(255))
          .setColorCaptionLabel(colorArray[1]);
  player1.getCaptionLabel().setFont(reg);
  player1.getCaptionLabel().setSize(28);
  player1.getValueLabel().setFont(reg);
  player1.getValueLabel().setSize(28);
  
  player1color = cp5.addRadioButton("Player 1 Color")
            .setNoneSelectedAllowed(false)
            .setSize(100, 40)
            .setSpacingColumn(0)
            .setPosition(370, 205)
            .setItemsPerRow(4)
            .setColorLabel(color(255))
            .addItem("Red", 0)
            .addItem("Blue", 1)
            .addItem("Orange", 2)
            .addItem("White", 3);
  for (Toggle u:player1color.getItems()) {
    u.getCaptionLabel().align(CENTER,CENTER);
    u.getCaptionLabel().setFont(reg);
    u.getCaptionLabel().setSize(24);
    u.setSize(100, 40);
    u.setColorBackground(colorArray[0]);
    u.setColorActive(colorArray[1]);
    u.setColorForeground(colorArray[1]);
  }
  player1color.getItem(0).setColorBackground(color(200));
  player1color.getItem(0).setColorActive(colorArray[3]);
  player1color.getItem(0).setColorForeground(colorArray[3]);
  player1color.getItem(0).getCaptionLabel().setColor(colorArray[3]);
  player1color.getItem(1).setColorBackground(color(200));
  player1color.getItem(1).setColorActive(colorArray[4]);
  player1color.getItem(1).setColorForeground(colorArray[4]);
  player1color.getItem(1).getCaptionLabel().setColor(colorArray[4]);
  player1color.getItem(2).setColorBackground(color(200));
  player1color.getItem(2).setColorActive(colorArray[5]);
  player1color.getItem(2).setColorForeground(colorArray[5]);
  player1color.getItem(2).getCaptionLabel().setColor(colorArray[5]);
  player1color.getItem(3).setColorBackground(color(200));
  player1color.getItem(3).setColorActive(colorArray[6]);
  player1color.getItem(3).setColorForeground(colorArray[6]);
  player1color.getItem(3).getCaptionLabel().setColor(colorArray[6]);
  
  player2 = cp5.addTextfield("Player 2")
          .setPosition(130, 295)
          .setSize(160, 40)
          .setFont(reg)
          .setAutoClear(false)
          .setColorBackground(colorArray[0])
          .setColor(colorArray[0])
          .setColorValueLabel(color(255))
          .setColorCaptionLabel(colorArray[1]);
  player2.getCaptionLabel().setFont(reg);
  player2.getCaptionLabel().setSize(28);
  player2.getValueLabel().setFont(reg);
  player2.getValueLabel().setSize(28);
  
  player2color = cp5.addRadioButton("Player 2 Color")
            .setNoneSelectedAllowed(false)
            .setSize(100, 40)
            .setSpacingColumn(0)
            .setPosition(370, 295)
            .setItemsPerRow(4)
            .setColorLabel(color(255))
            .addItem("R1", 0)
            .addItem("B1", 1)
            .addItem("O1", 2)
            .addItem("W1", 3);
  for (Toggle v:player2color.getItems()) {
    v.getCaptionLabel().align(CENTER,CENTER);
    v.getCaptionLabel().setFont(reg);
    v.getCaptionLabel().setSize(24);
    v.setSize(100, 40);
    v.setColorBackground(colorArray[0]);
    v.setColorActive(colorArray[1]);
    v.setColorForeground(colorArray[1]);
  }
  player2color.getItem(0).setColorBackground(color(200));
  player2color.getItem(0).setColorActive(colorArray[3]);
  player2color.getItem(0).setColorForeground(colorArray[3]);
  player2color.getItem(0).getCaptionLabel().setColor(colorArray[3]);
  player2color.getItem(1).setColorBackground(color(200));
  player2color.getItem(1).setColorActive(colorArray[4]);
  player2color.getItem(1).setColorForeground(colorArray[4]);
  player2color.getItem(1).getCaptionLabel().setColor(colorArray[4]);
  player2color.getItem(2).setColorBackground(color(200));
  player2color.getItem(2).setColorActive(colorArray[5]);
  player2color.getItem(2).setColorForeground(colorArray[5]);
  player2color.getItem(2).getCaptionLabel().setColor(colorArray[5]);
  player2color.getItem(3).setColorBackground(color(200));
  player2color.getItem(3).setColorActive(colorArray[6]);
  player2color.getItem(3).setColorForeground(colorArray[6]);
  player2color.getItem(3).getCaptionLabel().setColor(colorArray[6]);
  
  player3 = cp5.addTextfield("Player 3")
          .setPosition(130, 385)
          .setSize(160, 40)
          .setFont(reg)
          .setAutoClear(false)
          .setColorBackground(colorArray[0])
          .setColor(colorArray[0])
          .setColorValueLabel(color(255))
          .setColorCaptionLabel(colorArray[1]);
  player3.getCaptionLabel().setFont(reg);
  player3.getCaptionLabel().setSize(28);
  player3.getValueLabel().setFont(reg);
  player3.getValueLabel().setSize(28);
  
  player3color = cp5.addRadioButton("Player 3 Color")
            .setNoneSelectedAllowed(false)
            .setSize(100, 40)
            .setSpacingColumn(0)
            .setPosition(370, 385)
            .setItemsPerRow(4)
            .setColorLabel(color(255))
            .addItem("R2", 0)
            .addItem("B2", 1)
            .addItem("O2", 2)
            .addItem("W2", 3);
  for (Toggle w:player3color.getItems()) {
    w.getCaptionLabel().align(CENTER,CENTER);
    w.getCaptionLabel().setFont(reg);
    w.getCaptionLabel().setSize(24);
    w.setSize(100, 40);
    w.setColorBackground(colorArray[0]);
    w.setColorActive(colorArray[1]);
    w.setColorForeground(colorArray[1]);
  }
  player3color.getItem(0).setColorBackground(color(200));
  player3color.getItem(0).setColorActive(colorArray[3]);
  player3color.getItem(0).setColorForeground(colorArray[3]);
  player3color.getItem(0).getCaptionLabel().setColor(colorArray[3]);
  player3color.getItem(1).setColorBackground(color(200));
  player3color.getItem(1).setColorActive(colorArray[4]);
  player3color.getItem(1).setColorForeground(colorArray[4]);
  player3color.getItem(1).getCaptionLabel().setColor(colorArray[4]);
  player3color.getItem(2).setColorBackground(color(200));
  player3color.getItem(2).setColorActive(colorArray[5]);
  player3color.getItem(2).setColorForeground(colorArray[5]);
  player3color.getItem(2).getCaptionLabel().setColor(colorArray[5]);
  player3color.getItem(3).setColorBackground(color(200));
  player3color.getItem(3).setColorActive(colorArray[6]);
  player3color.getItem(3).setColorForeground(colorArray[6]);
  player3color.getItem(3).getCaptionLabel().setColor(colorArray[6]);
  
  player4 = cp5.addTextfield("Player 4")
          .setPosition(130, 475)
          .setSize(160, 40)
          .setFont(reg)
          .setAutoClear(false)
          .setColorBackground(colorArray[0])
          .setColor(colorArray[0])
          .setColorValueLabel(color(255))
          .setColorCaptionLabel(colorArray[1]);
  player4.getCaptionLabel().setFont(reg);
  player4.getCaptionLabel().setSize(28);
  player4.getValueLabel().setFont(reg);
  player4.getValueLabel().setSize(28);
  
  player4color = cp5.addRadioButton("Player 4 Color")
            .setNoneSelectedAllowed(false)
            .setSize(100, 40)
            .setSpacingColumn(0)
            .setPosition(370, 475)
            .setItemsPerRow(4)
            .setColorLabel(color(255))
            .addItem("R3", 0)
            .addItem("B3", 1)
            .addItem("O3", 2)
            .addItem("W3", 3);
  for (Toggle x:player4color.getItems()) {
    x.getCaptionLabel().align(CENTER,CENTER);
    x.getCaptionLabel().setFont(reg);
    x.getCaptionLabel().setSize(24);
    x.setSize(100, 40);
    x.setColorBackground(colorArray[0]);
    x.setColorActive(colorArray[1]);
    x.setColorForeground(colorArray[1]);
  }
  player4color.getItem(0).setColorBackground(color(200));
  player4color.getItem(0).setColorActive(colorArray[3]);
  player4color.getItem(0).setColorForeground(colorArray[3]);
  player4color.getItem(0).getCaptionLabel().setColor(colorArray[3]);
  player4color.getItem(1).setColorBackground(color(200));
  player4color.getItem(1).setColorActive(colorArray[4]);
  player4color.getItem(1).setColorForeground(colorArray[4]);
  player4color.getItem(1).getCaptionLabel().setColor(colorArray[4]);
  player4color.getItem(2).setColorBackground(color(200));
  player4color.getItem(2).setColorActive(colorArray[5]);
  player4color.getItem(2).setColorForeground(colorArray[5]);
  player4color.getItem(2).getCaptionLabel().setColor(colorArray[5]);
  player4color.getItem(3).setColorBackground(color(200));
  player4color.getItem(3).setColorActive(colorArray[6]);
  player4color.getItem(3).setColorForeground(colorArray[6]);
  player4color.getItem(3).getCaptionLabel().setColor(colorArray[6]);
  
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
  numPlayers.show();
  instr_new.changeVisibility(true);
  instr_new.update();
  play.changeVisibility(true);
  play.update();
  
  if (numPlayers.getValue() == 0) {
    player1.show();
    player1color.hideLabels();
    player1color.show();
    player2color.hideLabels();
    player2.hide();
    player2color.hide();
    player3.hide();
    player3color.hideLabels();
    player3color.hide();
    player4.hide();
    player4color.hideLabels();
    player4color.hide();
  }
  else if (numPlayers.getValue() == 1) {
    player1.show();
    player1color.hideLabels();
    player1color.show();
    player2.show();
    player2color.hideLabels();
    player2color.show();
    player3.hide();
    player3color.hideLabels();
    player3color.hide();
    player4.hide();
    player4color.hideLabels();
    player4color.hide();
  }
  else if (numPlayers.getValue() == 2) {
    player1.show();
    player1color.hideLabels();
    player1color.show();
    player2.show();
    player2color.hideLabels();
    player2color.show();
    player3.show();
    player3color.hideLabels();
    player3color.show();
    player4.hide();
    player4color.hideLabels();
    player4color.hide();
  }
  else if (numPlayers.getValue() == 3) {
    player1.show();
    player1color.hideLabels();
    player1color.show();
    player2color.hideLabels();
    player2.show();
    player2color.show();
    player3.show();
    player3color.hideLabels();
    player3color.show();
    player4.show();
    player4color.hideLabels();
    player4color.show();
  }
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
  roll.changeVisibility(false);
  
  rectMode(CENTER);
  fill(colorArray[1]);
  rect(750, 100, 150, 60, 8);
  fill(color(255));
  textAlign(CENTER, CENTER);
  textFont(header);
  textSize(28);
  text("Roll: " + roll_value, 750, 100);
  
  //inner red square
  noStroke();
  fill(colorArray[0]);
  rect(750, 365, 265, 375);
  
  //inner yellow square
  strokeWeight(4);
  stroke(colorArray[1]);
  fill(colorArray[2]);
  rect(750, 365, 240, 350);
  
  //instruction card
  textAlign(CENTER, CENTER);
  fill(colorArray[0]);
  textFont(header, 28);
  text("RESOURCES", 750, 220);
  textAlign(LEFT);
  fill(colorArray[1]);
  textFont(header, 20);
  text("1 road = sleep + textbook", 645, 275);
  text("1 dorm = food + sleep\n         + money + textbook    ", 645, 325);
  text("1 apt = 2 food + 3 money", 645, 400);
  
  textFont(reg);
  instr_game.changeVisibility(true);
  instr_game.update();
  next_turn.changeVisibility(true);
  next_turn.update();
  
  //display player name?
  b.display();
  compete.update();
}


//everything for transition screen between players
void showTransition() {
  background(color(240));
  
  cp5.hide();
  instr_game.changeVisibility(false);
  next_turn.changeVisibility(false);
  
  //inner red square
  rectMode(CENTER);
  noStroke();
  fill(colorArray[0]);
  rect(width/2, height/2, 775, 775);
  
  //inner yellow square
  strokeWeight(4);
  stroke(colorArray[1]);
  fill(colorArray[2]);
  rect(width/2, height/2, 725, 725);
  
  textAlign(CENTER, CENTER);
  fill(colorArray[0]);
  textFont(header, 50);
  text("NEXT TURN", width/2, height/3);
  fill(color(0));
  textFont(reg, 38);
  text("When the next player is ready, click roll.", width/2, height/3 + 100);
  
  roll.changeVisibility(true);
  roll.update();
  
}

//everythng for the end screen
void showEnd() {
  cp5.hide();
  instr_game.changeVisibility(false);
  next_turn.changeVisibility(false);
  roll.changeVisibility(false);
  background(color(240));
  
  //inner red square
  rectMode(CENTER);
  noStroke();
  fill(colorArray[0]);
  rect(width/2, height/2, 775, 775);
  
  //inner yellow square
  strokeWeight(4);
  stroke(colorArray[1]);
  fill(colorArray[2]);
  rect(width/2, height/2, 725, 725);
  
  textAlign(CENTER, CENTER);
  fill(colorArray[0]);
  textFont(header, 50);
  text("GAME OVER", width/2, height/3);
  
  textFont(reg);
  start.changeVisibility(true);
  start.update();
  exit.changeVisibility(true);
  exit.update();

}

//method for dice roll
int rollDice() {
  roll_value = 0;
  int die_one = (int) (Math.random() * 6) + 1;
  int die_two = (int) (Math.random() * 6) + 1;
  roll_value = die_one + die_two;
  return roll_value;
}

//method for assigning player colors
int assignColors(float x) {
  if (x == 0) {
    return 3;
  }
  if (x == 1) {
    return 4;  
  }
  if (x == 2) {
    return 5;  
  }
  else {
    return 6;  
  }
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
    if (numPlayers.getValue() == 0) {
      names[0] = player1.getText();
      playerColors[0] = colorArray[assignColors(player1color.getValue())];
    }
    if (numPlayers.getValue() == 1) {
      names[0] = player1.getText();
      names[1] = player2.getText();
      playerColors[0] = colorArray[assignColors(player1color.getValue())];
      playerColors[1] = colorArray[assignColors(player2color.getValue())];
    }
    if (numPlayers.getValue() == 2) {
      names[0] = player1.getText();
      names[1] = player2.getText();
      names[2] = player3.getText();
      playerColors[0] = colorArray[assignColors(player1color.getValue())];
      playerColors[1] = colorArray[assignColors(player2color.getValue())];
      playerColors[2] = colorArray[assignColors(player3color.getValue())];
    }
    if (numPlayers.getValue() == 3) {
      names[0] = player1.getText();
      names[1] = player2.getText();
      names[2] = player3.getText();
      names[3] = player4.getText();
      playerColors[0] = colorArray[assignColors(player1color.getValue())];
      playerColors[1] = colorArray[assignColors(player2color.getValue())];
      playerColors[2] = colorArray[assignColors(player3color.getValue())];
      playerColors[3] = colorArray[assignColors(player4color.getValue())];
    }
    state = game_screen;  
  }
  if (instr_game.isOver()) {
    state = pause_screen;  
  }
  if (next_turn.isOver()) {
    state = transition_screen;  
  }
  if (roll.isOver()) {
    rollDice();
    state = game_screen;  
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