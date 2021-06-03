class Cabbage extends Item{

  void display(){    
    if(isAlive){
      image(cabbage, x, y);
    }   
  }
    
    
  void checkCollision(Player player){
    if(isAlive){      
      if(isHit(x, y, w, h, player.x, player.y, player.w, player.h) && player.health < player.PLAYER_MAX_HEALTH){
          player.health ++;
          isAlive = false;
      }     
    }
  }
  
  
  //Constructor
  Cabbage(float x, float y){
    super(x, y);
  }
    
}
