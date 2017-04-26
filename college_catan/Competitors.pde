
class Competetors{
  ArrayList<Player> Players =new ArrayList<Player>();
  
  Competetors(String[] n){
    for(int i = 0; i < n.length; i++){
      Players.add(new Player(n[i]));
    }
    
  }
}
  
  