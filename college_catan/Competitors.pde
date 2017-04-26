
class Competitors{
  ArrayList<Player> Players =new ArrayList<Player>();
  
  Competitors(String[] n){
    for(int i = 0; i < n.length; i++){
      Players.add(new Player(n[i]));
    }
    
  }
}
  
  