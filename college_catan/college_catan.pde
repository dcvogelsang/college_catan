//setup for screens
final int main_screen = 0; //main menu screen, opens upon run
final int new_screen = 1; //new game with player setup, navigate from main menu
final int pause_screen = 2; //pause screen with instructions for during game
final int game_screen = 3; //screen for game
final int transition_screen = 4; //screen for between players
final int end_screen = 5; //for game results and restart game
int state = main_screen; //set beginning state to main menu

void setup() {
  size(700,700); //is this size ok?  
}


void draw() {
  background(100);
  
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
//new game or exit here  
}

//everything for new game menu
void showNew() {
//player setup here  
}

//everything for pause screen
void showPause() {
//pause screen with instructions  
}

//everything for actual game play
void showGame() {
//alex put your board stuff here?  
}

//everything for transition screen between players
void showTransition() {
//transition screen with a "I'm ready" button  
}

//everythng for the end screen
void showEnd() {
//results and option to restart or exit  
}