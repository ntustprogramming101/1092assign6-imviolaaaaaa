class Dinosaur extends Enemy{

  final float TRIGGERED_SPEED_MULTIPLIER = 5; 
  float speed = 1f;  
  int row = (int) y / SOIL_SIZE;
  
    
  void display(){
    
      //filp the image correspond to the moving direction of dinasour
        pushMatrix();
      translate(x + w, y);

      if(speed > 0){
          scale(1, 1);
          image(dinosaur, -w, 0);
      }else{
          scale(-1, 1);
          image(dinosaur, 0, 0);
      }

      popMatrix();
    }


  void update(){
            
    boolean playerDetect = false;
  
    if(row == player.row){
      if( (player.x > x && speed > 0) || (player.x < x && speed < 0) ){
          playerDetect = true;
       }
     }else{playerDetect = false;}  
        
    //if player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left
    if(playerDetect == true && abs(speed) != 5f){
        speed *= TRIGGERED_SPEED_MULTIPLIER;
    }else if(playerDetect == false && abs(speed) == 5f){
        speed /= TRIGGERED_SPEED_MULTIPLIER;
    }
 
      
    //Boundary Detection
    if( x <= 0 || x + w >= width){
         speed *= -1;
    }
    x += speed; 
    
      
  }
  

  //Constructor
  Dinosaur(float x, float y){
    super(x,y);
  }
  
}
