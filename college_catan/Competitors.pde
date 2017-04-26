
class Competitors{
  ArrayList<Player> Players =new ArrayList<Player>();
  Player cPlayer;//current Player
  
  Competitors(String[] n){
    for(int i = 0; i < n.length; i++){
      Players.add(new Player(n[i]));
    }
    cPlayer = Players.get(0);
    
  }
  
  void update(){
    
    cPlayer.turn();
    
    
  }
  
}
  
  