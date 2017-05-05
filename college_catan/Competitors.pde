class Competitors{
  ArrayList<Player> Players =new ArrayList<Player>();
  Player cPlayer;//current Player
  int count=0;
  
  Competitors(String[] n, color[] x){
    for(int i = 0; i < n.length; i++){
      Players.add(new Player(n[i], x[i]));
      
    }
    cPlayer = Players.get(0);
    
  }
  
  void update(){
    textAlign(CENTER, CENTER);
    textFont(header, 50);
    fill(colorArray[1]);
    text(cPlayer.name + "'s Turn", 350, 50);
    
    image(loadImage("Food.gif"), 200, height - 110, 75, 100);
    image(loadImage("Money.gif"), 300, height - 110, 75, 100);
    image(loadImage("Sleep.gif"), 400, height - 110, 75, 100);
    image(loadImage("Textbook.gif"), 500, height - 110, 75, 100);
    
    rectMode(CENTER);
    fill(255);
    rect(200, height - 30, 25, 25);
    rect(300, height - 30, 25, 25);
    rect(400, height - 30, 25, 25);
    rect(500, height - 30, 25, 25);
    
    fill(colorArray[1]);
    textFont(header, 20);
    text(cPlayer.resources[0], 200, height - 30);
    text(cPlayer.resources[1], 300, height - 30);
    text(cPlayer.resources[2], 400, height - 30);
    text(cPlayer.resources[3], 500, height - 30);
    
    cPlayer.turn();
    for(Player p: Players){
      p.display(); 
    }
    
  }
  
  
  void nextTurn() {
    if (count<totalPlayers-1){
      count+=1;
      cPlayer=Players.get(count);
    }
    else{
      count=0;
      cPlayer=Players.get(count);
    }
    println(count);
  }
  
  
}
  
  