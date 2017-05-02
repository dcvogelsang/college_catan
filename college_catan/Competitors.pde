class Competitors{
  ArrayList<Player> Players =new ArrayList<Player>();
  Player cPlayer;//current Player
  
  Competitors(String[] n, color[] x){
    for(int i = 0; i < n.length; i++){
      Players.add(new Player(n[i], x[i]));
    }
    cPlayer = Players.get(0);
    
  }
  
  void update(){
    
    cPlayer.turn();
    for(Player p: Players){
      p.display(); 
    }
    
  }
  
}
  
  