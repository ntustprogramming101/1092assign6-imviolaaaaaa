class Robot extends Enemy{
  
	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  float speed = 2f;
  int cooldownT = 0;
  int row = (int) y / SOIL_SIZE; 
  Laser laser;
  

  void display(){
    
    pushMatrix();
    translate(x + w, y);

    if(speed > 0){
      scale(1, 1);
      image(robot, -w, 0);
    }else{
      scale(-1, 1);
      image(robot, 0, 0);
    }

    popMatrix();
    
    laser.display();
  }
  
  
  void update(){
    
    boolean checkX = (speed > 0 && player.x + player.w/2 > x + HAND_OFFSET_X_FORWARD)||
                     (speed < 0 && player.x + player.w/2 < x - HAND_OFFSET_X_BACKWARD);   
    boolean checkY = abs((player.row - row)) <= PLAYER_DETECT_RANGE_ROW;
    
    boolean isCooled = (cooldownT/LASER_COOLDOWN == 1); 
    if(cooldownT < LASER_COOLDOWN) { cooldownT++; }
     
    if(checkX && checkY){
      
      if(isCooled){
       
        //if is cooled -> then fire the laser
        if(speed > 0){
          laser.fire(x + HAND_OFFSET_X_FORWARD, y + HAND_OFFSET_Y, player.x + player.w/2, player.y + player.h/2);
          cooldownT = 0;
        }else if(speed < 0){
          laser.fire(x + HAND_OFFSET_X_BACKWARD, y + HAND_OFFSET_Y, player.x + player.w/2, player.y + player.h/2);
          cooldownT = 0;
        }
        
      }       
    }else{
      if( x < 0 || x + w > width ){speed *= -1;}
      x += speed; // if player leave the firing area -> keep moving    
    }  
     
         
    laser.update();
    
  }
  
  
  void checkCollision(Player player){
    super.checkCollision(player);
    laser.checkCollision(player);
  }
  
  
  Robot(float x, float y){
    super(x,y);
    laser = new Laser();
  }
  
  
}
