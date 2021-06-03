class Clock extends Item{
  
  void display(){
    if(isAlive){
      image(clock, x, y);
    }
  }


  void checkCollision(Player player){
    if(isAlive){
      if(isHit(x, y, w, h, player.x, player.y, player.w, player.h) && player.health < player.PLAYER_MAX_HEALTH){
          addTime(CLOCK_BONUS_SECONDS);
          isAlive = false;
      }
    }
  }


  //Constructor
  Clock(float x, float y){
    super(x, y);
  }

}
