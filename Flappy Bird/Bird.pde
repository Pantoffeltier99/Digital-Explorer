class Bird {
  PVector position; 
  PImage image;
  
  boolean alive = true;
  
  float imageWidth = 100;
  float imageHeight = 75;
  float jumpForce = -8;
  
  final float gravity = 0.5;
  float velocity = 0;
  
  Bird(String imagePath){
    this.image = loadImage(imagePath); 
    this.position = new PVector(250 - imageWidth/2, 400 - imageHeight/2); 
  }
  
  void draw(){
    translate(position.x + imageWidth/2, position.y + imageHeight/2);
    rotate(velocity * 0.1);
    image(image, -imageWidth/2, -imageHeight/2, imageWidth, imageHeight); 
  }
  
  
  void update() {
    velocity += gravity;
    position.y += velocity;
    
    if(position.y > height - imageHeight - 45) {
       position.y = height - imageHeight - 45;
       velocity = 0;
    } else if(position.y < 0) {
       position.y = 0;
       velocity = 0;
    }
  }
  
  void jump() {
    velocity = jumpForce;
  }
  
  void setJumpForce(float newForce) {
    jumpForce = newForce;
  }
  
  boolean isAlive() {
    return this.alive;
  }
  
  void die() {
    this.alive = false; 
  }
  
  Bounds getBounds() {
    return new Bounds(position.x, position.y, imageWidth, imageHeight);
  }
}
